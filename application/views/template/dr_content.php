<!DOCTYPE html>
<html>
<head>
    <title>Depreciation Expense Report</title>
    <style>
        @media print{@page {size: portrait;}}

        body {
            font-family: 'Times New Roman';
            font-size: 14px;
        }
        table{
            border-collapse: collapse;
        }
    </style>

</head>
<body>
<table width="100%">
    <tr>
        <td colspan="4" width="100%" style="padding: 10px;border: 1px solid black;">
            <span style="float: right;"><b><i>Appendix 62</i></b></span>
            <h2 style="text-align: center;margin-bottom: 0px;">INSPECTION AND ACCEPTANCE REPORT</h2>
        </td>
    </tr>
    <tr>
        <td colspan="4" width="100%" style="padding: 10px;border: 1px solid black;">
            <h3 style="line-height: 0%">Entity Name : <center><strong><?php echo $company_info->company_name; ?></strong></center></h3>
            <p style="line-height: 0%;text-align: center;"><?php echo $company_info->company_address; ?></p>
            <p style="line-height: 0%;text-align: center;"><?php echo $company_info->landline.'/'.$company_info->mobile_no; ?></p><br />
            <b>Fund Cluster : </b><div style="width: 30%; border-bottom: 1px solid black;margin-left: 100px"> </div><br />
        </td>
    </tr>

    <tr>
        <td colspan="2" width="70%" style="padding: 10px;border: 1px solid black;">
            <span>Supplier : </span> <?php echo $delivery_info->supplier_name; ?><br />
            <span>PO No/Date : </span> <?php echo $delivery_info->po_no; ?> / <?php echo $delivery_info->po_date; ?><br />
            <span>Requisitioning Office/Dept : </span> <?php echo $delivery_info->department_name; ?> <br />
            <span>Responsibility Center Code : </span> <br />
        </td>
        <td colspan="2" width="30%" style="padding: 10px;border: 1px solid black;">
            <span>IAR No : </span> <br />
            <span>Date : </span> <br />
            <span>Invoice No : </span> <?php echo $delivery_info->dr_invoice_no; ?><br />
            <span>Date : </span> <?php echo $delivery_info->date_created; ?><br />
        </td>
    </tr>

    <tr>
        <td colspan="1" width="20%" style="padding: 10px;border: 1px solid black;">
            <b>Stock No.</b>
        </td>
        <td colspan="1" width="50%" style="padding: 10px;border: 1px solid black;">
            <b>Description</b>
        </td>
        <td colspan="1" width="15%" style="padding: 10px;border: 1px solid black;">
            <b>Unit</b>
        </td>
        <td colspan="1" width="15%" style="padding: 10px;border: 1px solid black;">
            <b>Quantity</b>
        </td>
    </tr>

    <tr>
        <td colspan="4"  valign="top" style="padding: 0px;border: 1px solid black;min-height: 320px;height: 250px;">
            <table style="width: 100%;">
                <?php foreach($dr_items as $item){ ?>
                <tr>
                    <td colspan="1" valign="top" width="20%" style="padding: 0px;margin: 0px;">
                        <b><?php echo $item->product_code; ?></b>
                    </td>
                    <td colspan="1" valign="top" width="50%" style="padding: 0px;margin: 0px;">
                        <b><?php echo $item->product_desc; ?></b>
                    </td>
                    <td colspan="1" valign="top" width="15%" style="padding: 0px;margin: 0px;">
                        <b><?php echo $item->unit_name; ?></b>
                    </td>
                    <td colspan="1" align="right" valign="top" width="15%" style="padding: 0px;margin: 0px;">
                        <b><?php echo number_format($item->dr_qty,0); ?></b>
                    </td>
                </tr>
                <?php } ?>
            </table>
        </td>
    </tr>


    <tr>
        <td colspan="4" width="100%" style="padding: 0px;border: 1px solid black;">
            <table width="100%" style="border: none;">
                <tr>
                    <td align="center" colspan="2" width="50%" style="padding: 10px;border-right: 1px solid black;">
                        <b><i>INSPECTION</i></b>
                    </td>
                    <td align="center" colspan="2" width="50%" style="padding: 10px;">
                        <b><i>ACCEPTANCE</i></b>
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <tr>
        <td colspan="4" width="100%" style="padding: 0px;border: 1px solid black;">
            <table width="100%" style="border: none;">
                <tr>
                    <td colspan="2" width="50%" style="padding: 10px;border-right: 1px solid black;">
                        <b>Date Inspected : </b><br /><br />

                        ______ Inspected, verified and found in order as to quantity and specifications.

                        <br /><br /><br /><br />
                        <center>
                        <div style="width: 80%;border-top: 1px solid black;">
                            Inspection Officer / Inspection Committee
                        </div></center>
                    </td>
                    <td colspan="2" width="50%" style="padding: 10px;">
                        <b>Date Received : </b> <?php echo $delivery_info->date_delivered; ?><br /><br />

                        ______ Complete <br />
                        ______ Partial

                        <br /><br /><br /><br />
                        <center>
                            <div style="width: 80%;border-top: 1px solid black;">
                                Supply and/or Property Custodian
                            </div></center>
                    </td>
                </tr>
            </table>
        </td>
    </tr>

</table>

</body>
<script>window.print();</script>
</html>