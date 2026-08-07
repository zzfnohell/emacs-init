project('__PROJECT-NAME__', 'c', 'cpp',
  version: '0.0.1',
  default_options: ['warning_level=2', 'cpp_std=c++20'])

project_name = '__PROJECT-NAME__'
test_project_name = project_name + '_tests'
lib_name = project_name

deps = [
  dependency('sqlite3'),
  dependency('spdlog'),
  dependency('doctest'),
]

inc = include_directories('include')

subdir('include')
subdir('lib')
subdir('src')
subdir('tests')
