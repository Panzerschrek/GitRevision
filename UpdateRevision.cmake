execute_process(
	COMMAND git rev-parse HEAD
	OUTPUT_VARIABLE GIT_CURRENT_COMMIT_HASH
	OUTPUT_STRIP_TRAILING_WHITESPACE
	)

set(
	HEADER_CONTENT
	"static const char c_git_revision[]=\"${GIT_CURRENT_COMMIT_HASH}\"\;" )

file(
	WRITE
	${CMAKE_CURRENT_BINARY_DIR}/revision.hpp
	${HEADER_CONTENT}
	)
