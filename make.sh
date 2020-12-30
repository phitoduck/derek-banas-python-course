#!/bin/bash

#####################
# --- Constants --- #
#####################

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

#####################
# --- Functions --- #
#####################

function help() {
    echo "[PDF Generator] the following are make arguments"
    echo "help          -- See command tips"
    echo "serve         -- Run the development server with this directory mounted as a volume"
    echo "clean-images  -- Remove the docker image used for development and build"
    echo "clean-build   -- Remove the build artifacts"
    echo "build-images  -- Build/pull the docker images needed for this project"
    echo "build         -- Build web files from this project and put them into a site/ folder"
}

function serve() {
    # launch the mkdocs-material dev server; mount the script directory as a volume
    docker run --rm -it -p 8000:8000 -v ${THIS_DIR}:/docs squidfunk/mkdocs-material
}

function build-images() {
    # use docker to build the site/ folder from the md files in this directory
    docker pull squidfunk/mkdocs-material
    docker build -t pdf-maker -f ${THIS_DIR}/pdf-maker/Dockerfile ${THIS_DIR}
}

function build() {
    # use docker to build the site/ folder from the md files in this directory
    docker run --rm -v ${THIS_DIR}:/docs squidfunk/mkdocs-material build
    docker run -v "${THIS_DIR}:/derek-banas" pdf-maker
}

function clean-images() {
    # delete all images matching the image tag
    docker image rm --force $(docker image ls | grep "$IMAGE_TAG" | tr -s ' ' | cut -d ' ' -f 3)
    docker image rm --force $(docker image ls | grep "pdf-maker" | tr -s ' ' | cut -d ' ' -f 3)
}

function clean-build() {
    # delete the site/ artifact folder
    rm -rf "$THIS_DIR/site/"
}

################
# --- Main --- #
################

case $1 in
    "help")
        help
    ;;

    "serve")
        serve
    ;;

    "build")
        build
    ;;

    "build-images")
        build-images
    ;;

    "clean-images")
        clean-images
    ;;

    "clean-build")
        clean-build
    ;;

    *)
        echo "[PDF Generator] error: invalid arguments. Use \"./make.sh help\" to see run options"
        exit 1
    ;;
esac
