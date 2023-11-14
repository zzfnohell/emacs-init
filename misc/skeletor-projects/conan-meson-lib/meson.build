project('__PROJECT-NAME__', 'c', 'cpp',version : '1.0.0', license : 'MIT')
project_name = '__PROJECT-NAME__'
test_project_name = project_name + '_tests'
lib_name = project_name

deps = [
  dependency('sqlite3', version : '3.40.1'),
  dependency('spdlog', version : '1.11.0'),
  dependency('doctest', version: '2.4.9')
]

inc = include_directories('include')

subdir('include')
subdir('src')
subdir('test')

pkg_mod = import('pkgconfig')
pkg_mod.generate(libraries : main_lib,
                 version : '1.0',
                 name : 'lib' + lib_name,
                 filebase : lib_name,
                 description : 'A Library to barnicate your foos.')