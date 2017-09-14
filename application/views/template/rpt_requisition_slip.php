
<style>
    table.outer-table{
        border-collapse: collapse;
        border: 1px solid black;
        padding: 0px;
    }

    .outer-table td{
        //padding: 10px;
    }


    .inner-table{
        margin: -2px;
        width: calc(100% + 4px);
    }

    .inner-table td{
        border: 1px solid black;
    }

    .requisition-table{
        border-collapse: collapse;
        margin: -2px;
        width: calc(100% + 4px);
    }

    .requisition-table td{
        border: 1px solid black;
    }

    .no-border-table{
        margin: -2px;
        width: calc(100% + 4px);

    }

    .no-border-table td{
        border: none;
    }

    body td{
        font-size: 11px;
    }


</style>
<body>
    <center><h4>REQUISITION AND ISSUE SLIP</h4></center>

<table width="100%">
    <tr>
        <td width="70%"><b>Entity Name</b> : REGIONAL DEVELOPMENT COUNCIL</td>
        <td width="30%"><b>Fund Cluster </b> : 01</td>
    </tr>
</table>


<table class="outer-table" width="100%">
    <tr>
        <td width="50%" style="padding: 10px">Division : FAD <br /> Office : NEDA Region III</td>
        <td width="50%" style="padding: 10px">Responsibility Center Code : FAD <br /> RIS No : <?php echo $slipno; ?></td>
    </tr>

    <tr>
        <td colspan="2">
            <table class="inner-table outer-table">
                <tr>
                    <td width="40%" align="center">Requisition</td>
                    <td width="20%" align="center">Stock Available?</td>
                    <td width="40%" align="center">Issue</td>
                </tr>

                <tr>
                    <td width="40%" align="center">
                        <table class="requisition-table">
                            <tr>
                                <td width="20%">Stock #</td>
                                <td width="20%">Unit</td>
                                <td width="45%">Description</td>
                                <td width="15%">Qty</td>
                            </tr>
                        </table>
                    </td>
                    <td width="20%" align="center">
                        <table class="requisition-table">
                            <tr>
                                <td width="50%" align="center">Yes</td>
                                <td width="50%" align="center">No</td>
                            </tr>
                        </table>

                    </td>
                    <td width="40%" align="center">
                        <table class="requisition-table">
                            <tr>
                                <td width="30%">Qty</td>
                                <td width="70%">Remarks</td>
                            </tr>
                        </table>

                    </td>
                </tr>

                <tr style="height: 200px;">
                    <td width="40%" align="center" valign="top">
                        <table class="no-border-table">
                            <?php foreach ($items as $item){ ?>
                            <tr>
                                <td width="20%"><?php echo $item->product_code; ?></td>
                                <td width="20%"><?php echo $item->unit_name; ?></td>
                                <td width="45%"><?php echo $item->product_desc; ?></td>
                                <td width="15%"><?php echo $item->request_qty; ?></td>
                            </tr>
                            <?php } ?>
                        </table>
                    </td>
                    <td width="20%" align="center" valign="top">
                        <table class="no-border-table">
                            <?php foreach ($items as $item){ ?>
                            <tr>
                                <td width="50%" align="center"><b><?php echo ($item->is_available==1?'/':''); ?></b></td>
                                <td width="50%" align="center"><b><?php echo ($item->is_available==1?'':'/'); ?></b></td>
                            </tr>
                            <?php } ?>
                        </table>

                    </td>
                    <td width="40%" align="center" valign="top">
                        <table class="no-border-table">
                            <?php foreach ($items as $item){ ?>
                            <tr>
                                <td width="30%"><?php echo $item->issue_qty; ?></td>
                                <td width="70%"><?php echo $item->remarks; ?></td>
                            </tr>
                            <?php } ?>
                        </table>

                    </td>
                </tr>

            </table>
        </td>

    </tr>

    <tr>
        <td colspan="2">Purpose : <br /><br /></td>
    </tr>

</table>
<i>Copy of the Requisitioning Unit</i>


<br /><br /><center><h4>REQUISITION AND ISSUE SLIP</h4></center>

<table width="100%">
    <tr>
        <td width="70%"><b>Entity Name</b> : REGIONAL DEVELOPMENT COUNCIL</td>
        <td width="30%"><b>Fund Cluster </b> : 01</td>
    </tr>
</table>


<table class="outer-table" width="100%">
    <tr>
        <td width="50%" style="padding: 10px">Division : FAD <br /> Office : NEDA Region III</td>
        <td width="50%" style="padding: 10px">Responsibility Center Code : FAD <br /> RIS No : <?php echo $slipno; ?></td>
    </tr>

    <tr>
        <td colspan="2">
            <table class="inner-table outer-table">
                <tr>
                    <td width="40%" align="center">Requisition</td>
                    <td width="20%" align="center">Stock Available?</td>
                    <td width="40%" align="center">Issue</td>
                </tr>

                <tr>
                    <td width="40%" align="center">
                        <table class="requisition-table">
                            <tr>
                                <td width="20%">Stock #</td>
                                <td width="20%">Unit</td>
                                <td width="45%">Description</td>
                                <td width="15%">Qty</td>
                            </tr>
                        </table>
                    </td>
                    <td width="20%" align="center">
                        <table class="requisition-table">
                            <tr>
                                <td width="50%" align="center">Yes</td>
                                <td width="50%" align="center">No</td>
                            </tr>
                        </table>

                    </td>
                    <td width="40%" align="center">
                        <table class="requisition-table">
                            <tr>
                                <td width="30%">Qty</td>
                                <td width="70%">Remarks</td>
                            </tr>
                        </table>

                    </td>
                </tr>

                <tr style="height: 200px;">
                    <td width="40%" align="center" valign="top">
                        <table class="no-border-table">
                            <?php foreach ($items as $item){ ?>
                                <tr>
                                    <td width="20%"><?php echo $item->product_code; ?></td>
                                    <td width="20%"><?php echo $item->unit_name; ?></td>
                                    <td width="45%"><?php echo $item->product_desc; ?></td>
                                    <td width="15%"><?php echo $item->request_qty; ?></td>
                                </tr>
                            <?php } ?>
                        </table>
                    </td>
                    <td width="20%" align="center" valign="top">
                        <table class="no-border-table">
                            <?php foreach ($items as $item){ ?>
                                <tr>
                                    <td width="50%" align="center"><b><?php echo ($item->is_available==1?'/':''); ?></b></td>
                                    <td width="50%" align="center"><b><?php echo ($item->is_available==1?'':'/'); ?></b></td>
                                </tr>
                            <?php } ?>
                        </table>

                    </td>
                    <td width="40%" align="center" valign="top">
                        <table class="no-border-table">
                            <?php foreach ($items as $item){ ?>
                                <tr>
                                    <td width="30%"><?php echo $item->issue_qty; ?></td>
                                    <td width="70%"><?php echo $item->remarks; ?></td>
                                </tr>
                            <?php } ?>
                        </table>

                    </td>
                </tr>

            </table>
        </td>

    </tr>

    <tr>
        <td colspan="2">Purpose : <br /><br /></td>
    </tr>

</table>
<i>Copy of the Accounting Unit</i>
</body>


<script>window.print();</script>



