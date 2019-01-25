#!/bin/bash

# Identify c++ compiler for boost.
cat <<EOF > ${SRC_DIR}/tools/build/src/site-config.jam
using darwin : : $BUILD_PREFIX/bin/g++ ;
EOF

./bootstrap.sh \
    --prefix=$PREFIX \
    --with-icu=$CONDA_PREFIX \
    --with-libraries=filesystem,program_options,regex,serialization,signals,system

./b2 -j$CPU_COUNT install
