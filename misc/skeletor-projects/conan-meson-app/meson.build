project('__PROJECT_NAME__', 'c', 'cpp')

project_name = '__PROJECT_NAME__'
test_project_name = project_name + '_tests'
lib_name = project_name

deps = [
  dependency('sqlite3', version : '3.40.1'),
  dependency('spdlog', version : '1.11.0'),
  dependency('doctest', version: '2.4.9')
]

inc = include_directories('include')

subdir('include')
subdir('lib')
subdir('src')
subdir('tests')


