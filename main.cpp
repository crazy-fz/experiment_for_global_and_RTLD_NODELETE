#include <bits/stdc++.h>
#include <dlfcn.h>
void run(const char* file) {
	void (*so_func)() = NULL;
	char* error = NULL;
	void* handle = dlopen(file, RTLD_LAZY | RTLD_NODELETE);
	if (!handle) {
		fprintf(stderr, "%s\n", dlerror());
		return;
	}
	dlerror();
	*(void**)(&so_func) = dlsym(handle, "run_func");
	if ((error = dlerror()) != NULL) {
		fprintf(stderr, "%s\n", error);
		return;
	}
	(*so_func)();
	dlclose(handle);
}
int main() {
	std::cout << "enter main\n";
	run("a.so");
	run("b.so");
	run("a.so");
	return 0;
}