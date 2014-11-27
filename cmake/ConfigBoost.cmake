# Just change the Boost version number here
# The version of the Boost archive we ship
set(BOOSTVER 1.54.0) 
# The minimum required version of Boost
set(BOOSTVERMIN 1.54.0) 
set(BUILD_CUSTOM_BOOST FALSE)
# List all components needed (except mpi and unit_test_framework) here.
# Components additionally required in PSI4: python, serialization, thread (Might be useful in the future?)
# mpi and unit_test_framework will be added afterwards, if needed.
list(APPEND needed_components filesystem system)
set(Boost_USE_STATIC_LIBS    ON)
set(Boost_USE_MULTITHREADED  ON)
set(Boost_USE_STATIC_RUNTIME OFF)
if(ENABLE_TESTS)
   list(APPEND needed_components unit_test_framework)
   find_package(Boost ${BOOSTVERMIN} COMPONENTS "${needed_components}")
else()
   find_package(Boost ${BOOSTVERMIN} COMPONENTS "${needed_components}")
endif()
if(NOT Boost_FOUND)
   # Set also variables usually set by find_package
   message(STATUS "Boost ${BOOSTVERMIN} not found. The pre-packaged version will be built.")
   set(BUILD_CUSTOM_BOOST TRUE)
   set(CUSTOM_BOOST_LOCATION ${EXTERNAL_PROJECT_INSTALL_PREFIX}/boost)
   string(REGEX REPLACE "\\." "0" Boost_VERSION ${BOOSTVER})
   math(EXPR Boost_MAJOR_VERSION "${Boost_VERSION} / 100000")
   math(EXPR Boost_MINOR_VERSION "${Boost_VERSION} / 100 % 1000")
   math(EXPR Boost_SUBMINOR_VERSION "${Boost_VERSION} % 100")
   set(Boost_LIB_VERSION ${Boost_MAJOR_VERSION}_${Boost_MINOR_VERSION})
   add_subdirectory(external)
   set(Boost_FOUND TRUE)
   set(Boost_LIBRARIES "")
   # Read documentation in FindBoost.cmake for the difference between the singular and plural forms
   set(Boost_INCLUDE_DIR  ${CUSTOM_BOOST_LOCATION}/include)
   set(Boost_INCLUDE_DIRS ${CUSTOM_BOOST_LOCATION}/include) 
   set(Boost_LIBRARY_DIR  ${CUSTOM_BOOST_LOCATION}/lib)
   set(Boost_LIBRARY_DIRS ${CUSTOM_BOOST_LOCATION}/lib)
   # We will link statically, so just set the Boost_<C>_LIBRARY for the static library 
   foreach(_component ${needed_components})
      string(TOUPPER ${_component} _COMP)
      set(Boost_${_COMP}_FOUND TRUE)
      set(Boost_${_COMP}_LIBRARY libboost_${_component}-${Boost_LIB_VERSION}.a)
      list(APPEND Boost_LIBRARIES ${Boost_${_COMP}_LIBRARY})
   endforeach()
endif()
if(CMAKE_SYSTEM_NAME MATCHES "Linux")
   find_package(RT)
   list(APPEND Boost_LIBRARIES ${LIBRT_LIBRARIES})
endif()
