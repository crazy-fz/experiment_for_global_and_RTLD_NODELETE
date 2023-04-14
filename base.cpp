#include "base.h"
struct base base::_;

class non_static {
public:
	non_static() { printf("0x%llx, non_static()\n", this); }
	~non_static() { printf("0x%llx, ~non_static()\n", this); }
};
non_static n;