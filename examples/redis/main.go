package main

import (
	"context"
	"fmt"
	"strings"
	"time"

	ext "github.com/reugn/go-streams/redis"
	"github.com/reugn/go-streams/util"

	"github.com/go-redis/redis"
	"github.com/reugn/go-streams/flow"
)

//docker exec -it pubsub bash
//https://redis.io/topics/pubsub

var toUpper = func(in interface{}) interface{} {
	msg := in.(*redis.Message)
	fmt.Println("msg:", msg)
	return strings.ToUpper(msg.Payload)
}

//Process:  sub chanin -> ToUpper -> pub chanout
func testSubpub(ctx *context.Context) {
	config := &redis.Options{
		Addr:     "localhost:6379", // use default Addr
		Password: "123456",         // no password set
		DB:       0,                // use default DB
	}

	//source
	source, err := ext.NewRedisSource((*ctx), config, "chanin")

	util.Check(err)

	//flow
	flow1 := flow.NewMap(toUpper, 1)

	//sink
	sink := ext.NewRedisSink(config, "chanout")

	//via
	source.Via(flow1).To(sink)
}

func main() {
	ctx, cancelFunc := context.WithCancel(context.Background())

	//after 5 second, exit process
	timer := time.NewTimer(time.Minute * 5)
	go func() {
		select {
		case <-timer.C:
			fmt.Println("cancelFunc...")
			cancelFunc()
		}
	}()

	testSubpub(&ctx)
}
