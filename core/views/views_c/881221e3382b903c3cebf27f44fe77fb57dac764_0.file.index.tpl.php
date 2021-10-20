<?php
/* Smarty version 3.1.36, created on 2020-10-27 22:48:13
  from 'C:\xampp\htdocs\contaduria\app\login\templates\index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_5f98959d848202_46295510',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '881221e3382b903c3cebf27f44fe77fb57dac764' => 
    array (
      0 => 'C:\\xampp\\htdocs\\contaduria\\app\\login\\templates\\index.tpl',
      1 => 1603835293,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5f98959d848202_46295510 (Smarty_Internal_Template $_smarty_tpl) {
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
