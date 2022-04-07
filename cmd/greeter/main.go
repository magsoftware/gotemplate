package main

import (
	"fmt"

	"github.com/magsoftware/gotemplate/pkg/greet"
)

func main() {
	s := greet.Hello("Marek")
	fmt.Println(s)
}
