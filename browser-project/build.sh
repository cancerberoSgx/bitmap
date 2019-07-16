rm -rf bin && \
haxe  project.hxml && \
cp static/* bin
rm -rf ../docs/playground
mkdir -p ../docs/playground
cp -r bin/* ../docs/playground