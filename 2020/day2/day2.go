package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	passwords := readData()

	valid := 0

	for _, pw := range passwords {
		// part 1
		// count := 0
		// for _, char := range pw.Password {
		// 	if char == pw.Char {
		// 		count++
		// 	}
		// }
		// if count >= pw.Start && count <= pw.End {
		// 	valid++
		// }

		// part 2
		a := rune(pw.Password[pw.Start-1]) == pw.Char
		b := rune(pw.Password[pw.End-1]) == pw.Char

		if a != b {
			valid++
		}
	}

	fmt.Println(valid)
}

type password struct {
	Start    int
	End      int
	Char     rune
	Password string
}

func readData() []*password {
	file, _ := os.Open("input.txt")
	defer file.Close()

	var output []*password
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		pw := new(password)
		line := scanner.Text()                 // "3-6 q: qvqqqpzqd"
		parts := strings.Split(line, " ")      // ["3-6", "q:", "qvqqqpzqd"]
		minmax := strings.Split(parts[0], "-") // ["3", "6"]
		pw.Start, _ = strconv.Atoi(minmax[0])  // 3
		pw.End, _ = strconv.Atoi(minmax[1])    // 6
		pw.Char = rune(parts[1][0])            // "q"
		pw.Password = parts[2]                 // "qvqqqpzqd"

		// if line != fmt.Sprintf("%d-%d %c: %s", pw.Start, pw.End, pw.Char, pw.Password) {
		// 	log.Fatalf("parse failed:\n%s\n%#v", line, *pw)
		// }

		output = append(output, pw)
	}
	return output
}
