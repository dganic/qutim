find_package( ASPELL )
if( NOT ASPELL_FOUND )
	message( "ASPELL not found. Can't build aspeller" )
	return()
endif( NOT ASPELL_FOUND )

qutim_add_plugin( aspeller
	DISPLAY_NAME "ASpell checker"
	DESCRIPTION "Check spelling by ASpell library"
	LINK_LIBRARIES ${ASPELL_LIBRARIES}
	INCLUDE_DIRS ${ASPELL_INCLUDE_DIR}
)
