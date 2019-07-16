sh scripts/test.sh && \
sh scripts/doc.sh && \
npx markdown-toc README.md -i && \
cd browser-project && \
sh build.sh && \
rm -rf ../docs/playgorund && \
cp -r bin ../docs/playgorund

CODE="$?"
echo "

Process exit: $CODE
"

exit $CODE