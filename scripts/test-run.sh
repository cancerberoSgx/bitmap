test() {
  # haxe test/targets/test-interp.hxml && \
  java -jar bin/test/java/TestMain-Debug.jar && \
  neko bin/test/Main.n && \
  node bin/test/Main.js && \
  haxe test/phantomjs/run.hxml bin/test/MainPhantom.js && \
  # php bin/test/php && \
  bin/test/Main.cpp/testMain-debug
}

time test

CODE="$?"
echo "

Process exit: $CODE
"

exit $CODE