#include <iostream>

static const char c_git_revision[]=
#include "revision.hpp"
;

int main()
{
	std::cout << "Git revision: " << c_git_revision << std::endl;
}
