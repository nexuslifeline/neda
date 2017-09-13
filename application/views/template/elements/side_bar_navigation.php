<style type="text/css">
    .static-sidebar-wrapper {
        transition: .2s;
    }
</style>
<div class="static-sidebar-wrapper sidebar-default">
    <div class="static-sidebar">
        <div class="sidebar">
            <div class="widget">
                <div class="widget-body">
                    <div class="userinfo">
                        <div class="avatar">
                            <img style="min-width: 70px; min-height: 70px;" src="<?php echo $this->session->user_photo; ?>" class="img-responsive img-circle">
                        </div>
                        <div class="info">
                            <span class="username"><?php echo $this->session->user_fullname; ?></span>
                            <span class="useremail"><?php echo $this->session->user_email; ?></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="widget stay-on-collapse" id="widget-sidebar">
                <nav role="navigation" class="widget-body">
                    <ul class="acc-menu">
                        <li class="nav-separator"><span>Explore</span></li>
                        <li class="<?php echo (in_array('7-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="Dashboard"><i class="ti ti-home"></i><span>Dashboard</span><span class="badge badge-orange">0</span></a></li>

                        <li class="<?php echo (in_array('2',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#"><i class="ti ti-package"></i><span>Purchasing</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('2-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="Purchases">Purchase Order</a></li>
                                <li class="<?php echo (in_array('2-2',$this->session->user_rights)?'':'hidden'); ?>"><a href="Deliveries">Purchase Invoice </a></li>
                                <li class="<?php echo (in_array('2-6',$this->session->user_rights)?'':'hidden'); ?>"><a href="Requisition">Requisition</a></li>
                                <li class="<?php echo (in_array('2-4',$this->session->user_rights)?'':'hidden'); ?>"><a href="Issuances">Item Issuance</a></li>
                                <li class="<?php echo (in_array('2-5',$this->session->user_rights)?'':'hidden'); ?>"><a href="Adjustments">Item Adjustment</a></li>
                                <li class="<?php echo (in_array('2-3',$this->session->user_rights)?'':'hidden'); ?>"><a href="Payable_payments">Account Payables</a></li>
                            </ul>
                        </li>
                        <li class="<?php echo (in_array('4',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#"><i class="ti ti-view-list-alt"></i><span>References</span></a>
                            <ul class="acc-menu">
                                <li  class="<?php echo (in_array('4-2',$this->session->user_rights)?'':'hidden'); ?>"><a href="categories">Category Management</a></li>
                                <li  class="<?php echo (in_array('4-3',$this->session->user_rights)?'':'hidden'); ?>"><a href="departments">Department Management</a></li>
                                <li  class="<?php echo (in_array('4-4',$this->session->user_rights)?'':'hidden'); ?>"><a href="units">Unit Management</a></li>

                            </ul>
                        </li>
                        <li class="<?php echo (in_array('5',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#"><i class="ti ti-harddrive"></i><span>Master file</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('5-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="products">Product Master file</a></li>
                                <li class="<?php echo (in_array('5-3',$this->session->user_rights)?'':'hidden'); ?>"><a href="suppliers">Supplier Master file</a></li>
                            </ul>
                        </li>

                        <li class="<?php echo (in_array('6',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#"><i class="ti ti-settings"></i><span>Settings</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('6-1',$this->session->user_rights)?'':'hidden'); ?>"><a href="Tax">Setup Tax</a></li>
                                <li class="<?php echo (in_array('6-4',$this->session->user_rights)?'':'hidden'); ?>"><a href="User_groups">Setup User Rights</a></li>
                                <li class="<?php echo (in_array('6-5',$this->session->user_rights)?'':'hidden'); ?>"><a href="users">Create User Account</a></li>
                                <li class="<?php echo (in_array('6-6',$this->session->user_rights)?'':'hidden'); ?>"><a href="company">Setup Company Info</a></li>
                                <li class="<?php echo (in_array('6-9',$this->session->user_rights)?'':'hidden'); ?>"><a href="DBBackup">Backup Database</a></li>
                            </ul>
                        </li>

                         <li class="<?php echo (in_array('8',$this->session->parent_rights)?'':'hidden'); ?>"><a href="#"><i class="ti ti-pie-chart"></i><span>Report</span></a>
                            <ul class="acc-menu">
                                <li class="<?php echo (in_array('8-2',$this->session->user_rights)?'':'hidden'); ?>"><a href="Inventory">Inventory</a></li>
                            </ul>
                        </li>

                    </ul>
                </nav>
            </div>

        </div>
    </div>
</div>