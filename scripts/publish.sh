npx markdown-toc README.md -i
sh scripts/pack.sh
node scripts/patch.js
haxelib submit bitmap.zip
rm bitmap.zip