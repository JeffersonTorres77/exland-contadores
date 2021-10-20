<?php
/* Smarty version 3.1.36, created on 2021-09-21 17:44:32
  from 'C:\xampp\htdocs\contadores\app\login\templates\index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_6149fde0251081_79605749',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'a3f984054c42d6d415a9193dd76b8d8f79f033f1' => 
    array (
      0 => 'C:\\xampp\\htdocs\\contadores\\app\\login\\templates\\index.tpl',
      1 => 1603831694,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6149fde0251081_79605749 (Smarty_Internal_Template $_smarty_tpl) {
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
