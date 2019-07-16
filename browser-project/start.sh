rm -rf bin
haxe  project.hxml
cp static/* bin
# npx watch "haxe project.hxml" . &
npx watch "haxe project.hxml && echo compiled" src & 
npx http-server bin