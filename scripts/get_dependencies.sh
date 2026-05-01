#!/usr/bin/bash
cd ../
mkdir sources
cd sources
git clone https://github.com/glfw/glfw
git clone https://github.com/g-truc/glm
git clone https://github.com/nothings/stb
curl -O -L https://github.com/spnda/fastgltf/archive/refs/tags/v0.7.2.tar.gz
tar -xvf ./v0.7.2.tar.gz
git clone https://github.com/google/shaderc
./shaderc/utils/git-sync-deps
