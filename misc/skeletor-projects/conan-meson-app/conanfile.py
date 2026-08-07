from conan import ConanFile
from conan.tools.meson import MesonToolchain, Meson
from conan.tools.gnu import PkgConfigDeps


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
        deps = PkgConfigDeps(self)
        deps.generate()
        tc = MesonToolchain(self)
        tc.generate()

    def requirements(self):
        for requirement in self.conan_data.get("requirements", []):
            self.requires(requirement)

    def build(self):
        meson = Meson(self)
        meson.configure()
        meson.build()
        meson.test()
