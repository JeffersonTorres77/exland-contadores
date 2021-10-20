<?php
/* Smarty version 3.1.36, created on 2020-10-23 14:41:52
  from 'C:\xampp\htdocs\contaduria\app\valor_uf\templates\index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_5f92cf901053c0_29618485',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '918a0f94fb7ada2aa7c082adb9972ad99d9de1b6' => 
    array (
      0 => 'C:\\xampp\\htdocs\\contaduria\\app\\valor_uf\\templates\\index.tpl',
      1 => 1603226916,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5f92cf901053c0_29618485 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="m-2 p-2">
    <div class="row">
        <div class="col-12 col-md-6 mb-3">
            <div class="card bg-success text-white">
                <div class="card-body p-0'">
                    <div class="row">
                        <div class="col-6">
                            <div class="h6">
                                <label class="h4" id="card-label-monto"><?php echo $_smarty_tpl->tpl_vars['uf']->value['monto'];?>
</label>
                                <label style="position: relative; top: -5px;"><?php echo $_smarty_tpl->tpl_vars['moneda']->value->simbolo;?>
</label>
                            </div>

                            <div>
                                Fecha <label id="card-label-fecha" class="mb-0"><?php echo Formato::Fecha($_smarty_tpl->tpl_vars['uf']->value['fecha']);?>
</label>
                            </div>
                        </div>

                        <div class="col-6">
                            <div style="font-size: 4em; opacity: .5;" class="d-flex justify-content-end py-1 text-dark">
                                <i class="fas fa-money-check-alt"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-footer text-center p-0">
                    <div class="row">
                        <div class="col-6 text-center pr-0">
                            <div style="font-size: 0.9em;" class="p-2 card-footer-button" data-toggle="modal" data-target="#modal-actualizar">
                                <i class="fas fa-sync-alt mr-2"></i>
                                Actualizar
                            </div>
                        </div>

                        <div class="col-6 text-center pl-0">
                            <a href="http://www.sii.cl/valores_y_fechas/uf/uf2020.htm" target="_blank" class="text-white">
                                <div style="font-size: 0.9em;" class="p-2 card-footer-button">
                                    Mas información
                                    <i class="fas fa-arrow-circle-right ml-2"></i>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-md-6">
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0">Historial de cambios</h5>
                </div>

                <div class="card-body">
                    <table class="table table-striped table-hover table-bordered mb-0 w-100 table-sm" id="tabla">
                        <thead>
                            <tr>
                                <th style="width: 50px;">ID</th>
                                <th style="width: auto;">Fecha</th>
                                <th style="width: 100px;">Monto</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td colspan="2">
                                    <h5 class="mb-0 text-center">. . .</h5>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- MODAL ACTUALIZAR -->
<div class="modal fade" id="modal-actualizar">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <form class="modal-content" id="form-actualizar">
            <div class="modal-header bg-success text-white">
                <h5 class="mb-0">Actualizar precio del UF</h5>
                <button class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
                <div class="form-group">
                    <label for="actualizar-input-monto" class="mb-1">Nuevo monto</label>
                    <input type="number" class="form-control" id="actualizar-input-monto" step="0.01" name="monto" placeholder="Monto del UF..." required>
                </div>

                <div class="form-group mb-0">
                    <label for="actualizar-input-fecha" class="mb-1">Fecha</label>
                    <input type="date" class="form-control" id="actualizar-input-fecha" name="fecha" value="<?php echo $_smarty_tpl->tpl_vars['fecha']->value;?>
" required>
                </div>
            </div>
            
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn w-100px btn-outline-secondary" data-dismiss="modal">
                    Cerrar
                </button>

                <button type="submit" class="btn w-100px btn-success">
                    Actualizar
                </button>
            </div>
        </form>
    </div>
</div>
<!-- FIN MODAL ACTUALIZAR --><?php }
}
