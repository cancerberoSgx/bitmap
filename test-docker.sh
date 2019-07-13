# build docker image - only need to run once:
docker build -t bitmap-test test/docker/alpine-linux
# run tests in the container:
docker run --rm -it --workdir /code -v "$PWD":/code bitmap-test sh test/docker/test.sh 