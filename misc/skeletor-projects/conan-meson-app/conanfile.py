from conan import ConanFile
from conan.tools.meson import MesonToolchain, Meson


class ConanApplication(ConanFile):
    package_type = "application"
    settings = "os", "compiler", "build_type", "arch"
    generators = "PkgConfigDeps"
    options = {"shared": [True, False], "build_tests": [True, False]}
    default_options = {
        "sqlite3/*:shared": True,
        "lua/*:shared": True,
        "shared": False,
        "build_tests": False
    }

    def generate(self):
        tc = MesonToolchain(self)
        tc.generate()

    def requirements(self):
        requirements = self.conan_data.get('requirements', [])
        for requirement in requirements:
            self.requires(requirement)

    def build(self):
        meson = Meson(self)
        meson.configure()
        meson.build()
        # here you can run CTest, launch your binaries, etc
        meson.test()
