PUSHD build 
conan install  --build missing ../
REM conan install -s build_type=Debug ../../
cmake -S ../  -G "Visual Studio 17 2022" -A x64  -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=install

POPD

REM cmake -S . -B build/release -G "Visual Studio 16 2019" -A x64 -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=install
