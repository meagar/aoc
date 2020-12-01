
.PHONY: all
all: day1go day1cpp day1c day1rust

day1go: day1.go
	go build -o day1go day1.go

day1cpp: day1.cpp
	g++ day1.cpp -O3 -std=c++11 -o day1cpp

day1c: day1.c
	gcc day1.c -O3 -o day1c

day1rust: day1.rs
	rustc day1.rs -O -o day1rust

benchmark: all
	../benchmark.rb "Go:./day1go" "Ruby:Ruby day1.rb" "C++:./day1cpp" "C:./day1c" "Node:node day1.js" "Rust:./day1rust" "Python:python3 day1.py"
