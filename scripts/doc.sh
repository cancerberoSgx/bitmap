rm -rf types.xml docs
haxe scripts/doc.hxml
haxelib run dox -i types.xml --title "Bitmap" -D version 1.0.0 --include "(bitmap)" -o docs
rm -rf types.xml