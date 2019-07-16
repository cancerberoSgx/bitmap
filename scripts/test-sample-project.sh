sh scripts/pack.sh && \
cd sample-project && \
haxelib install ../bitmap.zip && \

haxe neko.hxml && \
# haxe node.hxml && \
haxe cpp.hxml && \
cd ..

CODE="$?"
echo "

Process exit: $CODE
"

exit $CODE