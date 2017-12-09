if( NOT TARGET Cinder-OpenCV3 )
  get_filename_component( OPENCV3_ROOT_PATH "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE )

  list( APPEND OPENCV3_SOURCES
	)

	add_library( Cinder-OpenCV3 ${OPENCV3_SOURCES} )

  list( APPEND OPENCV3_INCLUDE_DIRS
	${OPENCV3_ROOT_PATH}/include
	)
  
  target_include_directories( Cinder-OpenCV3 PUBLIC "${OPENCV3_INCLUDE_DIRS}" )

  if( NOT TARGET cinder )
	include( "${CINDER_PATH}/proj/cmake/configure.cmake" )
	find_package( cinder REQUIRED PATHS
	  "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
	  "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}" )
  endif()
  
	target_link_libraries( Cinder-OpenCV3 PRIVATE cinder )
  
endif()
