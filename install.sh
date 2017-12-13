sudo apt purge -y irods-server irods-database-plugin-cockroachdb irods-icommands irods-dev irods-runtime irods-api-plugin-bulkreg
sudo rm -rf /var/lib/irods /etc/irods
sudo rm /dev/shm/irods_re_cache_*
cockroach sql --insecure -e 'drop database "ICAT" cascade'
cockroach sql --insecure -e 'create database "ICAT"'
cockroach sql --insecure -e 'grant all on database "ICAT" to irods'
sudo dpkg -i temporary-irods-mod/build/irods-runtime_4.2.2~xenial_amd64.deb temporary-irods-mod/build/irods-dev_4.2.2~xenial_amd64.deb
sudo dpkg -i irods_cockroach_common/build/irods-database-plugin-cockroachdb-common_4.2.2~xenial_amd64.deb
sudo dpkg -i irods_client_icommands/build/irods-icommands_4.2.2~xenial_amd64.deb 
sudo dpkg -i temporary-irods-mod/build/irods-server_4.2.2~xenial_amd64.deb
sudo dpkg -i irods_cockroachdb/build/irods-database-plugin-cockroachdb_4.2.2~xenial_amd64.deb
sudo dpkg -i irods_api_plugin_bulkreg/build/irods-api-plugin-bulkreg_4.2.2~xenial_amd64.deb
sudo python /var/lib/irods/scripts/setup_irods.py < /var/lib/irods/packaging/localhost_setup_cockroachdb.input
