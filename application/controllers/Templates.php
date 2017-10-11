<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Templates extends CORE_Controller {
    function __construct() {
        parent::__construct('');

        $this->validate_session();

        $this->load->model('Purchases_model');
        $this->load->model('Purchase_items_model');
        $this->load->model('Delivery_invoice_model');
        $this->load->model('Delivery_invoice_item_model');
        $this->load->model('Issuance_model');
        $this->load->model('Issuance_item_model');
        $this->load->model('Adjustment_model');
        $this->load->model('Adjustment_item_model');
        $this->load->model('Payment_method_model');
        $this->load->model('Suppliers_model');
        $this->load->model('Payable_payment_model');
        $this->load->model('User_group_right_model');
        $this->load->model('Company_model');
        $this->load->model('Products_model');
        $this->load->model('Departments_model');
        $this->load->model('Payable_payment_list_model');
        $this->load->model('Purchase_request_info');
        $this->load->model('Purchase_request_items');
        $this->load->model('Quotation_info_model');
        $this->load->model('Quotation_items');
        $this->load->library('M_pdf');
    }

    public function index() {

    }


    function layout($layout=null,$filter_value=null,$type=null){
        switch($layout){
            case 'quote': //purchase order
                $m_quote=$this->Quotation_info_model;
                $m_quote_items=$this->Quotation_items;
                $m_company=$this->Company_model;
                $type=$this->input->get('type',TRUE);

                $info = $m_quote->get_list(
                    $filter_value,
                    array(
                        'quotation_info.*'
                    )
                );

                $company=$m_company->get_list();

                $data['quote_info']=$info[0];
                //$data['total_in_words'] = $this->convertNumberToWord($info[0]->total_after_tax);
                $data['company_info']=$company[0];
                $data['quote_items']=$m_quote_items->get_list(
                    array('quote_id'=>$filter_value),
                    'quotation_items.*,products.product_code,products.product_desc,units.unit_name',

                    array(
                        array('products','products.product_id=quotation_items.product_id','left'),
                        array('units','units.unit_id=products.unit_id','left')
                    )

                );


                //show only inside grid with menu buttons
                if($type=='fullview'||$type==null){
                    echo $this->load->view('template/quote_content_new',$data,TRUE);
                    /*echo $this->load->view('template/pr_content_menus',$data,TRUE);*/
                }

                //for approval view on DASHBOARD
                if($type=='approval'){

                    //echo '<br /><hr /><center><strong>Purchase Order for Approval</strong></center><hr />';
                    echo '<br />';
                    echo $this->load->view('template/quote_content_new',$data,TRUE);
                    /* echo $this->load->view('template/po_content_approval_menus',$data,TRUE);*/
                }

                //show only inside grid
                if($type=='contentview'){
                    echo $this->load->view('template/quote_content_new',$data,TRUE);
                }

                //download pdf
                if($type=='pdf'){
                    $file_name=$info[0]->po_no;
                    //$pdfFilePath = $file_name.".pdf"; //generate filename base on id
                    //$pdf = $this->m_pdf->load(); //pass the instance of the mpdf class
                    $this->load->view('template/po_content_new',$data); //load the template
                    //$pdf->setFooter('{PAGENO}');
                    //$pdf->WriteHTML($content);
                    //download it.
                    //$pdf->Output($pdfFilePath,"D");

                }

                //preview on browser
                if($type=='preview'){
                    $this->load->view('template/po_content_new',$data); //load the template
                    //$pdf->setFooter('{PAGENO}');
                }



                break;

            case 'pr': //purchase order
                $m_pr=$this->Purchase_request_info;
                $m_pr_items=$this->Purchase_request_items;
                $m_company=$this->Company_model;
                $type=$this->input->get('type',TRUE);

                $info = $m_pr->get_list(
                    $filter_value,
                    array(
                        'pr_info.*'
                    )
                );

                $company=$m_company->get_list();

                $data['pr_info']=$info[0];
                //$data['total_in_words'] = $this->convertNumberToWord($info[0]->total_after_tax);
                $data['company_info']=$company[0];
                $data['pr_items']=$m_pr_items->get_list(
                    array('pr_info_id'=>$filter_value),
                    'pr_items.*,products.product_code,products.product_desc,units.unit_name',

                    array(
                        array('products','products.product_id=pr_items.product_id','left'),
                        array('units','units.unit_id=products.unit_id','left')
                    )

                );


                //show only inside grid with menu buttons
                if($type=='fullview'||$type==null){
                    echo $this->load->view('template/pr_content_new',$data,TRUE);
                    /*echo $this->load->view('template/pr_content_menus',$data,TRUE);*/
                }

                //for approval view on DASHBOARD
                if($type=='approval'){

                    //echo '<br /><hr /><center><strong>Purchase Order for Approval</strong></center><hr />';
                    echo '<br />';
                    echo $this->load->view('template/pr_content_new',$data,TRUE);
                   /* echo $this->load->view('template/po_content_approval_menus',$data,TRUE);*/
                }

                //show only inside grid
                if($type=='contentview'){
                    echo $this->load->view('template/po_content_new',$data,TRUE);
                }

                //download pdf
                if($type=='pdf'){
                    $file_name=$info[0]->po_no;
                    //$pdfFilePath = $file_name.".pdf"; //generate filename base on id
                    //$pdf = $this->m_pdf->load(); //pass the instance of the mpdf class
                    $this->load->view('template/po_content_new',$data); //load the template
                    //$pdf->setFooter('{PAGENO}');
                    //$pdf->WriteHTML($content);
                    //download it.
                    //$pdf->Output($pdfFilePath,"D");

                }

                //preview on browser
                if($type=='preview'){
                    $this->load->view('template/po_content_new',$data); //load the template
                    //$pdf->setFooter('{PAGENO}');
                }



                break;

            case 'po': //purchase order
                        $m_purchases=$this->Purchases_model;
                        $m_po_items=$this->Purchase_items_model;
                        $m_company=$this->Company_model;
                        $type=$this->input->get('type',TRUE);

                        $info=$m_purchases->get_list(
                                $filter_value,
                                'purchase_order.*,CONCAT_WS(" ",purchase_order.terms,purchase_order.duration)as term_description,suppliers.supplier_name,suppliers.address,suppliers.email_address,suppliers.contact_no,suppliers.tin_no',
                                array(
                                    array('suppliers','suppliers.supplier_id=purchase_order.supplier_id','left')
                                )
                            );

                        $company=$m_company->get_list();

                        $data['purchase_info']=$info[0];
                        $data['total_in_words'] = $this->convertNumberToWord($info[0]->total_after_tax);
                        $data['company_info']=$company[0];
                        $data['po_items']=$m_po_items->get_list(
                                array('purchase_order_id'=>$filter_value),
                                'purchase_order_items.*,products.product_code,products.product_desc,units.unit_name',

                                array(
                                    array('products','products.product_id=purchase_order_items.product_id','left'),
                                    array('units','units.unit_id=purchase_order_items.unit_id','left')
                                )
                                
                            );


                        //show only inside grid with menu buttons
                        if($type=='fullview'||$type==null){
                            echo $this->load->view('template/po_content_new',$data,TRUE);
                            echo $this->load->view('template/po_content_menus',$data,TRUE);
                        }

                        //for approval view on DASHBOARD
                        if($type=='approval'){

                            //echo '<br /><hr /><center><strong>Purchase Order for Approval</strong></center><hr />';
                            echo '<br />';
                            echo $this->load->view('template/po_content_new',$data,TRUE);
                            echo $this->load->view('template/po_content_approval_menus',$data,TRUE);
                        }

                        //show only inside grid
                        if($type=='contentview'){
                            echo $this->load->view('template/po_content_new',$data,TRUE);
                        }

                        //download pdf
                        if($type=='pdf'){
                            $file_name=$info[0]->po_no;
                            //$pdfFilePath = $file_name.".pdf"; //generate filename base on id
                            //$pdf = $this->m_pdf->load(); //pass the instance of the mpdf class
                            $this->load->view('template/po_content_new',$data); //load the template
                            //$pdf->setFooter('{PAGENO}');
                            //$pdf->WriteHTML($content);
                            //download it.
                            //$pdf->Output($pdfFilePath,"D");

                        }

                        //preview on browser
                        if($type=='preview'){
                            $this->load->view('template/po_content_new',$data); //load the template
                            //$pdf->setFooter('{PAGENO}');
                        }



                        break;


            //****************************************************
            case 'dr': //delivery invoice
                        $m_delivery=$this->Delivery_invoice_model;
                        $m_dr_items=$this->Delivery_invoice_item_model;
                        $m_company=$this->Company_model;
                        $type=$this->input->get('type',TRUE);


                        $info=$m_delivery->get_list(
                            $filter_value,

                            'delivery_invoice.*,departments.department_name,purchase_order.po_no,purchase_order.date_created as po_date,CONCAT_WS(" ",delivery_invoice.terms,delivery_invoice.duration)as term_description,
                            suppliers.supplier_name,suppliers.address,suppliers.email_address,suppliers.contact_no',

                            array(
                                array('suppliers','suppliers.supplier_id=delivery_invoice.supplier_id','left'),
                                array('purchase_order','purchase_order.purchase_order_id=delivery_invoice.purchase_order_id','left'),
                                array('departments','departments.department_id=delivery_invoice.department_id','left')
                            )
                        );

                        $company=$m_company->get_list();

                        $data['delivery_info']=$info[0];
                        $data['company_info']=$company[0];
                        $data['dr_items']=$m_dr_items->get_list(
                            array('dr_invoice_id'=>$filter_value),
                            'delivery_invoice_items.*,products.product_code,products.product_desc,units.unit_name',
                            array(
                                array('products','products.product_id=delivery_invoice_items.product_id','left'),
                                array('units','units.unit_id=delivery_invoice_items.unit_id','left')
                            )
                        );

                        //show only inside grid with menu button
                        if($type=='fullview'||$type==null){
                            echo $this->load->view('template/dr_content',$data,TRUE);
                            echo $this->load->view('template/dr_content_menus',$data,TRUE);
                        }

                       /* //show only inside grid without menu button
                        if($type=='contentview'){
                            echo $this->load->view('template/dr_content',$data,TRUE);
                        }


                        //download pdf
                        if($type=='pdf'){
                            $file_name=$info[0]->dr_invoice_no;
                            $pdfFilePath = $file_name.".pdf"; //generate filename base on id
                            $pdf = $this->m_pdf->load(); //pass the instance of the mpdf class
                            $content=$this->load->view('template/dr_content',$data,TRUE); //load the template
                            $pdf->setFooter('{PAGENO}');
                            $pdf->WriteHTML($content);
                            //download it.
                            $pdf->Output($pdfFilePath,"D");

                        }*/

                        //preview on browser
                        if($type=='preview'){
                            $file_name=$info[0]->dr_invoice_no;
                            $pdfFilePath = $file_name.".pdf"; //generate filename base on id
                          /*  $pdf = $this->m_pdf->load(); //pass the instance of the mpdf class*/
                            $this->load->view('template/dr_content',$data); //load the template
                          /*  $pdf->setFooter('{PAGENO}');
                            $pdf->WriteHTML($content);
                            //download it.
                            $pdf->Output();*/
                        }

                        break;
                break;


            //****************************************************
            case 'issuance': //delivery invoice
                $m_issuance=$this->Issuance_model;
                $m_dr_items=$this->Issuance_item_model;
                $m_company=$this->Company_model;
                $type=$this->input->get('type',TRUE);

                $info=$m_issuance->get_list(
                    $filter_value,
                    'issuance_info.*,departments.department_name',
                    array(
                        array('departments','departments.department_id=issuance_info.issued_department_id','left')
                    )
                );

                $company=$m_company->get_list();

                $data['issuance_info']=$info[0];
                $data['company_info']=$company[0];
                $data['issue_items']=$m_dr_items->get_list(
                    array('issuance_items.issuance_id'=>$filter_value),
                    'issuance_items.*,products.product_desc,units.unit_name',
                    array(
                        array('products','products.product_id=issuance_items.product_id','left'),
                        array('units','units.unit_id=issuance_items.unit_id','left')
                    )
                );



                //show only inside grid with menu button
                if($type=='fullview'||$type==null){
                    echo $this->load->view('template/issue_content',$data,TRUE);
                    echo $this->load->view('template/issue_content_menus',$data,TRUE);
                }

                //show only inside grid without menu button
                if($type=='contentview'){
                    echo $this->load->view('template/issue_content',$data,TRUE);
                }


                //download pdf
                if($type=='pdf'){
                    $file_name=$info[0]->slip_no;
                    $pdfFilePath = $file_name.".pdf"; //generate filename base on id
                    $pdf = $this->m_pdf->load(); //pass the instance of the mpdf class
                    $content=$this->load->view('template/issue_content',$data,TRUE); //load the template
                    $pdf->setFooter('{PAGENO}');
                    $pdf->WriteHTML($content);
                    //download it.
                    $pdf->Output($pdfFilePath,"D");

                }

                //preview on browser
                if($type=='preview'){
                    $file_name=$info[0]->slip_no;
                    $pdfFilePath = $file_name.".pdf"; //generate filename base on id
                    $pdf = $this->m_pdf->load(); //pass the instance of the mpdf class
                    $content=$this->load->view('template/issue_content',$data,TRUE); //load the template
                    $pdf->setFooter('{PAGENO}');
                    $pdf->WriteHTML($content);
                    //download it.
                    $pdf->Output();
                }

                break;


            //****************************************************
            case 'adjustments': //delivery invoice
                $m_adjustment=$this->Adjustment_model;
                $m_adjustment_items=$this->Adjustment_item_model;
                $m_company=$this->Company_model;
                $type=$this->input->get('type',TRUE);

                $info=$m_adjustment->get_list(
                    $filter_value,
                    'adjustment_info.*,departments.department_name',
                    array(
                        array('departments','departments.department_id=adjustment_info.department_id','left')
                    )
                );

                $company=$m_company->get_list();

                $data['adjustment_info']=$info[0];
                $data['company_info']=$company[0];
                $data['adjustment_items']=$m_adjustment_items->get_list(
                    array('adjustment_items.adjustment_id'=>$filter_value),
                    'adjustment_items.*,products.product_desc,units.unit_name',
                    array(
                        array('products','products.product_id=adjustment_items.product_id','left'),
                        array('units','units.unit_id=adjustment_items.unit_id','left')
                    )
                );



                //show only inside grid with menu button
                if($type=='fullview'||$type==null){
                    echo $this->load->view('template/adjustment_content',$data,TRUE);
                    echo $this->load->view('template/adjustment_content_menus',$data,TRUE);
                }

                //show only inside grid without menu button
                if($type=='contentview'){
                    echo $this->load->view('template/adjustment_content',$data,TRUE);
                }


                //download pdf
                if($type=='pdf'){
                    $file_name=$info[0]->adjustment_code;
                    $pdfFilePath = $file_name.".pdf"; //generate filename base on id
                    $pdf = $this->m_pdf->load(); //pass the instance of the mpdf class
                    $content=$this->load->view('template/adjustment_content',$data,TRUE); //load the template
                    $pdf->setFooter('{PAGENO}');
                    $pdf->WriteHTML($content);
                    //download it.
                    $pdf->Output($pdfFilePath,"D");

                }

                //preview on browser
                if($type=='preview'){
                    $file_name=$info[0]->slip_no;
                    $pdfFilePath = $file_name.".pdf"; //generate filename base on id
                    $pdf = $this->m_pdf->load(); //pass the instance of the mpdf class
                    $content=$this->load->view('template/adjustment_content',$data,TRUE); //load the template
                    $pdf->setFooter('{PAGENO}');
                    $pdf->WriteHTML($content);
                    //download it.
                    $pdf->Output();
                }

                break;


            case 'supplier':
                $supplier_id=$filter_value;
                $m_suppliers=$this->Suppliers_model;
                $m_purchases=$this->Purchases_model;

                //supplier info
                $supplier_info=$m_suppliers->get_list(
                    $supplier_id,
                    array(
                        'suppliers.*',
                        /*'supplier_photos.photo_path',*/
                        'tax_types.tax_type',
                        'CONCAT_WS(" ",user_accounts.user_fname,user_accounts.user_lname)as user',
                        'DATE_FORMAT(suppliers.date_created,"%m/%d/%Y %r")as date_added',
                    ),
                    array(
                        /*array('supplier_photos','supplier_photos.supplier_id=suppliers.supplier_id','left'),*/
                        array('user_accounts','user_accounts.user_id=suppliers.posted_by_user','left'),
                        array('tax_types','tax_types.tax_type_id=suppliers.tax_type_id','left')
                    )
                );
                $data['supplier_info']=$supplier_info[0];
                //**********************************************************************

                //list of purchase order that are not closed
                $purchases=$m_purchases->get_list(
                    'purchase_order.supplier_id='.$supplier_id.' AND purchase_order.is_deleted=FALSE AND purchase_order.is_active=TRUE AND (purchase_order.order_status_id=1 OR purchase_order.order_status_id=3)',

                    array(
                        'purchase_order.*',
                        'CONCAT_WS(" ",purchase_order.terms,purchase_order.duration)as term_description',
                        'order_status.order_status',
                        'approval_status.approval_status'
                    ),

                    array(
                        array('order_status','order_status.order_status_id=purchase_order.order_status_id','left'),
                        array('approval_status','approval_status.approval_id=purchase_order.approval_id','left')
                    )

                );
                $data['purchases']=$purchases;

                //get details of last active payment
                $m_payment=$this->Payable_payment_model;
                $recent_payment=$m_payment->get_list(

                    array(
                        'payable_payments.supplier_id'=>$supplier_id,
                        'payable_payments.is_active'=>TRUE,
                        'payable_payments.is_deleted'=>FALSE
                    )
                    ,

                    'payable_payments.receipt_no,DATE_FORMAT(payable_payments.date_paid,"%m/%d/%Y")as date_paid,payable_payments.total_paid_amount',
                    null,'payable_payments.payment_id DESC',null,TRUE,1

                );

                $data['recent_payment']=(count($recent_payment)>0?$recent_payment:'');
                //shows when Expand Icon is click on Supplier Management


                $data['invoice']=$m_suppliers->get_list_supplier_invoice($supplier_id);
                $data['payment']= $m_suppliers->get_supplier_payment($supplier_id);
                $content=$this->load->view('template/supplier_expandable_details',$data,TRUE);
                echo $content;

                break;


            case 'ap-journal-for-review':
                $purchase_invoice_id=$this->input->get('id',TRUE);

                $m_suppliers=$this->Suppliers_model;
                $m_accounts=$this->Account_title_model;
                $m_purchases_items=$this->Delivery_invoice_item_model;
                $m_purchases_info=$this->Delivery_invoice_model;
                $m_departments=$this->Departments_model;

                $purchase_info=$m_purchases_info->get_list(
                    array(
                        'delivery_invoice.is_active'=>TRUE,
                        'delivery_invoice.is_deleted'=>FALSE,
                        'delivery_invoice.dr_invoice_id'=>$purchase_invoice_id
                    ),

                    array(
                        'delivery_invoice.dr_invoice_id',
                        'delivery_invoice.purchase_order_id',
                        'delivery_invoice.dr_invoice_no',
                        'delivery_invoice.supplier_id',
                        'delivery_invoice.department_id',
                        'delivery_invoice.external_ref_no',
                        'delivery_invoice.remarks',
                        'CONCAT_WS(" ",delivery_invoice.terms,delivery_invoice.duration)as term_description',
                        'DATE_FORMAT(delivery_invoice.date_delivered,"%m/%d/%Y")as date_delivered',
                        'DATE_FORMAT(delivery_invoice.date_created,"%m/%d/%Y %r")as date_created',
                        'suppliers.supplier_name',
                        'suppliers.address',
                        'suppliers.email_address',
                        'suppliers.contact_no',
                        'purchase_order.po_no',
                        'CONCAT_WS(" ",user_accounts.user_fname,user_accounts.user_lname)as posted_by'
                    ),

                    array(
                        array('suppliers','suppliers.supplier_id=delivery_invoice.supplier_id','left'),
                        array('purchase_order','purchase_order.purchase_order_id=delivery_invoice.purchase_order_id','left'),
                        array('user_accounts','user_accounts.user_id=delivery_invoice.posted_by_user','left')
                    )

                );
                $data['purchase_info']=$purchase_info[0];

                $data['departments']=$m_departments->get_list('is_active=TRUE AND is_deleted=FALSE');

                $data['suppliers']=$m_suppliers->get_list(
                    array(
                        'suppliers.is_active'=>TRUE,
                        'suppliers.is_deleted'=>FALSE
                    ),

                    array(
                        'suppliers.supplier_id',
                        'suppliers.supplier_name'
                    )
                );
                $data['entries']=$m_purchases_info->get_journal_entries($purchase_invoice_id);
                $data['accounts']=$m_accounts->get_list(
                    array(
                        'account_titles.is_active'=>TRUE,
                        'account_titles.is_deleted'=>FALSE
                    )
                );
                $data['items']=$m_purchases_items->get_list(
                    array(
                        'delivery_invoice_items.dr_invoice_id'=>$purchase_invoice_id
                    ),

                    array(
                        'delivery_invoice_items.*',
                        'products.product_desc',
                        'IFNULL(m.po_price,0) AS po_price'
                    ),

                    array(
                        array('delivery_invoice','delivery_invoice.dr_invoice_id=delivery_invoice_items.dr_invoice_id','left'),
                        array('products','products.product_id=delivery_invoice_items.product_id','left'),
                        array('(SELECT po_price,purchase_order_id,product_id FROM purchase_order_items as poi WHERE purchase_order_id='.$purchase_info[0]->purchase_order_id.' GROUP BY poi.product_id) as m','m.purchase_order_id=delivery_invoice.purchase_order_id AND delivery_invoice_items.product_id=m.product_id','left')
                    )

                );

                //validate if customer is not deleted
                $valid_supplier=$m_suppliers->get_list(
                    array(
                        'supplier_id'=>$purchase_info[0]->supplier_id,
                        'is_active'=>TRUE,
                        'is_deleted'=>FALSE
                    )
                );
                $data['valid_particular']=(count($valid_supplier)>0);



                echo $this->load->view('template/ap_journal_for_review',$data,TRUE); //details of the journal


                break;

            case 'ar-journal-for-review':
                $sales_invoice_id=$this->input->get('id',TRUE);

                $m_customers=$this->Customers_model;
                $m_accounts=$this->Account_title_model;
                $m_sales_items=$this->Sales_invoice_item_model;
                $m_sales_invoice=$this->Sales_invoice_model;
                $m_departments=$this->Departments_model;

                $sales_info=$m_sales_invoice->get_list(
                    array(
                        'sales_invoice.is_active'=>TRUE,
                        'sales_invoice.is_deleted'=>FALSE,
                        'sales_invoice.sales_invoice_id'=>$sales_invoice_id
                    ),

                    array(
                        'sales_invoice.sales_invoice_id',
                        'sales_invoice.sales_inv_no',
                        'sales_invoice.customer_id',
                        'sales_invoice.department_id',
                        'sales_invoice.remarks',
                        'DATE_FORMAT(sales_invoice.date_invoice,"%m/%d/%Y")as date_invoice',
                        'DATE_FORMAT(sales_invoice.date_created,"%m/%d/%Y %r")as date_created',
                        'customers.customer_name',
                        'customers.address',
                        'customers.email_address',
                        'customers.contact_no',
                        'sales_order.so_no',
                        'CONCAT_WS(" ",user_accounts.user_fname,user_accounts.user_lname)as posted_by'
                    ),

                    array(
                        array('customers','customers.customer_id=sales_invoice.customer_id','left'),
                        array('sales_order','sales_order.sales_order_id=sales_invoice.sales_order_id','left'),
                        array('user_accounts','user_accounts.user_id=sales_invoice.posted_by_user','left')
                    )

                );
                $data['sales_info']=$sales_info[0];

                $data['departments']=$m_departments->get_list(array('is_active'=>TRUE,'is_deleted'=>FALSE));

                $data['customers']=$m_customers->get_list(
                    array(
                        'customers.is_active'=>TRUE,
                        'customers.is_deleted'=>FALSE
                    ),

                    array(
                        'customers.customer_id',
                        'customers.customer_name'
                    )
                );
                $data['entries']=$m_sales_invoice->get_journal_entries($sales_invoice_id);
                $data['accounts']=$m_accounts->get_list(
                    array(
                        'account_titles.is_active'=>TRUE,
                        'account_titles.is_deleted'=>FALSE
                    )
                );
                $data['items']=$m_sales_items->get_list(
                    array(
                        'sales_invoice_items.sales_invoice_id'=>$sales_invoice_id
                    ),

                    array(
                        'sales_invoice_items.*',
                        'products.product_desc'
                    ),

                    array(
                        array('products','products.product_id=sales_invoice_items.product_id','left')
                    )

                );


                //validate if customer is not deleted
                $valid_customer=$m_customers->get_list(
                    array(
                        'customer_id'=>$sales_info[0]->customer_id,
                        'is_active'=>TRUE,
                        'is_deleted'=>FALSE
                    )
                );
                $data['valid_particular']=(count($valid_customer)>0);





                echo $this->load->view('template/ar_journal_for_review',$data,TRUE); //details of the journal


                break;

            case 'user-rights':
                $m_rights=$this->User_group_right_model;

                $id=$this->input->get('id',TRUE);

                $data['rights']=$m_rights->get_user_group_rights($id);
                $data['user_group_id']=$id;

                $this->load->view('template/user_group_rights',$data);
                break;


            case 'inventory':
                $m_products=$this->Products_model;
                $type=$this->input->get('type',TRUE);
                $date=$this->input->get('date',TRUE);
                $format=$this->input->get('format',TRUE);

                if($type=='preview') {
                   

                    if($format==2){
                        $data['date']=$date;
                        $data['products']=$m_products->get_all_items_inventory(date('Y-m-d',strtotime($date)));
                        $this->load->view('template/batch_inventory_report',$data); //load the template
                    }else{
                        $data['date']=$date;

                        $data['prod_types']=$this->Refproduct_model->get_list('refproduct_id=1 OR refproduct_id=2');
                        $data['products']=$m_products->get_all_items_inventory(date('Y-m-d',strtotime($date)));
                        $this->load->view('template/batch_inventory_per_type_report',$data); //load the template
                    }

                    
                }

                break;

            case 'supplier-subsidiary' :
                $type=$this->input->get('type',TRUE);
                $supplier_Id=$this->input->get('supplierId',TRUE);
                $account_Id=$this->input->get('accountId',TRUE);
                $start_Date=date('Y-m-d',strtotime($this->input->get('startDate',TRUE)));
                $end_Date=date('Y-m-d',strtotime($this->input->get('endDate',TRUE)));

                $m_journal_info=$this->Journal_info_model;
                $m_company_info=$this->Company_model;

                $journal_info=$m_journal_info->get_list(
                    array('journal_info.is_deleted'=>FALSE, 'journal_info.supplier_id'=>$supplier_Id, 'journal_accounts.account_id'=>$account_Id),
                    'supplier_name, account_title',
                    array(
                        array('suppliers','suppliers.supplier_id=journal_info.supplier_id','left'),
                        array('journal_accounts','journal_accounts.journal_id=journal_info.journal_id','left'),
                        array('account_titles','account_titles.account_id=journal_accounts.account_id','left')
                    )
                );

                $company_info=$m_company_info->get_list();

                $data['company_info']=$company_info[0];
                if (isset($journal_info[0])) 
                {

                    $data['supplier_subsidiary']=$m_journal_info->get_supplier_subsidiary($supplier_Id,$account_Id,$start_Date,$end_Date);
                    $data['company_info']=$company_info[0];
                    $data['subsidiary_info']=$journal_info[0];
                    $this->load->view('template/supplier_subsidiary_report',$data);
                } else {
                    echo '<center style="font-family: Arial, sans-serif;"><h1 style="color:#2196f3">Information</h1><hr><h3>No record associated to this supplier.</h3></center>';
                }
               
                    

                
                /*if ($type == 'preview' || $type == null) {
                    $pdf = $this->m_pdf->load("A4-L");
                    $content=$this->load->view('template/supplier_subsidiary_report',$data,TRUE);
                }

                $pdf->setFooter('{PAGENO}');
                $pdf->WriteHTML($content);
                $pdf->Output();*/
                break;


        }
    }


}
