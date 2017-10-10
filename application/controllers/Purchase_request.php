<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Purchase_request extends CORE_Controller
{

    function __construct() {
        parent::__construct('');
        $this->validate_session();

        $this->load->model('Purchase_request_info');
        $this->load->model('Suppliers_model');
        $this->load->model('Tax_types_model');
        $this->load->model('Products_model');
        $this->load->model('Purchase_request_items');
        $this->load->model('Delivery_invoice_model');
        $this->load->model('Departments_model');
        $this->load->model('Company_model');
        $this->load->library('email');
        $this->load->model('Users_model');
        $this->load->model('Request_links_model');


    }

    public function index() {

        //default resources of the active view
        $data['_def_css_files'] = $this->load->view('template/assets/css_files', '', TRUE);
        $data['_def_js_files'] = $this->load->view('template/assets/js_files', '', TRUE);
        $data['_switcher_settings'] = $this->load->view('template/elements/switcher', '', TRUE);
        $data['_side_bar_navigation'] = $this->load->view('template/elements/side_bar_navigation', '', TRUE);
        $data['_top_navigation'] = $this->load->view('template/elements/top_navigation', '', TRUE);


        //data required by active view
        $data['departments']=$this->Departments_model->get_list(
            array('departments.is_active'=>TRUE,'departments.is_deleted'=>FALSE)
        );

        $data['products']=$this->Products_model->get_list(
            null, //no id filter
            array(
                'products.product_id',
                'products.product_code',
                'products.product_desc',
                'products.product_desc1',
                'products.is_tax_exempt',
                'FORMAT(products.sale_price,2)as sale_price',
                'FORMAT(products.purchase_cost,2)as purchase_cost',
                'products.unit_id',
                'products.on_hand',
                'units.unit_name',
                'tax_types.tax_type_id',
                'tax_types.tax_rate'
            ),
            array(
                // parameter (table to join(left) , the reference field)
                array('units','units.unit_id=products.unit_id','left'),
                array('categories','categories.category_id=products.category_id','left'),
                array('tax_types','tax_types.tax_type_id=products.tax_type_id','left')

            )

        );
        $data['suppliers'] = $this->Suppliers_model->get_list('is_deleted = 0');


        $data['title'] = 'Purchase Request';
        (in_array('2-1',$this->session->user_rights)?
            $this->load->view('pr_view', $data)
            :redirect(base_url('profile')));



    }

    function transaction($txn = null,$id_filter=null) {
        switch ($txn){
            case 'pr-for-approval':
                $m_request = $this->Purchase_request_info;
                //$id = 1;
                $response['data'] = $m_request->get_list(
                    array(
                        'pr_info.is_approved' => 0,
                        'pr_info.is_deleted' => 0
                    ),

                    array(
                        'pr_info.*',
                        'CONCAT_WS(" ",ua.user_fname,ua.user_lname) as requested_by'
                    ),

                    array(
                        array('user_accounts as ua','ua.user_id=pr_info.posted_by_user','left')
                    )

                );
                echo json_encode($response);
                break;

            case 'list':  //this returns JSON of Purchase request to be rendered on Datatable
                $m_purchases=$this->Purchase_request_info;
                $response['data']=$this->row_response(
                    array(
                        'pr_info.is_deleted'=>FALSE,
                        'pr_info.is_active'=>TRUE
                    )
                );
                echo json_encode($response);
                break;

            case 'product-lookup':
                $m_products=$this->Products_model;
                $supplier_id=$this->input->get('sid',TRUE);
                $type_id=$this->input->get('type',TRUE);
                $description=$this->input->get('description',TRUE);

                //not 3 means show all product type
                echo json_encode(
                    $m_products->get_list(
                        "(products.product_code LIKE '".$description."%' OR products.product_desc LIKE '%".$description."%') AND products.is_deleted=FALSE ".($supplier_id>0?" AND products.supplier_id=".$supplier_id:"").($type_id==1||$type_id==2?" AND products.refproduct_id=".$type_id:""),

                        array(
                            'products.*',
                            'IFNULL(tax_types.tax_rate,0) as tax_rate',
                            'FORMAT(products.purchase_cost,4)as cost',
                            'units.unit_name'
                        ),

                        array(
                            array('tax_types','tax_types.tax_type_id=products.tax_type_id','left'),
                            array('units','units.unit_id=products.unit_id','left')
                        )
                    )
                );
                break;

            case 'items': //items on the specific PO, loads when edit button is called
                $m_items=$this->Purchase_request_items;

                $response['data']=$m_items->get_list(
                    array('pr_info_id'=>$id_filter),
                    array(
                        'pr_items.*',
                        'products.product_code',
                        'products.product_desc',
                        'units.unit_id',
                        'units.unit_name'
                    ),
                    array(
                        array('products','products.product_id=pr_items.product_id','left'),
                        array('units','units.unit_id=pr_items.unit_id','left')
                    ),
                    'pr_items.pr_item_id DESC'
                );


                echo json_encode($response);
                break;

            case 'create':
                $m_purchases=$this->Purchase_request_info;



                $m_purchases->begin();

                $m_purchases->set('date_posted','NOW()'); //treat NOW() as function and not string
                $m_purchases->reason = $this->input->post('reason',TRUE);
                $m_purchases->remarks = $this->input->post('remarks',TRUE);
                $m_purchases->posted_by_user = $this->session->user_id;
                $m_purchases->save();



                $pr_id=$m_purchases->last_insert_id();
                $m_pr_items=$this->Purchase_request_items;

                $prod_id=$this->input->post('product_id',TRUE);
                $pr_qty=$this->input->post('pr_qty',TRUE);
                $pr_price=$this->input->post('pr_price',TRUE);
                $pr_discount=$this->input->post('pr_discount',TRUE);
                $pr_line_total_discount=$this->input->post('pr_line_total_discount',TRUE);
                $pr_tax_rate=$this->input->post('pr_tax_rate',TRUE);
                $pr_line_total=$this->input->post('pr_line_total',TRUE);
                $pr_tax_amount=$this->input->post('pr_tax_amount',TRUE);
                $pr_non_tax_amount=$this->input->post('pr_non_tax_amount',TRUE);

                for($i=0;$i<count($prod_id);$i++){

                    $m_pr_items->pr_info_id=$pr_id;
                    $m_pr_items->product_id=$this->get_numeric_value($prod_id[$i]);
                    $m_pr_items->pr_qty=$this->get_numeric_value($pr_qty[$i]);
                    $m_pr_items->pr_price=$this->get_numeric_value($pr_price[$i]);
                    $m_pr_items->pr_discount=$this->get_numeric_value($pr_discount[$i]);
                    $m_pr_items->pr_line_total_discount=$this->get_numeric_value($pr_line_total_discount[$i]);
                    $m_pr_items->pr_tax_rate=$this->get_numeric_value($pr_tax_rate[$i]);
                    $m_pr_items->pr_line_total=$this->get_numeric_value($pr_line_total[$i]);
                    $m_pr_items->pr_tax_amount=$this->get_numeric_value($pr_tax_amount[$i]);
                    $m_pr_items->pr_non_tax_amount=$this->get_numeric_value($pr_non_tax_amount[$i]);

                    $m_pr_items->set('unit_id','(SELECT unit_id FROM products WHERE product_id='.(int)$prod_id[$i].')');
                    $m_pr_items->save();
                }

                //update po number base on formatted last insert id
                $m_purchases->pr_no='PR-'.date('Ymd').'-'.$pr_id;
                $m_purchases->modify($pr_id);


                $m_purchases->commit();



                if($m_purchases->status()===TRUE){
                    $response['title'] = 'Success!';
                    $response['stat'] = 'success';
                    $response['msg'] = 'Purchase request successfully created.';

                    $response['row_added'] = $this->row_response($pr_id);

                    echo json_encode($response);
                }


                break;

            case 'update':
                $m_purchases=$this->Purchase_request_info;
                $pr_id=$this->input->post('pr_info_id',TRUE);

                $m_purchases->begin();


                $m_purchases->reason=$this->input->post('reason',TRUE);
                $m_purchases->remarks=$this->input->post('remarks',TRUE);
                $m_purchases->modified_by_user=$this->session->user_id;
                $m_purchases->modify($pr_id);


                $m_pr_items=$this->Purchase_request_items;

                $m_pr_items->delete(array(
                    'pr_info_id' => $pr_id
                )); //delete previous items then insert those new

                $prod_id=$this->input->post('product_id',TRUE);
                $pr_price=$this->input->post('pr_price',TRUE);
                $pr_discount=$this->input->post('pr_discount',TRUE);
                $pr_line_total_discount=$this->input->post('pr_line_total_discount',TRUE);
                $pr_tax_rate=$this->input->post('pr_tax_rate',TRUE);
                $pr_qty=$this->input->post('pr_qty',TRUE);
                $pr_line_total=$this->input->post('pr_line_total',TRUE);
                $pr_tax_amount=$this->input->post('pr_tax_amount',TRUE);
                $pr_non_tax_amount=$this->input->post('pr_non_tax_amount',TRUE);

                for($i=0;$i<count($prod_id);$i++){

                    $m_pr_items->pr_info_id=$pr_id;
                    $m_pr_items->product_id=$this->get_numeric_value($prod_id[$i]);
                    $m_pr_items->pr_price=$this->get_numeric_value($pr_price[$i]);
                    $m_pr_items->pr_discount=$this->get_numeric_value($pr_discount[$i]);
                    $m_pr_items->pr_line_total_discount=$this->get_numeric_value($pr_line_total_discount[$i]);
                    $m_pr_items->pr_tax_rate=$this->get_numeric_value($pr_tax_rate[$i]);
                    $m_pr_items->pr_qty=$this->get_numeric_value($pr_qty[$i]);
                    $m_pr_items->pr_line_total=$this->get_numeric_value($pr_line_total[$i]);
                    $m_pr_items->pr_tax_amount=$this->get_numeric_value($pr_tax_amount[$i]);
                    $m_pr_items->pr_non_tax_amount=$this->get_numeric_value($pr_non_tax_amount[$i]);

                    $m_pr_items->set('unit_id','(SELECT unit_id FROM products WHERE product_id='.(int)$prod_id[$i].')');
                    $m_pr_items->save();
                }

                $m_purchases->commit();



                if($m_purchases->status()===TRUE){
                    $response['title'] = 'Success!';
                    $response['stat'] = 'success';
                    $response['msg'] = 'Purchase request successfully updated.';

                    $response['row_updated'] = $this->row_response($pr_id);

                    echo json_encode($response);
                }


                break;

            case 'delete':
                $m_purchases=$this->Purchase_request_info;
                $pr_info_id=$this->input->post('pr_info_id',TRUE);



                $m_purchases->set('date_deleted','NOW()'); //treat NOW() as function and not string, set date of deletion
                $m_purchases->deleted_by_user=$this->session->user_id; //deleted by user
                $m_purchases->is_deleted=1;
                if($m_purchases->modify($pr_info_id)){
                    $response['title']='Success!';
                    $response['stat']='success';
                    $response['msg']='Purchase request successfully deleted.';
                    echo json_encode($response);
                }
                break;


            case 'mark-approved':
                $m_purchases=$this->Purchase_request_info;
                $pr_info_id=$this->input->post('pr_info_id',TRUE);

                //$m_purchases->set('date_approved','NOW()'); //treat NOW() as function and not string, set date of approval
                //$m_purchases->approved_by_user=$this->session->user_id; //deleted by user
                $m_purchases->is_approved = 1; //1 means approved
                if($m_purchases->modify($pr_info_id)) {
                    $response['title'] = 'Success!';
                    $response['stat'] = 'success';
                    $response['msg'] = 'Purchase request successfully approved.';
                    echo json_encode($response);
                }
                break;

            case 'send-request-link':
                $m_links = $this->Request_links_model;
                $m_supplier = $this->Suppliers_model;

                $supplierid = $this->input->post('supid');
                $pr_id = $this->input->post('pr_id');

                for($i=0;$i < count($supplierid); $i++){
                    $key = md5(uniqid(''));

                    //get email of current supplier
                    $sup_info = $m_supplier->get_list($supplierid[$i]);
                    $email = $sup_info[0]->email_address;

                    if( $email != '' ){

                        $config = Array(
                            'protocol' => 'smtp',
                            'smtp_host' => 'ssl://smtp.googlemail.com',
                            'smtp_port' => 465,
                            'smtp_user' => 'chris14rueda18@gmail.com',
                            'smtp_pass' => '09141991',
                            'smtp_timeout' => 30,
                            'mailtype'  => 'html',
                            'charset' => 'utf-8',
                            'wordwrap' => TRUE
                        );
                        $this->load->library('email', $config);
                        $this->email->set_newline("\r\n");
                        $this->email->set_mailtype("html");

                        //Add file directory if you need to attach a file
                        // $this->email->attach($file_dir_name);

                        $content = 'http://'.$_SERVER['SERVER_NAME'].'/Quotation_request/open/'.$supplierid[$i].'/'.$pr_id.'/'.$key;

                        $this->email->from('nedaprocurement', 'NEDA REGION III');
                        $this->email->to( $email );

                        $this->email->subject('QUOTATION REQUEST');
                        $this->email->message($content);

                        if($this->email->send()){
                            $m_links->set('date_sent','NOW()');
                            $m_links->sent_by_user = $this->session->user_id;
                            $m_links->supplier_id = $supplierid[$i];
                            $m_links->key = $key;
                            $m_links->sent_to_email = $email;
                            $m_links->pr_info_id = $pr_id;
                            $m_links->save();
                        }

                    }



                }

                $response['title']='Success!';
                $response['stat']='success';
                $response['msg']='Successfully requested Quotation to suppliers.';
                echo json_encode($response);

                break;
        }








    }



    function row_response($filter_value){
        return $this->Purchase_request_info->get_list(
            $filter_value,
            array(
                'pr_info.*',
                'CONCAT_WS(" ",ua.user_fname,ua.user_lname) as request_by'
            ),
            array(
                array('user_accounts as ua','ua.user_id=pr_info.posted_by_user','left')
            )
        );
    }
}
