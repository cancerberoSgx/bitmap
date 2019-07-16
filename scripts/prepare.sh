sh scripts/test.sh && \
sh scripts/doc.sh && \
npx markdown-toc README.md -i && \
cd browser-project && \
sh build.sh && \
rm -rf ../docs/playground && \
cp -r bin ../docs/playground

CODE="$?"
echo "

Process exit: $CODE
"

exit $CODE