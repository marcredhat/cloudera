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
