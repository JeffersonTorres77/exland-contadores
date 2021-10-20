<?php
/* Smarty version 3.1.40, created on 2021-10-20 15:36:32
  from 'C:\xampp\htdocs\exland-contadores\app\login\templates\index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.40',
  'unifunc' => 'content_61701b60cf2a87_62496123',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'a544ba01e5623a54376a51a4b36c172d2d5d9c3e' => 
    array (
      0 => 'C:\\xampp\\htdocs\\exland-contadores\\app\\login\\templates\\index.tpl',
      1 => 1603831694,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_61701b60cf2a87_62496123 (Smarty_Internal_Template $_smarty_tpl) {
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
