cmake_minimum_required(VERSION 2.8.4)
project(picoc)

# include_directories(${PROJECT_SOURCE_DIR}/include)

file(GLOB PICOC_FILES 
	${PROJECT_SOURCE_DIR}/*.h
	${PROJECT_SOURCE_DIR}/*.c
	${PROJECT_SOURCE_DIR}/cstdlib/*.h
	${PROJECT_SOURCE_DIR}/cstdlib/*.c)

	if (UNIX)
		add_definitions("-DUNIX_HOST")
		list (APPEND PICOC_FILES ${PROJECT_SOURCE_DIR}/platform/library_unix.c)
		list (APPEND PICOC_FILES ${PROJECT_SOURCE_DIR}/platform/platform_unix.c)
		
	endif()

add_library(picoc ${PICOC_FILES})

# set_target_properties(uriparser PROPERTIES PREFIX "")
