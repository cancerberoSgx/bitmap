npx markdown-toc README.md -i
sh scripts/clean.sh
node scripts/patch.js
zip -x "test/assets/*" "bin/*" "tmp*" "*.zip" ".*" -r bitmap *
haxelib submit bitmap.zip
rm bitmap.zip