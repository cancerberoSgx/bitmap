sh scripts/clean.sh && \
sh scripts/test-local.sh && \
sh scripts/test-sample-project.sh
CODE="$?"
echo "

Process exit: $CODE
"

exit $CODE