CXX = g++
CFLAGS = -std=c++98 -fPIC -shared -O3 -I. -L.

src_files = a.cpp b.cpp
bin_files = $(BIN_BASE) $(BIN_A_PB) $(BIN_B_PB) $(BIN_A) $(BIN_B) $(EXEC_MAIN)

BIN_BASE = libbase.so
BIN_A_PB = liba.pb.so
BIN_B_PB = libb.pb.so
BIN_A = a.so
BIN_B = b.so
EXEC_MAIN = main.out

CPP_BASE = base.cpp
CPP_A_PB = a_pb.cpp
CPP_B_PB = b_pb.cpp
CPP_A = a.cpp
CPP_B = b.cpp

all: $(bin_files)

$(BIN_BASE):$(CPP_BASE)
	$(CXX) $(CFLAGS) -o $@ $^

$(BIN_A_PB):$(CPP_A_PB) $(BIN_BASE)
	$(CXX) $(CFLAGS) -o $(BIN_A_PB) $(CPP_A_PB) -lbase

$(BIN_B_PB):$(CPP_B_PB) $(BIN_BASE)
	$(CXX) $(CFLAGS) -o $(BIN_B_PB) $(CPP_B_PB) -lbase

$(BIN_A):$(CPP_A) $(BIN_A_PB)
	$(CXX) $(CFLAGS) -o $(BIN_A) $(CPP_A) -la.pb

$(BIN_B):$(CPP_B) $(BIN_B_PB)
	$(CXX) $(CFLAGS) -o $(BIN_B) $(CPP_B) -lb.pb


$(EXEC_MAIN):main.cpp
	$(CXX) -std=c++98 -O3 -o $@ $^ -ldl -lstdc++ -L./

clean:
	rm -f $(bin_files)