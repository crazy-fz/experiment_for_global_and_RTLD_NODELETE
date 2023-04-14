#ifndef BASE_H
#define BASE_H
#include <bits/stdc++.h>

class base {
public:
	base() {
		assigned_by = "none";
		printf("base()\n");
	}
	~base() { printf("~base()\n"); }
	static struct base _;
	std::string assigned_by;
};


#endif