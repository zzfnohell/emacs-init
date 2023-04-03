
conan install . --output-folder build --build=missing

cd build
cmake -S ..  -G "Visual Studio 17 2022" -A x64  -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE="conan_toolchain.cmake"