if (NOT NO_INDICATE)
	list(APPEND SOURCES src/mpdindicator.cpp)
	list(APPEND HEADERS src/mpdindicator.h)
endif (NOT NO_INDICATE)

qutim_add_plugin( "nowplaying"
	DISPLAY_NAME "NowPlaying"
	DESCRIPTION "Now playing plugin"
	SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}
	QT_LIBRARIES DBUS
	INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/include
)
