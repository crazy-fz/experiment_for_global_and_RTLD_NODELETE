CXX = g++
CXXFLAGS = -std=c++98 -fPIC -shared -O3 -I. -L.
CFLAGS = -std=c++98 -fPIC -shared -O3 -I. -L.

src_files = a.cpp b.cpp
bin_files = $(BIN_BASE) $(BIN_A_PB) $(BIN_B_PB) $(BIN_A) $(BIN_B) $(EXEC_MAIN)
obj_files = $(OBJ_A_PB) $(OBJ_B_PB) $(OBJ_A) $(OBJ_B)

BIN_BASE = libbase.so
BIN_A = a.so
BIN_B = b.so
EXEC_MAIN = main.out

OBJ_BASE = base.o
OBJ_A_PB = a_pb.o
OBJ_B_PB = b_pb.o
OBJ_A = a.o
OBJ_B = b.o

CPP_BASE = base.cpp
CPP_A_PB = a_pb.cpp
CPP_B_PB = b_pb.cpp
CPP_A = a.cpp
CPP_B = b.cpp

all: $(bin_files)
	rm -f $(obj_files)

$(BIN_BASE):$(OBJ_BASE)
	$(CXX) $(CFLAGS) -o $@ $^

$(BIN_A):$(OBJ_A) $(OBJ_A_PB) $(BIN_BASE)
	$(CXX) $(CFLAGS) -o $@ $(OBJ_A) $(OBJ_A_PB) $(BIN_BASE) -lbase

$(BIN_B):$(OBJ_B) $(OBJ_A_PB) $(BIN_BASE)
	$(CXX) $(CFLAGS) -o $@ $(OBJ_B) $(OBJ_A_PB) $(BIN_BASE) -lbase

$(EXEC_MAIN):main.cpp
	$(CXX) -std=c++98 -O3 -o $@ $^ -ldl -lstdc++ -L./

clean:
	rm -f $(obj_files)
	rm -f $(bin_files)