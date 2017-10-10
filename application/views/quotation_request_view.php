<html>


<style>
    @import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300);
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        font-weight: 300;
    }


    table{
        margin: 2%;
        width: 95%;
        border-spacing: 0;
        border-collapse: collapse;
    }

    table  th{
        border: 1px solid white;
    }

    table  td{
        border: 1px solid white;
        padding: 3px;
        vertical-align: middle;
    }

    body {
        font-family: 'Source Sans Pro', sans-serif;
        color: white;
        font-weight: 300;
    }
    body ::-webkit-input-placeholder {
        /* WebKit browsers */
        font-family: 'Source Sans Pro', sans-serif;
        color: white;
        font-weight: 300;
    }
    body :-moz-placeholder {
        /* Mozilla Firefox 4 to 18 */
        font-family: 'Source Sans Pro', sans-serif;
        color: white;
        opacity: 1;
        font-weight: 300;
    }
    body ::-moz-placeholder {
        /* Mozilla Firefox 19+ */
        font-family: 'Source Sans Pro', sans-serif;
        color: white;
        opacity: 1;
        font-weight: 300;
    }
    body :-ms-input-placeholder {
        /* Internet Explorer 10+ */
        font-family: 'Source Sans Pro', sans-serif;
        color: white;
        font-weight: 300;
    }
    .wrapper {
        background: #50a3a2;
        background: -webkit-linear-gradient(top left, #50a3a2 0%, #53e3a6 100%);
        background: linear-gradient(to bottom right, #50a3a2 0%, #53e3a6 100%);
        position: absolute;

        width: 100%;
        height: 100%;

        overflow: hidden;
    }
    .wrapper.form-success .container h1 {
        -webkit-transform: translateY(85px);
        transform: translateY(85px);
    }
    .container {
        max-width: 70%;
        margin: 0 auto;
        margin-top: 1%;
        padding: 80px 0;
        height: 100%;
        text-align: center;
        border: none;
        border-radius: 5px;

        background: rgba(177,232,246,1);
        background: -moz-linear-gradient(left, rgba(177,232,246,1) 0%, rgba(149,234,227,0.13) 48%, rgba(118,237,207,0.13) 100%);
        background: -webkit-gradient(left top, right top, color-stop(0%, rgba(177,232,246,1)), color-stop(48%, rgba(149,234,227,0.13)), color-stop(100%, rgba(118,237,207,0.13)));
        background: -webkit-linear-gradient(left, rgba(177,232,246,1) 0%, rgba(149,234,227,0.13) 48%, rgba(118,237,207,0.13) 100%);
        background: -o-linear-gradient(left, rgba(177,232,246,1) 0%, rgba(149,234,227,0.13) 48%, rgba(118,237,207,0.13) 100%);
        background: -ms-linear-gradient(left, rgba(177,232,246,1) 0%, rgba(149,234,227,0.13) 48%, rgba(118,237,207,0.13) 100%);
        background: linear-gradient(to right, rgba(177,232,246,1) 0%, rgba(149,234,227,0.13) 48%, rgba(118,237,207,0.13) 100%);
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#b1e8f6', endColorstr='#76edcf', GradientType=1 );

    }
    .container h1 {
        font-size: 40px;
        -webkit-transition-duration: 1s;
        transition-duration: 1s;
        -webkit-transition-timing-function: ease-in-put;
        transition-timing-function: ease-in-put;
        font-weight: 200;
    }
    form {
        padding: 20px 0;
        position: relative;
        z-index: 2;
    }
    form input {
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        outline: 0;
        border: 1px solid rgba(255, 255, 255, 0.4);
        background-color: rgba(255, 255, 255, 0.2);
        width: 150px;
        border-radius: 3px;
        padding: 10px 15px;
        display: block;
        text-align: center;
        font-size: 11px;
        color: white;
        -webkit-transition-duration: 0.25s;
        transition-duration: 0.25s;
        font-weight: 300;
    }
    form input:hover {
        background-color: rgba(255, 255, 255, 0.4);
    }
    form input:focus {
        background-color: white;
        width: 170px;
        color: #53e3a6;
    }
    form button {
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        outline: 0;
        background-color: white;
        border: 0;
        padding: 10px 15px;
        color: #53e3a6;
        border-radius: 3px;
        width: 250px;
        cursor: pointer;
        font-size: 18px;
        -webkit-transition-duration: 0.25s;
        transition-duration: 0.25s;
    }
    form button:hover {
        background-color: #f5f7f9;
    }
    .bg-bubbles {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 1;
    }
    .bg-bubbles li {
        position: absolute;
        list-style: none;
        display: block;
        width: 40px;
        height: 40px;
        background-color: rgba(255, 255, 255, 0.15);
        bottom: -160px;
        -webkit-animation: square 25s infinite;
        animation: square 25s infinite;
        -webkit-transition-timing-function: linear;
        transition-timing-function: linear;
    }
    .bg-bubbles li:nth-child(1) {
        left: 10%;
    }
    .bg-bubbles li:nth-child(2) {
        left: 20%;
        width: 80px;
        height: 80px;
        -webkit-animation-delay: 2s;
        animation-delay: 2s;
        -webkit-animation-duration: 17s;
        animation-duration: 17s;
    }
    .bg-bubbles li:nth-child(3) {
        left: 25%;
        -webkit-animation-delay: 4s;
        animation-delay: 4s;
    }
    .bg-bubbles li:nth-child(4) {
        left: 40%;
        width: 60px;
        height: 60px;
        -webkit-animation-duration: 22s;
        animation-duration: 22s;
        background-color: rgba(255, 255, 255, 0.25);
    }
    .bg-bubbles li:nth-child(5) {
        left: 70%;
    }
    .bg-bubbles li:nth-child(6) {
        left: 80%;
        width: 120px;
        height: 120px;
        -webkit-animation-delay: 3s;
        animation-delay: 3s;
        background-color: rgba(255, 255, 255, 0.2);
    }
    .bg-bubbles li:nth-child(7) {
        left: 32%;
        width: 160px;
        height: 160px;
        -webkit-animation-delay: 7s;
        animation-delay: 7s;
    }
    .bg-bubbles li:nth-child(8) {
        left: 55%;
        width: 20px;
        height: 20px;
        -webkit-animation-delay: 15s;
        animation-delay: 15s;
        -webkit-animation-duration: 40s;
        animation-duration: 40s;
    }
    .bg-bubbles li:nth-child(9) {
        left: 25%;
        width: 10px;
        height: 10px;
        -webkit-animation-delay: 2s;
        animation-delay: 2s;
        -webkit-animation-duration: 40s;
        animation-duration: 40s;
        background-color: rgba(255, 255, 255, 0.3);
    }
    .bg-bubbles li:nth-child(10) {
        left: 90%;
        width: 160px;
        height: 160px;
        -webkit-animation-delay: 11s;
        animation-delay: 11s;
    }
    @-webkit-keyframes square {
        0% {
            -webkit-transform: translateY(0);
            transform: translateY(0);
        }
        100% {
            -webkit-transform: translateY(-800px) rotate(600deg);
            transform: translateY(-800px) rotate(600deg);
        }
    }
    @keyframes square {
        0% {
            -webkit-transform: translateY(0);
            transform: translateY(0);
        }
        100% {
            -webkit-transform: translateY(-800px) rotate(600deg);
            transform: translateY(-800px) rotate(600deg);
        }
    }



</style>

<body>
<div class="wrapper">
    <div class="container">
        <h2>Quotation Request</h2>

       <!-- <form class="form">
            <input type="text" placeholder="Username">
            <input type="password" placeholder="Password">
            <button type="submit" id="login-button">Login</button>
        </form>-->

        <table>
            <tbody>
                <tr>
                    <td width="15%">PR # : </td>
                    <td width="85%"><?php echo $request_info[0]->pr_no; ?></td>
                </tr>
                <tr>
                    <td>Sender : </td>
                    <td><?php echo $request_info[0]->fullName; ?></td>
                </tr>
                <tr>
                    <td>Remarks : </td>
                    <td><?php echo $request_info[0]->remarks; ?></td>
                </tr>

            </tbody>
        </table>

        <form id="frmItems" class="form">
        <table id="tbl_items">
            <thead>
                <tr>
                    <th width="15%">#</th>
                    <th width="40%">Product</th>
                    <th width="15%">Qty</th>
                    <th width="15%">Price</th>
                    <th width="15%">Total</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($items as $item){ ?>
                <tr>
                    <td align="center"><?php echo $item->product_code; ?></td>
                    <td align="center"><?php echo $item->product_desc; ?></td>
                    <td align="center"><?php echo number_format($item->pr_qty,0); ?></td>
                    <td align="center"><input type="text" class="item-price" value="" data-prod-qty="<?php echo $item->pr_qty; ?>" data-prod-id="<?php echo $item->product_id; ?>" /></td>
                    <td align="center"><input type="text" class="item-total" value="" readonly /></td>
                </tr>
                <?php } ?>
            </tbody>
            <tfoot>
                <tr>
                    <td align="right" colspan="3">Total</td>
                    <td align="center" colspan="2"><h2 id="txtTotal">1002</h2></td>
                </tr>
            </tfoot>
        </table>


        <button type="submit" id="btnSubmit">Submit</button>
        </form>
    </div>

    <ul class="bg-bubbles">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>
</body>



<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/jquery-1.10.2.min.js"></script> 							<!-- Load jQuery -->
<script>
    $(document).ready(function(){
        var supid = <?php echo $supplier_id; ?>;
        var prid = <?php echo $pr_info_id; ?>;
        var key = <?php echo json_encode($key); ?>;

        $(document).on('input.item-price','input',function(){
            var row = $(this).closest('tr');
            var qty = parseInt($(this).data('prod-qty'));
            var price = parseInt($(this).val());

            row.find('input.item-total').val( qty * price );

            $('#txtTotal').html(getTotal());
        });

        $('#btnSubmit').click(function(  ){
            event.preventDefault();
            var data = getSerializeData();
            var btn = $(this);
            $.ajax({
                "dataType":"json",
                "type":"POST",
                "url":"<?php echo base_url(); ?>Quotation_request/transaction/quote",
                "data" : data,
                "beforeSend" : function(){
                    //showSpinningProgress(btn);
                }
            }).done(function(response){
                alert(response.msg);
                //btn.attr('disabled','true');
            });

        });

        function getSerializeData(){

            var rows = $('#tbl_items > tbody').find('tr'); var data = [];
            $.each(rows,function(i,v){
                var price = parseInt($(v).find('input.item-price').val());
                var qty = parseInt($(v).find('input.item-price').data('prod-qty'));
                var prodid = parseInt($(v).find('input.item-price').data('prod-id'));
                var total = parseInt($(v).find('input.item-total').val());

                data.push({"name":"price[]","value":price});
                data.push({"name":"qty[]","value":qty});
                data.push({"name":"prodid[]","value":prodid});
                data.push({"name":"total[]","value":total});
            });

            data.push({"name":"supid","value":supid});
            data.push({"name":"prid","value":prid});
            data.push({"name":"grandtotal","value":$('#txtTotal').text()});
            data.push({"name":"key","value":key});

            return data;
        }



        function getTotal(){
            var rows = $('#tbl_items > tbody').find('tr'); var total = 0;
            $.each(rows,function(i,v){
                var price = parseInt($(v).find('input.item-total').val());
                total += price;
            });
            return total;
        }

    });
</script>




</html>