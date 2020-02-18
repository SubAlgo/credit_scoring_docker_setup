#1. Create disk for store Postgres data
$ gcloud compute disks create credit-scoring-postgres-disk --size=20GB --type=pd-standard

#2. Create an instance for format disk
$ gcloud compute instances create instance-1 --machine-type f1-micro

#3. Attach disk into instance
$ gcloud compute instances attach-disk instance-1 --disk credit-scoring-postgres-disk

#4. SSH into the instance
$ gcloud compute ssh instance-1

#5. List disks
$ lsblk

#6. Format disk
$ sudo mkfs.ext4 -m 0 -F -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/sdb

#7. Exit from vm
$ exit

#8. Delete the instance
$ gcloud compute instances delete instance-1

#9. Create PostgreSQL container instance
$ gcloud beta compute instances create-with-container credit-scoring-postgres \
  --machine-type f1-micro \
  --container-image postgres:11.4 \
  --container-mount-host-path mount-path=/var/lib/postgresql/data,host-path=/mnt/disks/data/data,mode=rw \
  --metadata ^:^startup-script="mkdir -p /mnt/disks/data && mount -o discard,defaults /dev/sdb /mnt/disks/data" \
  --disk "name=credit-scoring-postgres-disk,device-name=credit-scoring-postgres-disk,mode=rw,boot=no" \
  --tags allow-postgres

#10. Verify disk inside PostgreSQL instance
$ gcloud compute ssh credit-scoring-postgres

$ lsblk

$ sudo ls /mnt/disks/data/data


#11. Setup Firewall
$ gcloud compute firewall-rules create allow-postgres \
  --allow tcp:5432 --target-tags allow-postgres

#12. Upgrade PostgreSQL to new version
$ gloud beta compute instances update-container credit-scoring-postgres \
  --container-image=postgres:11.4