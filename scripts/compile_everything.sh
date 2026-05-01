#!/usr/bin/bash
echo "Building base project, this is needed for other demos..."
cd ../base
cmake -B build -G Ninja
cmake --build build -- -j $(nproc)
echo "Base build done!"
cd ../sponza-brute
echo "Building sponza demo..."
cmake -B build -G Ninja
cmake --build build -- -j $(nproc)
echo "Sponza demo built!"
cd ../demo-culling
echo "Building culling demo..."
cmake -B build -G Ninja
cmake --build build -- -j $(nproc)
echo "Culling demo built!"
cd ../demo-cascaded-shadow-mapping
echo "Building cascaded shadow mapping demo..."
cmake -B build -G Ninja
cmake --build build -- -j $(nproc)
echo "CSM demo built!"
cd ../demo-skeletal-anim
echo "Building skeletal anim demo..."
cmake -B build -G Ninja
cmake --build build -- -j $(nproc)
echo "Skeletal anim demo built!"
