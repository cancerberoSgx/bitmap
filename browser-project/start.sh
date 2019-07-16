sh build.sh 
npx watch "  echo "" && haxe project.hxml && echo "" && echo compiled" src &
sh build.sh 
npx http-server bin