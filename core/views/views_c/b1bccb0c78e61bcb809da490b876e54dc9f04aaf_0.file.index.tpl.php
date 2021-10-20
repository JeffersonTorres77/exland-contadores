<?php
/* Smarty version 3.1.36, created on 2020-10-29 16:05:00
  from 'C:\xampp\htdocs\Contaduria\app\login\templates\index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_5f9ada1c2370a0_00797546',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'b1bccb0c78e61bcb809da490b876e54dc9f04aaf' => 
    array (
      0 => 'C:\\xampp\\htdocs\\Contaduria\\app\\login\\templates\\index.tpl',
      1 => 1603835293,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5f9ada1c2370a0_00797546 (Smarty_Internal_Template $_smarty_tpl) {
?><form id="form-login">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <div class="input-group-text">
                <i class="fas fa-user"></i>
            </div>
        </div>

        <input type="text" class="form-control" name="correo" placeholder="Correo..." required>
    </div>

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <div class="input-group-text">
                <i class="fas fa-key"></i>
            </div>
        </div>

        <input type="password" class="form-control" name="clave" placeholder="Contraseña..." required>
    </div>
    
    <div class="w-100">
        <button class="btn btn-warning w-100">
            Acceder
        </button>
    </div>
</form><?php }
}
