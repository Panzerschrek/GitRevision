execute_process(
	COMMAND git rev-parse HEAD
	OUTPUT_VARIABLE GIT_CURRENT_COMMIT_HASH
	OUTPUT_STRIP_TRAILING_WHITESPACE
	)

set(
	HEADER_CONTENT
	"\"${GIT_CURRENT_COMMIT_HASH}\"" )

set(FILE_PATH ${CMAKE_CURRENT_BINARY_DIR}/revision.hpp)

# Revrite header file only if it's content different, than current content.
# This neads, because we whant to rebuild dependent files only if revision changed.
if(EXISTS ${FILE_PATH})
	file(
		READ
		${FILE_PATH}
		FILE_CONTENT_PREV
		)
endif()

if(NOT HEADER_CONTENT STREQUAL FILE_CONTENT_PREV)
	file(
		WRITE
		${FILE_PATH}
		${HEADER_CONTENT}
		)
	message( "Update git revison header: ${GIT_CURRENT_COMMIT_HASH}")
endif()
