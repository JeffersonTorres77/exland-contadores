<?php
/* Smarty version 3.1.36, created on 2020-10-14 21:56:24
  from 'C:\xampp\htdocs\contaduria\app\empresas\templates\404.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_5f8757e85e5536_52242302',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '6bcb587d52317ba504f66d1b99faed651f27fca2' => 
    array (
      0 => 'C:\\xampp\\htdocs\\contaduria\\app\\empresas\\templates\\404.tpl',
      1 => 1602705383,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5f8757e85e5536_52242302 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="m-2 p-2">
    <div class="alert alert-danger">
        <h5 class="border-bottom border-danger pb-2">Error</h5>
        La empresa <b>ID: <?php echo $_smarty_tpl->tpl_vars['idEmpresa']->value;?>
</b> no esta registrada.
    </div>
</div><?php }
}
