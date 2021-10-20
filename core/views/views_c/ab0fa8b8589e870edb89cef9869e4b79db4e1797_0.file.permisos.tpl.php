<?php
/* Smarty version 3.1.36, created on 2020-10-14 04:20:14
  from 'C:\xampp\htdocs\contaduria\app\gestion_sistema\templates\permisos.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_5f86605eb777b5_44237625',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ab0fa8b8589e870edb89cef9869e4b79db4e1797' => 
    array (
      0 => 'C:\\xampp\\htdocs\\contaduria\\app\\gestion_sistema\\templates\\permisos.tpl',
      1 => 1602642014,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5f86605eb777b5_44237625 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="m-2 p-2">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0">
                Permisos

                <div class="datatable-header-options">
                    <button onclick="RefrescarTabla()">
                        <i class="fas fa-sync-alt"></i>
                    </button>
                </div>
            </h5>
        </div>

        <div class="card-body">
            <table class="table table-bordered table-striped table-hover" style="width: 100%;" id="tabla">
                <thead class="table-sm">
                    <tr>
                        <th style="width: auto;">Menu</th>
                        <th style="width: 100px;">Permiso</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td colspan="2">
                            <h5 class="mb-0 text-center p-2">. . .</h5>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div><?php }
}
