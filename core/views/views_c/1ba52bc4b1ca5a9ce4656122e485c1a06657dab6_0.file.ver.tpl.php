<?php
/* Smarty version 3.1.36, created on 2021-03-19 16:12:15
  from 'C:\xampp\htdocs\Contaduria\app\empresas\templates\ver.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_6054bf4fd2d686_49155406',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '1ba52bc4b1ca5a9ce4656122e485c1a06657dab6' => 
    array (
      0 => 'C:\\xampp\\htdocs\\Contaduria\\app\\empresas\\templates\\ver.tpl',
      1 => 1615989764,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6054bf4fd2d686_49155406 (Smarty_Internal_Template $_smarty_tpl) {
echo '<script'; ?>
>
    const PLANES = JSON.parse(`<?php echo json_encode($_smarty_tpl->tpl_vars['planes']->value);?>
`);
<?php echo '</script'; ?>
>

<form class="m-2 p-2" id="form-datos">
    <input type="hidden" name="idEmpresa" value="<?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->id;?>
">

    <div class="card mb-3">
        <div class="card-body p-3">
            <h5 class="mb-0">
                <a href="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/Empresas/Index/" class="text-decoration-none">
                    <i class="fas fa-arrow-left pr-1 mr-1"></i>
                </a>
                <?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->razon_social;?>

            </h5>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-md-6">
            <div class="card mb-3">
                <div class="card-header">
                    <h5 class="mb-0">Datos basicos</h5>
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-12 col-md-4">
                            <div class="form-group">
                                <label for="input-rut" class="mb-0">RUT</label>
                                <input type="text" class="form-control" placeholder="RUT..." name="rut" id="input-rut" required value="<?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->rut;?>
">
                            </div>
                        </div>
    
                        <div class="col-12 col-md-8">
                            <div class="form-group">
                                <label for="input-razon_social" class="mb-0">Razon social</label>
                                <input type="text" class="form-control" placeholder="Razon social..." name="razon_social" id="input-razon_social" required value="<?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->razon_social;?>
">
                            </div>
                        </div>
    
                        <div class="col-12">
                            <div class="form-group">
                                <label for="input-correo" class="mb-0">Correo</label>
                                <input type="email" class="form-control" placeholder="Correo..." name="correo" id="input-correo" required value="<?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->correo;?>
">
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
        
        <div class="col-12 col-md-6">
            <div class="card mb-3">
                <div class="card-header">
                    <h5 class="mb-0">Planes</h5>
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label for="input-idPlan" class="mb-0">Plan</label>
                                <select class="form-control" name="idPlan" id="input-idPlan">
                                    <option value="">Asignar un plan</option>
                                    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['planes']->value, 'plan');
$_smarty_tpl->tpl_vars['plan']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['plan']->value) {
$_smarty_tpl->tpl_vars['plan']->do_else = false;
?>
                                        <?php if ($_smarty_tpl->tpl_vars['plan']->value['idPlan'] == $_smarty_tpl->tpl_vars['objEmpresa']->value->idPlan) {?>
                                            <option value="<?php echo $_smarty_tpl->tpl_vars['plan']->value['idPlan'];?>
" selected><?php echo $_smarty_tpl->tpl_vars['plan']->value['nombre'];?>
</option>
                                        <?php } else { ?>
                                            <option value="<?php echo $_smarty_tpl->tpl_vars['plan']->value['idPlan'];?>
"><?php echo $_smarty_tpl->tpl_vars['plan']->value['nombre'];?>
</option>
                                        <?php }?>
                                    <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                                </select>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-group">
                                <label class="mb-0">Detalle</label>
                                <textarea id="input-detalle" disabled cols="30" rows="3" class="form-control" placeholder="Detalle del plan..."></textarea>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-group">
                                <label for="input-fechaInicioPlan" class="mb-0">Fecha inicio</label>
                                <input type="date" class="form-control" name="fechaInicioPlan" id="input-fechaInicioPlan" value="<?php echo $_smarty_tpl->tpl_vars['objEmpresa']->value->fechaInicioPlan;?>
">
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
    </div>

    <div class="card">
        <div class="card-body p-3">
            <div class="text-center">
                <button type="submit" class="btn btn-success w-100px">
                    Guardar
                </button>
            </div>
        </div>
    </div>
</form><?php }
}
