<?php
/* Smarty version 3.1.36, created on 2021-07-19 13:51:39
  from 'C:\xampp\htdocs\Contadores\app\reportes\templates\index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_60f5674b54a454_06617963',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '1e03625fd9fc76e2fd83e0504d885bff33792b35' => 
    array (
      0 => 'C:\\xampp\\htdocs\\Contadores\\app\\reportes\\templates\\index.tpl',
      1 => 1604341746,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_60f5674b54a454_06617963 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="m-2 p-2">
    <div class="row">
        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['tarjetas']->value, 'tarjeta', false, 'key');
$_smarty_tpl->tpl_vars['tarjeta']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['key']->value => $_smarty_tpl->tpl_vars['tarjeta']->value) {
$_smarty_tpl->tpl_vars['tarjeta']->do_else = false;
?>
        <div class="col-12 col-sm-6 col-md-4">
            <div class="card mb-3 <?php echo $_smarty_tpl->tpl_vars['tarjeta']->value['class'];?>
">
                <div class="card-header">
                    <div class="font-weight-bold mb-0"><?php echo $_smarty_tpl->tpl_vars['tarjeta']->value['title'];?>
</div>
                </div>

                <div class="card-body">
                    <div class="h6 mb-0 w-100">
                        <label class="h4" id="card-label-monto"><?php echo Formato::Precio($_smarty_tpl->tpl_vars['tarjeta']->value['total'],$_smarty_tpl->tpl_vars['objMonedaCLP']->value->decimales);?>
</label>
                        <label style="position: relative; top: -5px;">CLP</label>

                        <div class="float-right">
                            <button class="btn btn-sm btn-dark" data-toggle="collapse" data-target="#collapse-<?php echo $_smarty_tpl->tpl_vars['key']->value;?>
">
                                <i class="fas fa-info"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="card-footer collapse p-0 m-0" id="collapse-<?php echo $_smarty_tpl->tpl_vars['key']->value;?>
">
                    <div class="small m-0 p-2">
                        <?php echo $_smarty_tpl->tpl_vars['tarjeta']->value['description'];?>

                    </div>
                </div>
            </div>
        </div>
        <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
    </div>
</div><?php }
}
