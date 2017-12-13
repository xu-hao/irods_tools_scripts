
python geninp.py $2

for i in `seq 1 $1`;
do
    bash retartcockroach.sh
    sleep 10
    bash install.sh
    sleep 10
    /usr/bin/time -f "%e" -ao perf_parallel_$2.log ibulkreg inputlarge.json
    sleep 10
done

for i in `seq 1 $1`;
do
    bash retartcockroach.sh
    sleep 10
    bash install.sh
    sleep 10
    /usr/bin/time -f "%e" -ao perf_serial_$2.log ibulkreg inputlargeserial.json
    sleep 10
done
