# Executables for testing separate from Boost unit test framework or for profiling purposes
# The executables will be created in ${PROJECT_BINARY_DIR}/src/bin

list(APPEND external_libraries ${Boost_SYSTEM_LIBRARY} ${Boost_TIMER_LIBRARY} ${Boost_CHRONO_LIBRARY})

#add_executable(debug_wavcav.x debug_wavcav.cpp)
#target_link_libraries(debug_wavcav.x solver cavity wavcav pwl wem utils)

#add_executable(plot_green_spherical.x plot_green_spherical.cpp)
#target_link_libraries(plot_green_spherical.x utils ${external_libraries})

#add_executable(plot_green_spherical-CASE1.x plot_green_spherical-CASE1.cpp)
#target_link_libraries(plot_green_spherical-CASE1.x utils ${external_libraries})
#add_executable(plot_green_spherical-CASE2.x plot_green_spherical-CASE2.cpp)
#target_link_libraries(plot_green_spherical-CASE2.x utils ${external_libraries})
#add_executable(plot_green_spherical-CASE3.x plot_green_spherical-CASE3.cpp)
#target_link_libraries(plot_green_spherical-CASE3.x utils ${external_libraries})
#add_executable(plot_green_spherical-CASE4.x plot_green_spherical-CASE4.cpp)
#target_link_libraries(plot_green_spherical-CASE4.x utils ${external_libraries})

#add_executable(check_Coulomb_coefficient.x check_Coulomb_coefficient.cpp)
#target_link_libraries(check_Coulomb_coefficient.x utils ${external_libraries})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)
list(APPEND external_libraries ${ZLIB_LIBRARIES})
add_executable(run_pcm.x run_pcm.cpp)
if(BUILD_CUSTOM_BOOST)
    add_dependencies(run_pcm.x custom_boost)
endif()
target_link_libraries(run_pcm.x pcm getkw ${external_libraries})
set_property(GLOBAL PROPERTY PCMSolver_EXECUTABLE ${PROJECT_BINARY_DIR}/bin/run_pcm.x)
unset(CMAKE_RUNTIME_OUTPUT_DIRECTORY)
