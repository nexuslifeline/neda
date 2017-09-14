<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Requisition extends CORE_Controller
{

    function __construct() {
        parent::__construct('');
        $this->validate_session();
        $this->load->model('Tax_types_model');
        $this->load->model('Products_model');
        $this->load->model('Departments_model');
        $this->load->model('Requisition_info_model');
        $this->load->model('Requisition_items_model');
        $this->load->model('Issuance_model');
        $this->load->model('Issuance_item_model');
        $this->load->model('Requisition_items_model');

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


        $data['tax_types']=$this->Tax_types_model->get_list('is_deleted=0');

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

        $data['title'] = 'Purchase Order';
        (in_array('2-1',$this->session->user_rights)?
            $this->load->view('requisition_view', $data)
            :redirect(base_url('dashboard')));



    }

    function transaction($txn = null,$id_filter=null) {
        switch ($txn){
            case 'list':
                $response['data']=$this->row_response(
                    'requisition_info.is_deleted=FALSE AND requisition_info.is_active=TRUE'
                );
                echo json_encode($response);
                break;

            case 'open':
                $response['data']=$this->row_response(
                    'requisition_info.is_deleted=FALSE AND requisition_info.is_active=TRUE AND requisition_info.status=1'

                );
                echo json_encode($response);
                break;

            case 'items': //items on the specific PO, loads when edit button is called
                $m_items=$this->Requisition_items_model;

                $response['data']=$m_items->get_list(
                    array('requisition_id'=>$id_filter),
                    array(
                        'requisition_items.*',
                        'products.product_code',
                        'products.product_desc',
                        'units.unit_id',
                        'units.unit_name'
                    ),
                    array(
                        array('products','products.product_id=requisition_items.product_id','left'),
                        array('units','units.unit_id=requisition_items.unit_id','left')
                    ),
                    'requisition_items.req_item_id DESC'
                );


                echo json_encode($response);
                break;

            case 'create':
                $m_requisitions=$this->Requisition_info_model;


                $m_requisitions->begin();

                $m_requisitions->set('date_created','NOW()'); //treat NOW() as function and not string
                $m_requisitions->purpose=$this->input->post('purpose',TRUE);
                $m_requisitions->department_id=$this->input->post('department_id',TRUE);
                //$m_requisitions->center_code=$this->input->post('center_code',TRUE);
                //$m_requisitions->fund_cluster=$this->input->post('fund_cluster',TRUE);
                $m_requisitions->remarks=$this->input->post('remarks',TRUE);
                $m_requisitions->created_by_user=$this->session->user_id;
                $m_requisitions->save();

                $req_id=$m_requisitions->last_insert_id();
                $m_req_items=$this->Requisition_items_model;

                $prod_id=$this->input->post('product_id',TRUE);
                $req_qty=$this->input->post('req_qty',TRUE);
                $req_cost=$this->input->post('req_cost',TRUE);
                $req_discount=$this->input->post('req_discount',TRUE);
                $req_line_total_discount=$this->input->post('req_line_total_discount',TRUE);
                $req_tax_rate=$this->input->post('req_tax_rate',TRUE);
                $req_line_total=$this->input->post('req_line_total',TRUE);
                $tax_amount=$this->input->post('tax_amount',TRUE);
                $non_tax_amount=$this->input->post('non_tax_amount',TRUE);

                for($i=0;$i<count($prod_id);$i++){

                    $m_req_items->requisition_id=$req_id;
                    $m_req_items->product_id=$this->get_numeric_value($prod_id[$i]);
                    $m_req_items->req_qty=$this->get_numeric_value($req_qty[$i]);
                    $m_req_items->req_cost=$this->get_numeric_value($req_cost[$i]);
                    $m_req_items->req_discount=$this->get_numeric_value($req_discount[$i]);
                    $m_req_items->req_line_total_discount=$this->get_numeric_value($req_line_total_discount[$i]);
                    $m_req_items->req_tax_rate=$this->get_numeric_value($req_tax_rate[$i]);
                    $m_req_items->req_line_total=$this->get_numeric_value($req_line_total[$i]);
                    $m_req_items->tax_amount=$this->get_numeric_value($tax_amount[$i]);
                    $m_req_items->non_tax_amount=$this->get_numeric_value($non_tax_amount[$i]);

                    $m_req_items->set('unit_id','(SELECT unit_id FROM products WHERE product_id='.(int)$prod_id[$i].')');
                    $m_req_items->save();
                }


                //update po number base on formatted last insert id
                $m_requisitions->requisition_no='REQ-'.date('Ymd').'-'.$req_id;
                $m_requisitions->modify($req_id);


                $m_requisitions->commit();



                if($m_requisitions->status()===TRUE){
                    $response['title'] = 'Success!';
                    $response['stat'] = 'success';
                    $response['msg'] = 'Requisition successfully created.';

                    $response['row_added'] = $this->row_response($req_id);

                    echo json_encode($response);
                }


                break;

            case 'update':
                $m_requisitions=$this->Requisition_info_model;
                $req_id=$this->input->post('requisition_id',TRUE);

                //check if already been issued
                $issued = $m_requisitions->get_list(array(
                    'requisition_id' => $req_id,
                    'status' => 0
                ));

                if(count($issued)>0){
                    $response['title'] = 'Warning!';
                    $response['stat'] = 'warning';
                    $response['msg'] = 'Sorry, this requisition record is already been Issued. You are not allowed to modify this record.';
                    echo json_encode($response);
                    return;
                }


                $m_requisitions->begin();
                $m_requisitions->set('date_modified','NOW()'); //treat NOW() as function and not string
                $m_requisitions->purpose=$this->input->post('purpose',TRUE);
                $m_requisitions->department_id=$this->input->post('department_id',TRUE);
                //$m_requisitions->center_code=$this->input->post('center_code',TRUE);
                //$m_requisitions->fund_cluster=$this->input->post('fund_cluster',TRUE);
                $m_requisitions->remarks=$this->input->post('remarks',TRUE);
                $m_requisitions->modified_by_user=$this->session->user_id;
                $m_requisitions->modify($req_id);


                $m_req_items=$this->Requisition_items_model;

                $m_req_items->delete_via_fk($req_id); //delete previous items then insert those new

                $prod_id=$this->input->post('product_id',TRUE);
                $req_cost=$this->input->post('req_cost',TRUE);
                $req_discount=$this->input->post('req_discount',TRUE);
                $req_line_total_discount=$this->input->post('req_line_total_discount',TRUE);
                $req_tax_rate=$this->input->post('req_tax_rate',TRUE);
                $req_qty=$this->input->post('req_qty',TRUE);
                $req_line_total=$this->input->post('req_line_total',TRUE);
                $tax_amount=$this->input->post('tax_amount',TRUE);
                $non_tax_amount=$this->input->post('non_tax_amount',TRUE);

                for($i=0;$i<count($prod_id);$i++){

                    $m_req_items->requisition_id=$req_id;
                    $m_req_items->product_id=$this->get_numeric_value($prod_id[$i]);
                    $m_req_items->req_cost=$this->get_numeric_value($req_cost[$i]);
                    $m_req_items->req_discount=$this->get_numeric_value($req_discount[$i]);
                    $m_req_items->req_line_total_discount=$this->get_numeric_value($req_line_total_discount[$i]);
                    $m_req_items->req_tax_rate=$this->get_numeric_value($req_tax_rate[$i]);
                    $m_req_items->req_qty=$this->get_numeric_value($req_qty[$i]);
                    $m_req_items->req_line_total=$this->get_numeric_value($req_line_total[$i]);
                    $m_req_items->tax_amount=$this->get_numeric_value($tax_amount[$i]);
                    $m_req_items->non_tax_amount=$this->get_numeric_value($non_tax_amount[$i]);

                    $m_req_items->set('unit_id','(SELECT unit_id FROM products WHERE product_id='.(int)$prod_id[$i].')');
                    $m_req_items->save();
                }

                $m_requisitions->commit();



                if($m_requisitions->status()===TRUE){
                    $response['title'] = 'Success!';
                    $response['stat'] = 'success';
                    $response['msg'] = 'Requisition successfully updated.';

                    $response['row_updated'] = $this->row_response($req_id);

                    echo json_encode($response);
                }


                break;

            case 'delete':
                $m_requisitions=$this->Requisition_info_model;
                $requisition_id=$this->input->post('requisition_id',TRUE);

                $m_requisitions->set('date_deleted','NOW()'); //treat NOW() as function and not string, set date of deletion
                $m_requisitions->deleted_by_user=$this->session->user_id; //deleted by user
                $m_requisitions->is_deleted=1;
                if($m_requisitions->modify($requisition_id)){
                    $response['title']='Success!';
                    $response['stat']='success';
                    $response['msg']='Requisition successfully deleted.';
                    echo json_encode($response);
                }
                break;

            case 'review-requisitions':

                $id = $this->input->get('id');
                $m_requisitions = $this->Requisition_info_model;
                $m_req_items = $this->Requisition_items_model;

                $data['requisition_info'] = $m_requisitions->get_list(
                    $id,
                    array(
                        'requisition_info.*',
                        'd.department_name'
                    ),
                    array(
                        array('departments as d','d.department_id=requisition_info.department_id','left')
                    )
                );

                $data['items'] = $m_req_items->get_requisition_items( $id );

                $this->load->view('template/rpt_requisition_review',$data);
                break;

            case 'issue-requisition':
                $m_issuance=$this->Issuance_model;
                $m_issue_items=$this->Issuance_item_model;
                $m_requisitions = $this->Requisition_info_model;
                $m_req_items=$this->Requisition_items_model;

                $m_issuance->begin();

                $requisition_id = $this->input->post('requisition_id');
                $department_id = $this->input->post('department_id');
                $purpose = $this->input->post('purpose');

                $product_id = $this->input->post('product_id');
                $request_qty = $this->input->post('request_qty');
                $unit_id = $this->input->post('unit_id');
                $on_hand=$this->input->post('on_hand',TRUE);


                $m_issuance->set('date_created','NOW()'); //treat NOW() as function and not string
                $m_issuance->set('date_issued','NOW()');
                $m_issuance->posted_by_user = $this->session->user_id;
                $m_issuance->issued_department_id = $department_id;
                $m_issuance->requisition_id = $requisition_id;
                $m_issuance->remarks = $purpose;
                $m_issuance->save();

                $issuance_id = $m_issuance->last_insert_id();

                $m_issuance->slip_no='SLP-'.date('Ymd').'-'.$issuance_id;
                $m_issuance->modify($issuance_id);

                for($i=0;$i<count($product_id);$i++){
                    $m_issue_items->issuance_id = $issuance_id;
                    $m_issue_items->product_id = $product_id[$i];
                    $m_issue_items->issue_qty = $this->get_numeric_value($request_qty[$i]);
                    $m_issue_items->unit_id = $unit_id[$i];
                    $m_issue_items->save();
                }

                $m_products=$this->Products_model;
                $tmp_prod_id = $m_issue_items->get_list(
                    array('issuance_id'=>$issuance_id),
                    'product_id'
                );

                //mark if available
                for($i=0;$i<count($product_id);$i++){
                    if($this->get_numeric_value($on_hand[$i])<=0){
                        $m_req_items->is_available = 0;
                        $m_req_items->modify(
                            array(
                                'product_id' => $product_id[$i],
                                'requisition_id' => $requisition_id
                            )
                        );
                    }
                }

                for($i=0;$i<count($tmp_prod_id);$i++) {
                    $m_products->on_hand=$m_products->get_product_qty($this->get_numeric_value($tmp_prod_id[$i]->product_id));
                    $m_products->modify($this->get_numeric_value($tmp_prod_id[$i]->product_id));
                }

                //mark requisition as closed
                $m_requisitions->status = 0;
                $m_requisitions->modify($requisition_id);


                $m_issuance->commit();

                if($m_issuance->status()===TRUE){
                    $response['title'] = 'Success!';
                    $response['stat'] = 'success';
                    $response['msg'] = 'Items successfully issued.';
                    //$response['row_added']=$this->response_rows($issuance_id);
                    echo json_encode($response);
                }

                break;

            case 'requisition-slip':
                $m_requisition = $this->Requisition_items_model;
                $m_issuance = $this->Issuance_model;

                $requisition_id = $this->input->get('id');

                $slip_no = $m_issuance->get_list(
                    array(
                        'requisition_id' => $requisition_id
                    )
                );

                $data['slipno'] = (count($slip_no)>0?$slip_no[0]->slip_no:'');
                $data['items'] = $m_requisition->get_requisition_issuance($requisition_id);
                //print_r($data);

                $this->load->view('template/rpt_requisition_slip',$data);
                break;

        }








    }



    function row_response($filter_value){
        return $this->Requisition_info_model->get_list(
            $filter_value,
            array(
                'requisition_info.*',
                'departments.department_name',
                "IF(requisition_info.status,'Open','Closed') as stat"
            ),
            array(
               array('departments','departments.department_id=requisition_info.department_id','left')
            )
        );
    }
}
