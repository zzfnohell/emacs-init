PUSHD build/debug 
conan install ../../
REM conan install -s build_type=Debug ../../
cmake -S ../../  -G "Visual Studio 16 2019" -A x64  -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=install

POPD

REM cmake -S . -B build/release -G "Visual Studio 16 2019" -A x64 -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=install
