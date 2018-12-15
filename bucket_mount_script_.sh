
sudo apt-get install git -y


git clone https://github.com/satishrawat/service-account-swarm.git
mkdir /root/credentials
cp service-account-swarm/*.json /root/credentials/
###install gcsfuse  ###
#Install gcsfuse to mount the storage bucket in instances .
export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

sudo apt-get update
sudo apt-get install gcsfuse


#make mount directory##
mkdir /data

##For Mont using Key path ###
gcsfuse -o allow_other --gid 0 --uid 0 --file-mode 777 --dir-mode 777 --key-file /root/credentials/devops-224605-ba55be798e7b.json  devops-swarm-bucket /data

#Fstab Entry##
echo "devops-swarm-bucket /data gcsfuse rw,allow_other,uid=0,gid=0,file_mode=0777,dir_mode=0777,key_file=/root/credentials/devops-224605-ba55be798e7b.json" >> /etc/fstab

echo " Hello You  have Successfully Mountes the storage bucket in your Computer #Satish Kumar EMail : satishrawat92@gmail.com"
