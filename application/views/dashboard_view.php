<html lang="en">

<!-- Mirrored from avenxo.kaijuthemes.com/ui-typography.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 06 Jun 2016 12:09:25 GMT -->
<head>
    <meta charset="utf-8">
    <title>Dashboard -  Procurement System</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="description" content="Avenxo Admin Theme">
    <meta name="author" content="">


   <?php echo $_def_css_files; ?>

    <link type="text/css" href="assets/plugins/datatables/dataTables.bootstrap.css" rel="stylesheet">
    <link type="text/css" href="assets/plugins/datatables/dataTables.themify.css" rel="stylesheet">


    <style>
    html{
        zoom: 0.8;
        zoom: 80%;
    }

    #tbl_po_list{
        margin-top: 10px !important;
        border-top: 1px solid #aeaeae !important;
    }

    .data-container {
          border-radius: 5px;
        background: rgba(255, 255, 255, .1);
        padding: 10px;
    }

    .toolbar{
        float: left;
    }

    .btn-white {
        background: white none repeat scroll 0 0;
        border: 1px solid #e7eaec;
        color: inherit;
        text-transform: none;
    }

    td.details-control {
        background: url('assets/img/Folder_Closed.png') no-repeat center center;
        cursor: pointer;
    }
    tr.details td.details-control {
        background: url('assets/img/Folder_Opened.png') no-repeat center center;
    }

    .child_table{
        padding: 5px;
        border: 1px #ff0000 solid;
    }

    .glyphicon.spinning {
        animation: spin 1s infinite linear;
        -webkit-animation: spin2 1s infinite linear;
    }

    @keyframes spin {
        from { transform: scale(1) rotate(0deg); }
        to { transform: scale(1) rotate(360deg); }
    }

    @-webkit-keyframes spin2 {
        from { -webkit-transform: rotate(0deg); }
        to { -webkit-transform: rotate(360deg); }
    }

    </style>

    <!--<link rel="stylesheet" type="text/css" href="assets/css/dark-theme.css">-->

    <style>

        .page-content {
            overflow-x: hidden!important;
        }
        @media (min-width: 768px){
          .seven-cols .col-md-1,
          .seven-cols .col-sm-1,
          .seven-cols .col-lg-1  {
            width: 100%;
            *width: 100%;
          }
        }

        @media (min-width: 992px) {
          .seven-cols .col-md-1,
          .seven-cols .col-sm-1,
          .seven-cols .col-lg-1 {
            width: 14.285714285714285714285714285714%;
            *width: 14.285714285714285714285714285714%;
          }
        }

        @media (min-width: 1200px) {
          .seven-cols .col-md-1,
          .seven-cols .col-sm-1,
          .seven-cols .col-lg-1 {
            width: 14.285714285714285714285714285714%;
            *width: 14.285714285714285714285714285714%;
          }
        }



        .bg-purple{background: #2f9de0 !important}
        .widget{border-radius:3px;overflow:hidden;margin-top: 10px;}
        .widget{padding:15px}.widget{margin-bottom:20px;color:#fff}.widget.widget-stats{position:relative}
        .widget-stats .stats-info h4{font-size:12px;margin:5px 0;color:#fff}
        .widget-stats .stats-icon{font-size:42px;height:56px;width:56px;text-align:center;line-height:56px;margin-left:15px;color:#fff;position:absolute;right:15px;top:15px;opacity:.2;filter:alpha(opacity=20)}.widget-stats .stats-info p{font-size:24px;font-weight:300;margin-bottom:0}.widget-stats .stats-link a{display:block;margin:15px -15px -15px;padding:7px 15px;background:url(../img/transparent/black-0.4.png);background:rgba(0,0,0,.4);text-align:right;color:#ddd;font-weight:300;text-decoration:none}.widget-stats .stats-link a:focus,.widget-stats .stats-link a:hover{background:url(../img/transparent/black-0.6.png);background:rgba(0,0,0,.6);color:#fff}
        .widget-stats .stats-icon.stats-icon-lg{font-size:52px;top:12px;right:21px}.widget-stats .stats-title{position:relative;line-height:1.1;font-size:12px;margin:2px 0 7px}
        .widget-stats .stats-desc,.widget-stats .stats-title{color:#fff;color:rgba(255,255,255,.6)}
        .widget-stats .stats-desc{font-weight:300;margin-bottom:0}
        .widget-stats .stats-number{font-size:24px;font-weight:300;margin-bottom:10px}
        .widget-stats .stats-progress .progress-bar{background:#fff}                                                                                                              </style>



</head>

<body class="animated-content" style="font-family: tahoma;">

<?php echo $_top_navigation; ?>

<div id="wrapper">
        <div id="layout-static">
        <?php echo $_side_bar_navigation; ?>
        <div class="static-content-wrapper">
            <div class="static-content">
                    <div class="page-content" style="padding: 15px;"><!-- #page-content -->
                            <div>

                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="widget widget-stats bg-purple">
                                            <div class="stats-icon stats-icon-lg"><i class="fa fa-shopping-cart fa-fw"></i></div>
                                            <div class="stats-title">PURCHASES - THIS MONTH</div>
                                            <div class="stats-number"><?php echo number_format($purchases,2); ?></div>
                                            <div class="stats-progress progress">
                                                <div class="progress-bar" style="width: 76.3%;"></div>
                                            </div>
                                            <div class="stats-desc">26% greater than last month</div>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="widget widget-stats bg-purple">
                                            <div class="stats-icon stats-icon-lg"><i class="fa fa-shopping-cart fa-fw"></i></div>
                                            <div class="stats-title">PO - THIS MONTH</div>
                                            <div class="stats-number"><?php echo number_format($po_this_month,0); ?></div>
                                            <div class="stats-progress progress">
                                                <div class="progress-bar" style="width: 76.3%;"></div>
                                            </div>
                                            <div class="stats-desc">26% greater than last month</div>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="widget widget-stats bg-purple">
                                            <div class="stats-icon stats-icon-lg"><i class="fa fa-shopping-cart fa-fw"></i></div>
                                            <div class="stats-title">ISSUANCE - THIS MONTH</div>
                                            <div class="stats-number"><?php echo number_format($issue_this_month,0); ?></div>
                                            <div class="stats-progress progress">
                                                <div class="progress-bar" style="width: 76.3%;"></div>
                                            </div>
                                            <div class="stats-desc">26% greater than last month</div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-9">
                                        <div class="panel panel-white">
                                            <div class="panel-heading">
                                                <div class="panel-tools">
                                                    <a class="tools-action" href="#" data-toggle="collapse">
                                                        <i class="pe-7s-angle-up"></i>
                                                    </a>
                                                    <a class="tools-action" href="#" data-toggle="dispose">
                                                        <i class="pe-7s-close"></i>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="panel-body">
                                                <canvas id="bar-chart"></canvas>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="panel panel-default" style="overflow-x: hidden!important;">
                                            <div class="panel-heading" style="background-color: #00a9dd;">
                                                <h4 style="color: white;">PO for Approval</h4>
                                            </div>
                                            <div class="panel-body table-responsive">
                                                <div class="row" style="margin-top: 20px;">
                                                    <div class="col-xs-12 col-sm-12 <?php echo (in_array('7-1',$this->session->user_rights)?'':'hidden'); ?>">
                                                        <div class="data-container table-responsive" >
                                                            <table id="tbl_po_list" class="table custom-design" c width="100%">
                                                                <thead>
                                                                <th></th>
                                                                <th>PO #</th>
                                                                <th>Vendor</th>
                                                                <th>Terms </th>
                                                                <th>Posted by </th>
                                                                <th style="text-align: center;"> <i class="fa fa-paperclip"></i></th>
                                                                <th><center>Action</center></th>
                                                                </thead>
                                                                <tbody>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                    </div> <!-- #page-content -->
            </div>


            <footer role="contentinfo">
                <div class="clearfix">
                    <ul class="list-unstyled list-inline pull-left">
                        <li><h6 style="margin: 0;">&copy; 2017</h6></li>
                    </ul>
                    <button class="pull-right btn btn-link btn-xs hidden-print" id="back-to-top"><i class="ti ti-arrow-up"></i></button>
                </div>
            </footer>




        </div>
        </div>


</div>


<?php echo $_switcher_settings; ?>
<?php echo $_def_js_files; ?>



<!-- Sparkline -->
<script src="assets/plugins/sparkline/jquery.sparkline.min.js"></script>

<!-- CHART -->
<script src="assets/plugins/chartJs/Chart.min.js"></script>

<!-- DATATABLE -->
<script type="text/javascript" src="assets/plugins/datatables/jquery.dataTables.js"></script>
<script type="text/javascript" src="assets/plugins/datatables/dataTables.bootstrap.js"></script>

<script>
    var ctx = document.getElementById("bar-chart").getContext('2d');


    Chart.defaults.global.defaultFontColor = "#b7b7b7";

    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ["Jan","Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"],
            datasets: [
                {
                    label: 'ACCOUNT PAYABLES - 2017',
                    data: [100,20,190,40,50,60,70,80,10,100,110,120],
                    backgroundColor: [
                        'rgba(255, 152, 0, .1)'
                    ],
                    borderColor: [
                        'rgb(255, 152, 0)'
                    ],
                    borderWidth: 2
                }
            ]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    });


</script>



<script>

    $(document).ready(function(){
        var dt; var _selectedID; var _selectRowObj;



        var initializeControls=(function(){


            dt=$('#tbl_po_list').DataTable({
                "dom": '<"toolbar">frtip',
                "bLengthChange":false,
                "ajax" : "Purchases/transaction/po-for-approved",
                "language": {
                  "searchPlaceholder":"Search Purchase Order"
                },
                "columns": [
                    {
                        "targets": [0],
                        "class":          "details-control",
                        "orderable":      false,
                        "data":           null,
                        "defaultContent": ""
                    },
                    { targets:[1],data: "po_no" },
                    { targets:[2],data: "supplier_name" },
                    { targets:[3],data: "term_description" },
                    { targets:[4],data: "posted_by" },
                    {
                        targets:[5],data: "attachment",
                        render: function (data, type, full, meta){

                            return '<center>'+ data +' <i class="fa fa-paperclip"></i></classenter>';
                        }

                    },
                    {
                        targets:[6],
                        render: function (data, type, full, meta){
                            //alert(full.purchase_order_id);

                            var btn_approved='<button class="btn btn-success btn-sm" name="approve_po"  style="margin-left:-15px;" data-toggle="tooltip" data-placement="top" title="Approved this PO"><i class="fa fa-check" style="color: white;"></i> <span class=""></span></button>';
                            var btn_conversation='<a id="link_conversation" href="Po_messages?id='+full.purchase_order_id+'" target="_blank" class="btn btn-info btn-sm"  style="margin-right:0px;" data-toggle="tooltip" data-placement="top" title="Open Conversation"><i class="fa fa-comments"></i> </a>';

                            return '<center>'+btn_approved+'&nbsp;'+btn_conversation+'</center>';
                        }
                    }
                ]
            });

             $('div.dataTables_filter input').addClass('dash_search_field');
        })();


        var bindEventHandlers=(function(){


            var detailRows = [];


            $('#tbl_po_list tbody').on( 'click', 'tr td.details-control', function () {
                var tr = $(this).closest('tr');
                var row = dt.row( tr );
                var idx = $.inArray( tr.attr('id'), detailRows );

                if ( row.child.isShown() ) {
                    tr.removeClass( 'details' );
                    row.child.hide();

                    // Remove from the 'open' array
                    detailRows.splice( idx, 1 );
                }
                else {
                    tr.addClass( 'details' );
                    //console.log(row.data());
                    var d=row.data();

                    $.ajax({
                        "dataType":"html",
                        "type":"POST",
                        "url":"Templates/layout/po/"+ d.purchase_order_id+'?type=approval',
                        "beforeSend" : function(){
                            row.child( '<center><br /><img src="assets/img/loader/ajax-loader-lg.gif" /><br /><br /></center>' ).show();
                        }
                    }).done(function(response){
                        row.child( response,'no-padding' ).show();
                        // Add to the 'open' array
                        if ( idx === -1 ) {
                            detailRows.push( tr.attr('id') );
                        }
                    });




                }
            } );


            //*****************************************************************************************
            $('#tbl_po_list > tbody').on('click','button[name="approve_po"]',function(){
                _selectRowObj=$(this).closest('tr'); //hold dom of tr which is selected

                var data=dt.row(_selectRowObj).data();
                _selectedID=data.purchase_order_id;

                 approvePurchaseOrder().done(function(response){
                    showNotification(response);
                    if(response.stat=="success"){
                        dt.row(_selectRowObj).remove().draw();
                    }

                });
            });


            //****************************************************************************************
            $('#tbl_po_list > tbody').on('click','button[name="mark_as_approved"]',function(){
                _selectRowObj=$(this).parents('tr').prev();
                _selectRowObj.find('button[name="approve_po"]').click();
                showSpinningProgress($(this));
            });


            //****************************************************************************************
            $('#tbl_po_list > tbody').on('click','button[name="external_link_conversation"]',function(){
                _selectRowObj=$(this).parents('tr').prev();
                _selectRowObj.find('#link_conversation').trigger("click");
                //alert(_selectRowObj.find('a[id="link_conversation"]').length);
            });




        })();






        //functions called on bindEventHandlers
        var approvePurchaseOrder=function(){
            return $.ajax({
                "dataType":"json",
                "type":"POST",
                "url":"Purchases/transaction/mark-approved",
                "data":{purchase_order_id : _selectedID}

            });
        };

        var showNotification=function(obj){
            PNotify.removeAll(); //remove all notifications
            new PNotify({
                title:  obj.title,
                text:  obj.msg,
                type:  obj.stat
            });
        };

        var showSpinningProgress=function(e){
            $(e).find('span').toggleClass('glyphicon glyphicon-refresh spinning');
        };



    });


</script>



</body>

</html>