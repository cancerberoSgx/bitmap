sh scripts/test.sh && \
sh scripts/doc.sh && \
npx markdown-toc README.md -i


CODE="$?"
echo "

Process exit: $CODE
"

exit $CODE