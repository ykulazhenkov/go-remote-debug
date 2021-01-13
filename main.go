package main

import (
	"fmt"
	"os"
	"os/signal"
	"syscall"
	"time"
)

func main() {
	sigs := make(chan os.Signal, 1)
	signal.Notify(sigs, os.Interrupt, syscall.SIGTERM)

	for {
		select {
		case <-time.Tick(time.Second):
			tick := "tick!"
			fmt.Println(tick)
		case <-sigs:
			fmt.Println("stop")
			os.Exit(0)
		}
	}
}
