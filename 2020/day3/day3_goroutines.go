package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	lines := readInput()

	inputs := [][]int{
		{1, 1},
		{3, 1},
		{5, 1},
		{7, 1},
		{1, 2},
	}

	results := make(chan int)
	for _, input := range inputs {
		go func(dx, dy int, results chan int) {
			x := 0
			trees := 0
			for i, line := range lines {
				if i%dy != 0 {
					continue
				}
				if line[x] == '#' {
					trees++
				}
				x += dx
				if x >= len(line) {
					x -= len(line)
				}
			}
			results <- trees
		}(input[0], input[1], results)
	}

	total := 1
	for range inputs {
		total *= <-results
	}
	fmt.Println(total)
}

func readInput() []string {
	file, _ := os.Open("input.txt")
	defer file.Close()

	scanner := bufio.NewScanner(file)
	var output []string
	for scanner.Scan() {
		output = append(output, scanner.Text())
	}

	return output
}
