<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Quotation_request extends CORE_Controller
{

    function __construct() {
        parent::__construct('');
        //$this->validate_session();
        $this->load->model(
            array(
                'Request_links_model',
                'Purchase_request_items',
                'Quotation_info_model',
                'Quotation_items'
            )
        );

    }

    public function index() {
        $data['_def_js_files'] = $this->load->view('template/assets/js_files', '', TRUE);

        $data['title'] = 'Invitation';
        $this->load->view('quotation_request_view', $data);

    }


    function open($supplier_id,$pr_info_id,$key){
        $m_request = $this->Request_links_model;

        $request_info = $m_request->get_list(
            array(
                'request_links.supplier_id' => $supplier_id,
                'request_links.key' => $key,
                'request_links.is_supplier_replied' => 0
            ),

            array(
                'request_links.*',
                'CONCAT_WS(" ",ua.user_fname,ua.user_lname) as fullName',
                'pr.pr_no',
                'pr.remarks'
            ),

            array(
                array('user_accounts as ua','request_links.sent_by_user=ua.user_id','left'),
                array('pr_info as pr','pr.pr_info_id=request_links.pr_info_id','left')
            )
        );

        if( count($request_info) > 0 ){
            $m_pr_items = $this->Purchase_request_items;
            //get list of items requested

            $items = $m_pr_items->get_list(
                array(
                    'pr_info_id' => $pr_info_id
                ),
                array(
                    'pr_items.*',
                    'p.*'
                ),
                array(
                    array('products as p','p.product_id=pr_items.product_id','left')
                )

            );

           // $data['_def_js_files'] = $this->load->view('template/assets/js_files', '', TRUE);
            $data['supplier_id'] = $supplier_id;
            $data['pr_info_id'] = $pr_info_id;
            $data['key'] = $key;
            $data['items'] = $items;
            $data['request_info'] = $request_info;
            $this->load->view('quotation_request_view', $data);
        }else{
            echo '<h1>Sorry, this request is not available anymore!</h1>';
        }

    }

    function transaction($txn = null)
    {
        switch ($txn) {
            case 'quotations':
                $m_quote = $this->Quotation_info_model;
                $response['data'] = $m_quote->get_list(
                    array(
                        'quotation_info.is_approved' => 1,
                        'quotation_info.is_active' => 1
                    ),

                    array(
                        'quotation_info.*',
                        'pr.pr_no',
                        's.supplier_name'
                    ),

                    array(
                        array('pr_info as pr','pr.pr_info_id=quotation_info.pr_info_id','left'),
                        array('suppliers as s','s.supplier_id=quotation_info.supplier_id','left')
                    )


                );
                echo json_encode($response);
                break;
            case 'quote-for-approval':
                $m_quote = $this->Quotation_info_model;

                $response['data'] = $m_quote->get_list(
                    array(
                        'quotation_info.is_approved' => 0,
                        'quotation_info.is_active' => 1
                    ),

                    array(
                        'quotation_info.*',
                        'pr.pr_no',
                        's.supplier_name'
                    ),

                    array(
                        array('pr_info as pr','pr.pr_info_id=quotation_info.pr_info_id','left'),
                        array('suppliers as s','s.supplier_id=quotation_info.supplier_id','left')
                    )


                );
                echo json_encode($response);
                break;
            case 'quote':
                $m_quote = $this->Quotation_info_model;
                $m_quote_items = $this->Quotation_items;
                $m_links = $this->Request_links_model;


                $pr_info_id = $this->input->post('prid');
                $supplier_id = $this->input->post('supid');
                $total = $this->input->post('grandtotal');
                $key = $this->input->post('key');


                //check if already submitted
                $req = $m_links->get_list(array(
                    'key' => $key,
                    'is_supplier_replied' => 1
                ));

                if(count($req)>0){
                    $response['title'] = 'Invalid!';
                    $response['stat'] = 'error';
                    $response['msg'] = 'Sorry, you already submitted this quotation.';
                    echo json_encode($response);
                    return;

                }



                $prodid = $this->input->post('prodid');
                $price = $this->input->post('price');
                $qty = $this->input->post('qty');
                $total_price = $this->input->post('total');

                $m_quote->set('date_quoted','NOW()');
                $m_quote->pr_info_id = $pr_info_id;
                $m_quote->request_link_key = $key;
                $m_quote->supplier_id = $supplier_id;
                $m_quote->total_price = $total;
                $m_quote->save();

                $id = $m_quote->last_insert_id();
                $m_quote->quote_no = 'Q-0000000'.$id;
                $m_quote->modify($id);


                //insert items
                for($i=0;$i<count($prodid);$i++){
                    $m_quote_items->quote_id = $id;
                    $m_quote_items->product_id = $prodid[$i];
                    $m_quote_items->quote_qty = $qty[$i];
                    $m_quote_items->qoute_price = $price[$i];
                    $m_quote_items->quote_total_price = $total_price[$i];
                    $m_quote_items->save();
                }




                //update request links status

                $m_links->set('date_replied','NOW()');
                $m_links->is_supplier_replied = 1;
                $m_links->modify(array(
                    'key' => $key
                ));

                $response['title'] = 'Success!';
                $response['stat'] = 'success';
                $response['msg'] = 'Quotation successfully submitted.';
                echo json_encode($response);

                break;

            case 'mark-approved':
                $m_quote=$this->Quotation_info_model;

                $quote_id=$this->input->post('quote_id',TRUE);
                $pr_info_di = $this->input->post('pr_info_id',TRUE);

                $m_quote->is_active = 0;
                $m_quote->modify(
                    array(
                        'pr_info_id' => $pr_info_di
                    )
                );


                $m_quote->is_active = 1;
                $m_quote->is_approved = 1; //1 means approved
                if($m_quote->modify($quote_id)) {
                    $response['title'] = 'Success!';
                    $response['stat'] = 'success';
                    $response['msg'] = 'Quotation successfully approved.';
                    echo json_encode($response);
                }
                break;

        }
    }



}
