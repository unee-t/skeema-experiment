#!/bin/bash

bugzilla() {
	case $1 in
		prod) echo auroradb.unee-t.com
		;;
		*) echo auroradb.$1.unee-t.com
		;;
	esac
}


for stage in {dev}
do
	skeema init bugzilla-$stage -h $(bugzilla $stage) -u root --password=$(ssm uneet-$stage MYSQL_ROOT_PASSWORD) -d bugzilla
	skeema init unte-$stage -h $(ssm uneet-$stage UNTEDB_HOST) -u $(ssm uneet-$stage UNTEDB_ROOT_USER) --password=$(ssm uneet-$stage UNTEDB_ROOT_PASS) -d unte
done

for stage in {dev,demo,prod}
do
	cd bugzilla && 
	skeema add-environment bugzilla-$stage -h $(bugzilla $stage) -u root --password=$(ssm uneet-$stage MYSQL_ROOT_PASSWORD)
	cd unte && 
	skeema add-environment unte-$stage -h $(ssm uneet-$stage UNTEDB_HOST) -u $(ssm uneet-$stage UNTEDB_ROOT_USER) --password=$(ssm uneet-$stage UNTEDB_ROOT_PASS)
done
