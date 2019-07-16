# cd browser-project
rm -rf bin
haxe  project.hxml
cp static/* bin
npx http-server bin
