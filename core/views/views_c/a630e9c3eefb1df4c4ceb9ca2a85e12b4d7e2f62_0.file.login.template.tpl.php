<?php
/* Smarty version 3.1.36, created on 2020-10-27 22:50:04
  from 'C:\xampp\htdocs\contaduria\core\views\login.template.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.36',
  'unifunc' => 'content_5f98960c68b200_91635022',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'a630e9c3eefb1df4c4ceb9ca2a85e12b4d7e2f62' => 
    array (
      0 => 'C:\\xampp\\htdocs\\contaduria\\core\\views\\login.template.tpl',
      1 => 1603835395,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5f98960c68b200_91635022 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $_smarty_tpl->tpl_vars['sistemaNombre']->value;?>
</title>
    
    <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/public/bootstrap/css/bootstrap.css?v=<?php echo $_smarty_tpl->tpl_vars['sistemaVersion']->value;?>
">
    <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/public/jquery/js/jquery.min.js?v=<?php echo $_smarty_tpl->tpl_vars['sistemaVersion']->value;?>
"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/public/font-awesome/js/all.min.js?v=<?php echo $_smarty_tpl->tpl_vars['sistemaVersion']->value;?>
"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/public/bootstrap/js/bootstrap.min.js?v=<?php echo $_smarty_tpl->tpl_vars['sistemaVersion']->value;?>
"><?php echo '</script'; ?>
>

    <?php echo '<script'; ?>
>
        const BASE_URL = '<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
';
        const PRODUCCION = ('<?php echo (int) $_smarty_tpl->tpl_vars['sistemaProduccion']->value;?>
' == "0") ? false : true;
    <?php echo '</script'; ?>
>

    <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/public/core/css/core.css?v=<?php echo $_smarty_tpl->tpl_vars['sistemaVersion']->value;?>
">
    <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/public/core/js/core.js?v=<?php echo $_smarty_tpl->tpl_vars['sistemaVersion']->value;?>
" defer><?php echo '</script'; ?>
>

    <!-- ARCHIVOS DEL MODULO -->
    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['_css']->value, 'css');
$_smarty_tpl->tpl_vars['css']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['css']->value) {
$_smarty_tpl->tpl_vars['css']->do_else = false;
?>
        <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['css']->value;?>
?v=<?php echo $_smarty_tpl->tpl_vars['sistemaVersion']->value;?>
">
    <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>

    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['_js']->value, 'js');
$_smarty_tpl->tpl_vars['js']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['js']->value) {
$_smarty_tpl->tpl_vars['js']->do_else = false;
?>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['js']->value;?>
?v=<?php echo $_smarty_tpl->tpl_vars['sistemaVersion']->value;?>
" defer><?php echo '</script'; ?>
>
    <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
    <!-- FIN ARCHIVOS DEL MODULO -->
</head>
<body>

<div class="w-100 h-100 bg-light d-flex justify-content-center align-items-center">
    <div class="container-fluid" style="max-width: 400px; width: 90%;">
        <div class="card shadow">
            <img src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/public/core/img/logo.png" alt="Logo" class="logo">
            <div class="card-header bg-warning text-dark">
                <div class="text-center h5 mb-0 font-weight-normal">
                    <?php echo $_smarty_tpl->tpl_vars['sistemaNombre']->value;?>

                </div>
            </div>

            <div class="card-body">
                <?php $_smarty_tpl->_subTemplateRender($_smarty_tpl->tpl_vars['_pathContent']->value, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>
            </div>

            <div class="card-footer p-2">
                <div class="float-left text-muted small">
                    <?php echo $_smarty_tpl->tpl_vars['sistemaVersion']->value;?>

                </div>

                <div class="float-right text-muted small">
                    <?php echo $_smarty_tpl->tpl_vars['sistemaProduccion']->value ? 'Producción' : 'Desarrollo';?>

                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html><?php }
}
