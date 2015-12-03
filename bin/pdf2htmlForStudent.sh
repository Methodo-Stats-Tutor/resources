#!/bin/bash

chemin=$1
entryPdf=$2
uid=$3


cd "$chemin" &&
mkdir -p "$uid" &&
cd "$uid" &&

pdf2htmlEX --embed-css 0 --css-filename "$uid.css" --embed-image 0 --optimize-text 1 --fit-width 1000 "$chemin$entryPdf" "$uid.html" &&
awk 'BEGIN{RS="</script>"}/<script/{gsub("<script.*","")}{print}END{if(RS=="")print}' "$uid.html" > "$uid.temp" &&
mv $uid.temp $uid.html &&
sed  -i "s/src=\"/src=\"$uid\//" "$uid.html" &&
sed  -i "s/href=\"/href=\"$uid\//" "$uid.html"  &&

sed -i '/<\/body>/i <link rel="stylesheet" href="../../tools/zenburn.css">\n<link rel="stylesheet" href="../../tools/css/theme-dark/annotorious-dark.css" />\n<link rel="stylesheet" type="text/css" href="../../tools/annotator.min.css">\n<script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>\n<script src="../../tools/highlight.pack.js"></script>\n<link rel="stylesheet" type="text/css" href="../../tools/css/modeQcm/annotorious.css">\n<script src="../../tools/annotator.modified.min.js"></script>\n<script src="../../tools/mstAnnot2.js"></script>\n' "$uid.html" &&





mv "$uid.html" "../$uid.html" &&
cd .. &&
rm "$entryPdf"
