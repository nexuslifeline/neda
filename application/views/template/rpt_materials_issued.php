<style>
    @page{
        size: A4 landscape;
        margin: -.1in 0in -.1in 0in;
    }

    body{
        font-size: 12px;
    }

    .report-title-1{
        line-height: 100%;
        margin: 0;
    }

    .report-title-2{
        margin: 0;
    }

    .table-inventory{
        margin-top: 25px;
        border-collapse: collapse;
        border: 1px solid black;
    }

    .table-inventory td{
        border-collapse: collapse;
        border: 1px solid black;
        font-size: 11px;
    }



</style>
<body>
    <center><h4 class="report-title-1">REPORTS OF SUPPLIES AND MATERIALS ISSUED</h4></center>
    <center><h5 class="report-title-2">Regional Development Council</h5></center>
    <center><h5 class="report-title-2">Region Office III</h5></center>
    <center><h5 class="report-title-2">For the period <?php echo $start; ?> to <?php echo $end; ?></h5></center>

    <table width="100%" class="table-inventory">
        <tr>
            <td rowspan="2"><b>Stock #</b></td>
            <td rowspan="2"><b>Unit</b></td>
            <td rowspan="2"><b>Items</b></td>
            <td colspan="3" align="center"><b>Balance Beginning</b></td>
            <td colspan="3" align="center"><b>Procurement</b></td>
            <td colspan="3" align="center"><b>Issuance</b></td>
            <td colspan="2" align="center"><b>Adjustments</b></td>
            <td colspan="3" align="center"><b>Ending Balance</b></td>
        </tr>
        <tr>
            <td align="right"><b>Qty</b></td>
            <td align="right"><b>Unit Cost</b></td>
            <td align="right"><b>Total</b></td>

            <td align="right"><b>Qty</b></td>
            <td align="right"><b>Unit Cost</b></td>
            <td align="right"><b>Total</b></td>

            <td align="right"><b>Qty</b></td>
            <td align="right"><b>Unit Cost</b></td>
            <td align="right"><b>Total</b></td>

            <td align="right"><b>Adj IN</b></td>
            <td align="right"><b>Adj OUT</b></td>

            <td align="right"><b>Qty</b></td>
            <td align="right"><b>Unit Cost</b></td>
            <td align="right"><b>Total</b></td>
        </tr>
        <?php foreach ($items as $item){ ?>
        <tr>
            <td><?php echo $item->product_code; ?></td>
            <td><?php echo $item->unit_name; ?></td>
            <td><?php echo $item->product_desc; ?></td>

            <td align="right"><?php echo number_format($item->BeginningQty,0); ?></td>
            <td align="right"><?php echo number_format($item->purchase_cost,2); ?></td>
            <td align="right"><?php echo number_format($item->purchase_cost*$item->BeginningQty,2); ?></td>

            <td align="right"><?php echo number_format($item->ProcurementQty,0); ?></td>
            <td align="right"><?php echo number_format($item->purchase_cost,2); ?></td>
            <td align="right"><?php echo number_format($item->purchase_cost*$item->ProcurementQty,2); ?></td>

            <td align="right"><?php echo number_format($item->IssuancesQty,0); ?></td>
            <td align="right"><?php echo number_format($item->purchase_cost,2); ?></td>
            <td align="right"><?php echo number_format($item->purchase_cost*$item->IssuancesQty,2); ?></td>

            <td align="right"><?php echo number_format($item->AdjustmentsIn,0); ?></td>
            <td align="right"><?php echo number_format($item->AdjustmentsOut,0); ?></td>

            <td align="right"><?php echo number_format($item->EndingQty,0); ?></td>
            <td align="right"><?php echo number_format($item->purchase_cost,2); ?></td>
            <td align="right"><?php echo number_format($item->purchase_cost*$item->EndingQty,2); ?></td>


        </tr>
        <?php } ?>
    </table>
    <script>window.print();</script>
</body>