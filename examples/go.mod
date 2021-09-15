module github.com/reugn/go-streams/examples

go 1.15

require (
	github.com/Shopify/sarama v1.29.1
	github.com/aerospike/aerospike-client-go v4.5.2+incompatible
	github.com/apache/pulsar-client-go v0.5.0
	github.com/go-redis/redis v6.15.9+incompatible
	github.com/gorilla/websocket v1.4.2
	github.com/nats-io/stan.go v0.9.0
	github.com/reugn/go-streams v0.6.3
	github.com/reugn/go-streams/aerospike v0.0.0
	github.com/reugn/go-streams/kafka v0.0.0
	github.com/reugn/go-streams/nats v0.0.0
	github.com/reugn/go-streams/pulsar v0.0.0
	github.com/reugn/go-streams/redis v0.0.0
	github.com/reugn/go-streams/ws v0.0.0
	github.com/yuin/goldmark v1.4.1 // indirect
	golang.org/x/mod v0.5.0 // indirect
	golang.org/x/net v0.0.0-20210913180222-943fd674d43e // indirect
	golang.org/x/sys v0.0.0-20210910150752-751e447fb3d0 // indirect
	golang.org/x/tools v0.1.5 // indirect
)

replace (
	github.com/reugn/go-streams/aerospike => ../aerospike
	github.com/reugn/go-streams/kafka => ../kafka
	github.com/reugn/go-streams/nats => ../nats
	github.com/reugn/go-streams/pulsar => ../pulsar
	github.com/reugn/go-streams/redis => ../redis
	github.com/reugn/go-streams/ws => ../ws
)
