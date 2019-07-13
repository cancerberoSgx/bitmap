rm -rf bin

haxe test-node.hxml && \
haxe test-neko.hxml && \
# haxe test-python.hxml && \
haxe test-interp.hxml && \
# haxe test-java.hxml && \
# haxe test-phantomjs.hxml && \
# haxe test-php.hxml && \
haxe test-cpp.hxml && \
echo "Done"

CODE="$?"
echo "

Process exit: $CODE
"

exit $CODE

# CODE="$?"
# echo "

# Process exit: $CODE
# "

# exit $CODE