main_lib_test_sources = ['lib_test.cpp']

main_lib_test_exe = executable(test_project_name, main_lib_test_sources,
                     include_directories : inc,
                     dependencies : deps,
                     link_with : main_lib.get_static_lib())
					 
test('lib test', main_lib_test_exe)