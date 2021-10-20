<?php
/* Smarty version 3.1.36, created on 2020-10-14 00:03:46
  from 'C:\xampp\htdocs\contaduria\app\gestion_sistema\templates\usuarios\404.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_5f862442677a90_22388199',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '8930f64c0d4127ed3b8348317047259922b8af47' => 
    array (
      0 => 'C:\\xampp\\htdocs\\contaduria\\app\\gestion_sistema\\templates\\usuarios\\404.tpl',
      1 => 1602626626,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5f862442677a90_22388199 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="m-2 p-2">
    <div class="alert alert-danger">
        <h5 class="border-bottom border-danger pb-2">Error</h5>
        El usuario <b>ID: <?php echo $_smarty_tpl->tpl_vars['idUsuario']->value;?>
</b> no esta registrado.
    </div>
</div><?php }
}
