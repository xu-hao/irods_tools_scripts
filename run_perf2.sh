
python geninp_imkdir.py $2

for i in `seq 1 $1`;
do
    bash retartcockroach.sh
    sleep 10
    bash install.sh
    sleep 10
    /usr/bin/time -f "%e" -ao perf_imkdir_$2.log bash input_imkdir.sh
    sleep 10
done
