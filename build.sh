podmancdp=$(buildah from registry.centos.org/centos/centos:latest)
CONTAINER_FS=$(buildah mount $podmancdp)
buildah run $podmancdp yum update -y && \
buildah run $podmancdp yum  install  sudo git udisks2 openssh-server openssh-clients -y && \


buildah config  --cmd /bin/bash ${podmancdp}  && \

buildah config --port 7180 ${podmancdp}  && \

buildah run $podmancdp -- sh -c "git clone https://github.com/marcredhat/CDPDCTrial/; \
cd CDPDCTrial; \
chmod +x ./centosvmCDP.sh; \
./centosvmCDP.sh"


#sudo buildah containers
#CONTAINER ID  BUILDER  IMAGE ID     IMAGE NAME                       CONTAINER NAME
#5c56f4355610     *     f142359e2130 registry.centos.org/centos/centos:latest centos-working-container
#ed92c18b5b99     *     f142359e2130 registry.centos.org/centos/centos:latest centos-working-container-1
#sudo podman  login -u="<quay.io user>" -p="<quay.io encrypted password>" quay.io
#sudo buildah commit centos-working-container-1 marccdp"
#sudo  podman push localhost/marccdp  quay.io/marcf5/marccdp

#sudo podman run --systemd=true --privileged  -it --name marccdp localhost/marccdp:latest /sbin/init

#sudo podman ps -a 
#sudo podman exec -it marccdp /bin/bash

#systemctl start cloudera-scm-server

#[root@6de36c33185f /]# find / -name create_cluster.py
#/CDPDCTrial/scripts/create_cluster.py



#su - postgres -c "/usr/pgsql-9.6/bin/initdb --locale en_US.UTF-8 -D '/var/lib/postgres/data'"
#su - postgres -c "/usr/pgsql-9.6/bin/pg_ctl -D /var/lib/postgres/data -l logfile start"

#sudo podman exec -it marccdp /bin/bash

#ss -anpt | grep java | grep LISTEN
#LISTEN     0      50           *:7180                     *:*                   users:(("java",pid=14718,fd=400))
#LISTEN     0      50           *:7182                     *:*                   users:(("java",pid=14718,fd=392))

#systemctl status cloudera-scm-agent
#systemctl status cloudera-scm-server 
#curl -u "admin:admin"  http://127.0.0.1:7180/api/version
#v41
# tail -f /var/log/cloudera-scm-server/cloudera-scm-server.log
