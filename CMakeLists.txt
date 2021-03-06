cmake_minimum_required (VERSION 2.6 FATAL_ERROR)
if(COMMAND cmake_policy)
        cmake_policy(SET CMP0003 NEW)
endif(COMMAND cmake_policy)
project(qutim)

if( MAEMO6 )
#	FIXME
	add_definitions( -DMEEGO_VERSION_MAJOR=1 -DMEEGO_VERSION_MINOR=2 -DMEEGO_VERSION_PATCH=0 -DMEEGO_EDITION=harmattan -DMEEGO_EDITION_HARMATTAN )
	set(DEFAULT_DECLARATIVE_UI on )
else()
	set(DEFAULT_DECLARATIVE_UI off )
endif()
option(DECLARATIVE_UI "Use declarative UI" ${DEFAULT_DECLARATIVE_UI})

set( QUTIM_PATH "${CMAKE_CURRENT_SOURCE_DIR}/core" CACHE FILEPATH "Path to qutim sources")
set( QUTIM_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/core/libqutim/include" CACHE FILEPATH "Path to qutim headers")
set( QUTIM_LIBRARY libqutim CACHE FILEPATH "Path to qutim library")
set(QUTIM_PATH "${CMAKE_CURRENT_SOURCE_DIR}/core" CACHE FILEPATH "Path to qutim sources")
set(QUTIM_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/core/libqutim/include" CACHE FILEPATH "Path to qutim headers")
set(QUTIM_LIBRARY libqutim CACHE FILEPATH "Path to qutim library")

option(QUTIM_ENABLE_ALL_PLUGINS "Enable plugins by default" ON)

find_package( Qt4 REQUIRED )
list(APPEND CMAKE_MODULE_PATH "${QUTIM_PATH}/cmake")
include(CPackOptions.cmake.in)
include(QutIMMacros)

set(QUTIM_ADDITIONAL_PATHS "protocols" "plugins")
set(QUTIM_ADDITIONAL_PATHS "${QUTIM_ADDITIONAL_PATHS}" CACHE INTERNAL "" FORCE)
set(QUTIM_BUNDLE_NAME qutim.app)

add_subdirectory(core)
add_subdirectory(translations)
add_subdirectory(config)
add_subdirectory(deployment)

# ADD_CUSTOM_TARGET(uninstall
#   "${CMAKE_COMMAND}" -P "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake")
