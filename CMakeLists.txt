cmake_minimum_required(VERSION 3.5)
project(GitRevision)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED On)

# Custom target builds each time, but it changes file with revision only if needed.
add_custom_target(
	GenRevisionHeader
	COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_SOURCE_DIR}/UpdateRevision.cmake
	WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
	)

include_directories(${CMAKE_CURRENT_BINARY_DIR})

# Executable depends on generated file.
add_executable(GitRevision main.cpp)
add_dependencies(GitRevision GenRevisionHeader)
