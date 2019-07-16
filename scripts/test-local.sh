sh scripts/clean.sh
haxe test/targets/test-node.hxml && \
haxe test/targets/test-neko.hxml && \
# haxe test/targets/test-python.hxml && \
haxe test/targets/test-interp.hxml && \
haxe test/targets/test-java.hxml && \
haxe test/targets/test-phantomjs.hxml && \
# haxe test/targets/test-php.hxml && \
haxe test/targets/test-cpp.hxml

CODE="$?"
echo "

Process exit: $CODE
"

exit $CODE