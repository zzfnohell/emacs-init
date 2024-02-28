from conan import ConanFile
from conan.tools.cmake import CMakeDeps, CMakeToolchain, CMake


class ConanApplication(ConanFile):
    package_type = "application"
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps"
    options = {"shared": [True, False], "build_tests": [True, False]}
    default_options = {
        "sqlite3/*:shared": True,
        "lua/*:shared": True,
        "shared": False,
        "build_tests": False
    }

    def generate(self):
        tc = CMakeToolchain(self)
        tc.user_presets_path = False
        tc.generate()

    def requirements(self):
        requirements = self.conan_data.get('requirements', [])
        for requirement in requirements:
            self.requires(requirement)

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()
        # here you can run CTest, launch your binaries, etc
        cmake.test()
