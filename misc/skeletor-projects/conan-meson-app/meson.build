project('__PROJECT-NAME__', 'c', 'cpp')
project_name = '__PROJECT-NAME__'
test_project_name = project_name + '_tests'

deps = [
  dependency('sqlite3', version : '3.40.1'),
  dependency('spdlog', version : '1.11.0'),
  dependency('doctest', version: '2.4.9')
]

executable(project_name, 'src/main.cpp', dependencies: deps)
executable(test_project_name, 'tests/main_test.cpp',dependencies: deps)
