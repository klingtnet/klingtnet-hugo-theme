#!/bin/bash

set -euo pipefail

NORMALIZE_VERSION="4.0.0"
ANIMATE_VERSION="3.5.1"
COLORS_VERSION="2.2.0"
ZEPTO_VERSION="1.1.6"
KATEX_VERSION="0.5.1"
CSS_PATH=static/css
JS_PATH=static/js

setup_normalize() {
    local url="https://cdnjs.cloudflare.com/ajax/libs/normalize/${NORMALIZE_VERSION}/normalize"
    pushd $CSS_PATH &&\
        curl -Lsf --remote-name ${url}.min.css &&\
        curl -Lsf --remote-name ${url}.min.css.map &&\
    popd
}

setup_animate() {
    local url="https://raw.githubusercontent.com/daneden/animate.css/${ANIMATE_VERSION}/animate.min.css"
    pushd $CSS_PATH &&\
        curl -Lsf --remote-name ${url} &&\
    popd
}

setup_colors() {
    local url="https://s3-us-west-2.amazonaws.com/colors-css/${COLORS_VERSION}/colors.min.css"
    pushd $CSS_PATH &&\
        curl -Lsf --remote-name ${url} &&\
    popd
}

setup_zepto() {
    local url="https://cdnjs.cloudflare.com/ajax/libs/zepto/${ZEPTO_VERSION}/zepto.min.js"
    pushd $JS_PATH &&\
        curl -Lsf --remote-name ${url} &&\
    popd
}

setup_katex() {
    local url="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/${KATEX_VERSION}"
    pushd $CSS_PATH &&\
        curl -Lsf --remote-name ${url}/katex.min.css &&\
    popd
    pushd $JS_PATH &&\
        curl -Lsf --remote-name ${url}/katex.min.js &&\
        curl -Lsf --remote-name ${url}/contrib/auto-render.min.js &&\
    popd
}

setup_normalize &&\
    setup_animate &&\
    setup_colors &&\
    setup_zepto &&\
    setup_katex
# highlight.js is a custom build to get Rust support

