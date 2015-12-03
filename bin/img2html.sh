#!/bin/bash

chemin=$1
originalFile=$2
uid=$3


cd "$chemin" &&

    cat <<EOT > $uid.php
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title></title>
</head>
<body>
<div id="sidebar">
<div id="outline">
</div>
</div>
<div id="page-container">
<img alt="" src="$originalFile"/>
</div>

<link rel="stylesheet" href="../../tools/zenburn.css">
<link rel="stylesheet" href="../../tools/css/theme-dark/annotorious-dark.css" />
<link rel="stylesheet" type="text/css" href="../../tools/annotator.<?php echo \$_GET["mode"]; ?>.css">
<script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="../../tools/highlight.pack.js"></script>
<link rel="stylesheet" type="text/css" href="../../tools/css/<?php echo \$_GET["mode"]; ?>/annotorious.css">
<script src="../../tools/annotator.<?php echo \$_GET["mode"]; ?>.js"></script>
<script src="../../tools/annotorious.<?php echo \$_GET["mode"]; ?>.min.js"></script>
<script src="../../tools/mstAnnot2.js"></script>
</body>
</html>
EOT

