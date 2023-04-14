#include "b_pb.h"
void b_pb_print() {
	printf("b_pb_print: 0x%llx, %s\n", &base::_.assigned_by, base::_.assigned_by.c_str());
}
void b_pb_assign() {
	base::_.assigned_by = "b_pb";
}