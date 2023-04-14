#include "a_pb.h"
void a_pb_print(){
	printf("a_pb_print: 0x%llx, %s\n", &base::_.assigned_by, base::_.assigned_by.c_str());
}
void a_pb_assign() {
	base::_.assigned_by = "a_pb";
}