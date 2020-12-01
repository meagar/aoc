
.PHONY: all
all: day1go day1cpp day1c

day1go: day1.go
	go build -o day1go day1.go

day1cpp: day1.cpp
	g++ day1.cpp -O3 -std=c++11 -o day1cpp

day1c: day1.c
	gcc day1.c -O3 -o day1c

benchmark: all
	../benchmark.rb "Go:./day1go" "ruby:Ruby day1.rb" "C++:./day1cpp" "C:./day1c"