cmake_minimum_required(VERSION 3.5)
project(GitRevision)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED On)

message("CURRENT REVISIION: ${GIT_CURRENT_COMMIT_HASH}")

add_custom_command(
	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/revision.hpp
	DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/UpdateRevision.cmake
	COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_SOURCE_DIR}/UpdateRevision.cmake
	WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
	)

include_directories(${CMAKE_CURRENT_BINARY_DIR})

add_executable(GitRevision main.cpp revision.hpp)
