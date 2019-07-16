sh scripts/prepare.sh && \
node scripts/patch.js && \
sh scripts/clean.sh && \
sh scripts/pack.sh && \
haxelib submit bitmap.zip && \
sh scripts/clean.sh 

CODE="$?"
echo "

Process exit: $CODE
"

exit $CODE