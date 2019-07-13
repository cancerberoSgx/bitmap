haxe test-node.hxml && \
haxe test-neko.hxml && \
# haxe test-python.hxml && \
haxe test-interp.hxml && \
haxe test-java.hxml && \
haxe test-phantomjs.hxml && \
haxe test-cpp.hxml
CODE="$?"
echo "

Process exit: $CODE
"

exit $CODE