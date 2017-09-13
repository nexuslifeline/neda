<style>
    #tbl_requisition{
        border: 1px solid black;
        border-collapse: collapse;
    }

    #tbl_requisition th{
        padding: 8px;
        border: 1px solid #A4A4A4;
    }

    #tbl_requisition td{
        padding: 7px;
        border: 1px solid #B6B6B6;
    }

    .request-container{
        width: 100%;
        margin: auto;
        border: 1px solid #B6B6B6;
        padding: 25px;
    }
</style>

<div class="request-container">


<table width="100%">
    <tr>
        <td><b>Requisition # :</b> <?php echo $requisition_info[0]->requisition_no; ?></td>
        <td align="right"><b>Requisitioning Department :</b> <?php echo $requisition_info[0]->department_name; ?></td>
    </tr>
    <tr>
        <td><b>Purpose :</b> <?php echo $requisition_info[0]->purpose; ?></td>

    </tr>
</table>


<br />

<form id="frmRequisition">
<table id="tbl_requisition" width="100%">

    <thead>
        <tr>
            <th width="5%">Availability</th>
            <th width="15%">Requisition Qty</th>
            <th width="15%">Available Qty</th>
            <th width="50%">Item</th>
            <th width="15%">Unit</th>
        </tr>
    </thead>

    <tbody>
        <?php foreach ($items as $item){ ?>
        <tr data-available-qty="<?php echo $item->on_hand; ?>">
            <td align="center">
                <i class="fa fa-<?php echo ($item->on_hand>0?'check':'times'); ?>-circle" style="color: <?php echo ($item->on_hand>0?'green':'red'); ?>;"></i>
            </td>
            <td>
                <input type="number" name="request_qty[]" class="request-qty" value="<?php echo number_format($item->request_qty,0); ?>" style="width: 100%;text-align: right;" />
                <input type="hidden" name="product_id[]" value="<?php echo $item->product_id; ?>">
                <input type="hidden" name="unit_id[]" value="<?php echo $item->unit_id; ?>">
                <input type="hidden" name="on_hand[]" value="<?php echo $item->on_hand; ?>">
            </td>
            <td align="right">
                <?php echo number_format($item->on_hand,0); ?>
            </td>
            <td>
                <?php echo $item->product_desc; ?>
            </td>
            <td>
                <?php echo $item->unit_name; ?>
            </td>
        </tr>
        <?php } ?>
    </tbody>

</table></form>

    <br />
    <button type="button" class="btn btn-primary btnFinalizeIssuance" style="text-transform: none;" data-purpose="<?php echo $requisition_info[0]->purpose; ?>" data-department-id="<?php echo $requisition_info[0]->department_id; ?>" data-requisition-id="<?php echo $requisition_info[0]->requisition_id; ?>"><span class=""></span> Finalize Issuance of Items</button>

</div>