set_property(GLOBAL APPEND PROPERTY TestSources ${CMAKE_CURRENT_LIST_DIR}/green_vacuum.cpp)
add_test(NAME green_vacuum COMMAND unit_tests.x [green_vacuum])
set_property(GLOBAL APPEND PROPERTY TestSources ${CMAKE_CURRENT_LIST_DIR}/green_uniform_dielectric.cpp)
add_test(NAME green_uniform_dielectric COMMAND unit_tests.x [green_uniform_dielectric])
set_property(GLOBAL APPEND PROPERTY TestSources ${CMAKE_CURRENT_LIST_DIR}/green_ionic_liquid.cpp)
add_test(NAME green_ionic_liquid COMMAND unit_tests.x [green_ionic_liquid])
set_property(GLOBAL APPEND PROPERTY TestSources ${CMAKE_CURRENT_LIST_DIR}/green_anisotropic_liquid.cpp)
add_test(NAME green_anisotropic_liquid COMMAND unit_tests.x [green_anisotropic_liquid])
set_property(GLOBAL APPEND PROPERTY TestSources ${CMAKE_CURRENT_LIST_DIR}/green_spherical_diffuse.cpp)
add_test(NAME green_spherical_diffuse COMMAND unit_tests.x [green_spherical_diffuse])
