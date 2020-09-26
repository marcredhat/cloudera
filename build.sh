cdpcontainermarc=$(buildah from registry.centos.org/centos/centos:latest)
#export CONTAINER_FS=$(buildah mount)
buildah run $cdpcontainermarc yum update -y && \
buildah run $cdpcontainermarc yum  install git udisks2 -y && \
buildah run $cdpcontainermarc git clone https://github.com/carrossoni/CDPDCTrial/

buildah config --cmd /bin/bash ${cdpcontainermarc} && \

buildah run $cdpcontainermarc -- sh -c "git clone https://github.com/marcredhat/CDPDCTrial/" && \

buildah run $cdpcontainermarc -- sh -c "chmod +x ./CDPDCTrial/centosvmCDP.sh" && \

buildah run $cdpcontainermarc -- sh -c "./CDPDCTrial/centosvmCDP.sh"
