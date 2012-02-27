FIND_PACKAGE (QCA2)

if( NOT QCA2_FOUND )
	message( "Qca2 not found. Can't build AES Crypto module" )
	return()
endif( NOT QCA2_FOUND )

qutim_add_plugin( aescrypto
	QT_LIBRARIES NETWORK
	LINK_LIBRARIES ${QCA2_LIBRARIES}
	INCLUDE_DIRS ${QCA2_INCLUDE_DIR}
	DISPLAY_NAME "AES crypto service loader"
	DESCRIPTION "Default qutIM crypto implementation. Based on algorithm aes256"
)
