<?php
/* Smarty version 3.1.36, created on 2020-10-24 01:38:03
  from 'C:\xampp\htdocs\contaduria\app\cobros\templates\por_generar.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_5f93695bb290d1_49204803',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '6ef7932443da3cf637163f94bb7e3a4ddbb13bd0' => 
    array (
      0 => 'C:\\xampp\\htdocs\\contaduria\\app\\cobros\\templates\\por_generar.tpl',
      1 => 1603496283,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5f93695bb290d1_49204803 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="m-2 p-2">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0">
                Cobros por generar
            </h5>
        </div>

        <div class="card-body">
            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['cobros']->value, 'cobro');
$_smarty_tpl->tpl_vars['cobro']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['cobro']->value) {
$_smarty_tpl->tpl_vars['cobro']->do_else = false;
?>
                <p><?php echo $_smarty_tpl->tpl_vars['cobro']->value['razon_social'];?>
 - <?php echo $_smarty_tpl->tpl_vars['cobro']->value['nombre'];?>
 - <?php echo $_smarty_tpl->tpl_vars['cobro']->value['idFrecuenciaCobro'];?>
</p>
            <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
        </div>
    </div>
</div><?php }
}
