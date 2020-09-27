sudo podman stop --all
sudo podman rmi --all
sudo podman rmi -f $(sudo podman images -a -q)
sudo buildah rm -a
