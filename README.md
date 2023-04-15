在master分支基础上，将a_pb和a.cpp编译成一个so，实验结果相同。

一次简单的实验，验证以RTLD_NODELETE方式dlopen动态库a和b，如果a和b都间接依赖动态库base，那么a和b访问的的base中的全局变量是否同一份。

make clean && make
./run_main.sh

实验结果是，无论是否RTLD_NODELETE，访问的全局变量都是同一份。
在RTLD_NODELETE下，全局变量无论是否static，只会析构/构造一次。否则每次dlopen时构造，dlclose时析构。

可以尝试去掉RTLD_NODELETE，会导致对象在一个地址上反复构造/析构，在实际项目中产生bug。