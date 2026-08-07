from conan import ConanFile
from conan.tools.cmake import CMakeDeps, CMakeToolchain, CMake


class ConanApplication(ConanFile):
    package_type = "application"
    settings = "os", "compiler", "build_type", "arch"
    options = {"shared": [True, False]}
    default_options = {
        "sqlite3/*:shared": True,
        "shared": False,
    }

    def layout(self):
        self.folders.build = "build"
        self.folders.generators = "build"

    def generate(self):
        deps = CMakeDeps(self)
        deps.generate()
        tc = CMakeToolchain(self)
        tc.user_presets_path = False
        tc.generate()

    def requirements(self):
        for requirement in self.conan_data.get("requirements", []):
            self.requires(requirement)

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()
        cmake.test()
