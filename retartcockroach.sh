killall -9 cockroach
rm -rf cockroach-data/ node2/ node3/
cockroach start --insecure --host=localhost &> node1.log &
sleep 10
cockroach start --insecure \
               --store=node2 \
               --host=localhost \
               --port=26258 \
               --http-port=8081 \
               --join=localhost:26257 &> node2.log &
cockroach start --insecure \
               --store=node3 \
               --host=localhost \
               --port=26259 \
               --http-port=8082 \
               --join=localhost:26257 &> node3.log &
