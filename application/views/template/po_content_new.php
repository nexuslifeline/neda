<!DOCTYPE html>
<html>
<head>
	<title>Purchase Order</title>
	<style type="text/css">
		body {
			font-family: 'Calibri',sans-serif;
			font-size: 12px;
		}
        table{
            table-layout: fixed;
            border-collapse: collapse;
        }

        #main td{
            padding : 3px;
        }


	</style>
</head>
<body>
    <table id="main" width="100%" style="border:1px solid black;">
        <thead>
            <tr>
                <td colspan="2" align="center">
                    <h3 style="line-height: 0%"><strong><?php echo $company_info->company_name; ?></strong></h3>
                    <p style="line-height: 0%"><?php echo $company_info->company_address; ?></p>
                    <p style="line-height: 0%"><?php echo $company_info->landline.'/'.$company_info->mobile_no; ?></p><br />
                </td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td style="border:1px solid black;" valign="top">
                    <table width="100%">
                        <tr>
                            <td width="20%">Supplier : </td>
                            <td width="80%" style="border-bottom: 1px solid black;"><?php echo $purchase_info->supplier_name; ?></td>
                        </tr>
                        <tr>
                            <td width="20%">Address : </td>
                            <td width="80%" style="border-bottom: 1px solid black;"><?php echo $purchase_info->address; ?></td>
                        </tr>
                        <tr>
                            <td width="20%">TIN : </td>
                            <td width="80%" style="border-bottom: 1px solid black;"><?php echo $purchase_info->tin_no; ?></td>
                        </tr>
                    </table>
                </td>
                <td style="border:1px solid black;">
                    <table width="100%">
                        <tr>
                            <td width="30%">P.O No. : </td>
                            <td width="70%" style="border-bottom: 1px solid black;"><?php echo $purchase_info->po_no; ?></td>
                        </tr>
                        <tr>
                            <td width="30%">Date : </td>
                            <td width="70%" style="border-bottom: 1px solid black;"><?php echo $purchase_info->date_created; ?></td>
                        </tr>
                        <tr>
                            <td width="30%">Mode of Procurement : </td>
                            <td width="70%" style="border-bottom: 1px solid black;"></td>
                        </tr>
                    </table>

                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding-left: 20px;">
                    <p>Gentlemen : </p>
                    <p>Please furnish this Office the following articles subject to the terms and condition contained herein :</p>
                </td>
            </tr>
            <tr>
                <td style="border:1px solid black;" width="50%">
                    Place of Delivery : <?php echo $purchase_info->deliver_to_address; ?> <br />
                    Date of Delivery :
                </td>
                <td style="border:1px solid black;" width="50%">
                    Delivery Term: <?php echo $purchase_info->terms; ?> <br />
                    Payment Term :
                </td>
            </tr>
            <tr>
                <td width="100%" colspan="2" style="padding: 0px;">
                    <table width="100%" style="margin: -1px;">
                        <tr>
                            <td style="border:1px solid black;" width="12%">Stock No.</td>
                            <td style="border:1px solid black;" width="12%">Unit</td>
                            <td style="border:1px solid black;" width="40%">Description</td>
                            <td style="border:1px solid black;" width="12%">Qty</td>
                            <td style="border:1px solid black;" width="12%">Unit Cost</td>
                            <td style="border:1px solid black;border-right: 1px solid white;" width="12%">Amount</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td width="100%" colspan="2" style="padding: 0px;min-height: 200px;height: 200px;border-top: 1px solid black;" valign="top">


                    <table width="100%" style="margin: -1px;">
                        <?php foreach($po_items as $item){ ?>
                        <tr>
                            <td valign="top" style="border:1px solid white;border-top: none;border-bottom: none;" width="12%"><?php echo $item->product_code; ?></td>
                            <td valign="top" style="border:1px solid white;border-top: none;border-bottom: none;" width="12%"><?php echo $item->unit_name; ?></td>
                            <td valign="top" style="border:1px solid white;border-top: none;border-bottom: none;" width="40%"><?php echo $item->product_desc; ?></td>
                            <td valign="top" align="right" style="border:1px solid white;border-top: none;border-bottom: none;" width="12%"><?php echo number_format($item->po_qty,0); ?></td>
                            <td valign="top" align="right" style="border:1px solid white;border-top: none;border-bottom: none;" width="12%"><?php echo number_format($item->po_price,2); ?></td>
                            <td valign="top" align="right" style="border:1px solid white;border-top: none;border-bottom: none;border-right: 1px solid white;" width="12%"><?php echo number_format($item->po_line_total,2); ?></td>
                        </tr>
                        <?php } ?>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="border:1px solid black;" colspan="2"><b>Total Amount in Words : <span style="text-transform: capitalize;"><?php echo $total_in_words; ?></span> Pesos </b> </td>
            </tr>
            <tr>
                <td style="border:1px solid black;border-bottom:none;padding: 10px;" colspan="2">
                    In case of failure to make full delivery within the time specified above, a penalty of one-tenth(1/10) of one percent for every day of
                     delay shall be imposed on the undelivered item/s.
                </td>
            </tr>
            <tr>
                <td style="border:none" width="50%" valign="top">
                    <br />Conformed :<br /><br /><br />

                    <div style="width: 90%;"><center>
                            <div style="width: 90%;border-bottom: 1px solid black;">
                            </div>
                            <div style="width: 90%;">
                                <center>Signature over Printed Name</center>
                            </div>
                            <br />
                            <div style="width: 50%;border-bottom: 1px solid black;">
                            </div>
                            <div style="width: 50%;">
                                <center>Date</center>
                            </div></center>
                    </div>
                </td>
                <td style="border:none" width="50%" valign="top">
                    <br />Very truly yours,
                    <br /><br />
                    <div style="width: 90%;border-bottom: 1px solid black;">
                        <?php if($purchase_info->approval_id == 1){ ?>
                            <center><img src="<?php echo base_url(); ?>assets/img/signatory/sign-1.png" height="5%" width="40%" /></center>
                        <?php } ?>
                        <center><b>SEVERINO C. SANTOS</b></center>
                    </div><br />
                </td>
            </tr>
            <tr>
                <td style="border:1px solid black;padding-left: 10px;" width="50%" valign="top">
                    Fund Cluster : <br />
                    Funds Available : <br /><br /><br />

                    <div style="width: 100%;">
                        <center>
                            <div style="width: 90%;border-bottom: 1px solid black;">
                                <center><b>GEMMALYN D. SICAT</b></center>
                            </div>
                            <div style="width: 90%;">
                                <center>Accountant III</center>
                            </div><br />
                        </center>
                    </div>
                </td>
                <td style="border:1px solid black;padding: 20px;" width="50%" valign="top">
                    ORS/BURS No : <br />
                    Date of the ORS/BURS No : <br />
                    Amount : <br />
                </td>
            </tr>
        </tbody>
    </table>
</body>



<script>/*window.print();*/</script>
</html>