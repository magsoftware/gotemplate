package greet

import "testing"

func TestHello(t *testing.T) {
	expected := "Hello Artur!"
	s := Hello("Artur")
	if expected != s {
		t.Errorf("TestHello: expected '%s' request, got >%s<", expected, s)
	}
}
