docker build -t ubuntu_iconf_23 -f ./Dockerfile.iconf .
docker run -it --rm -u root -p 3001:3001 -v ~/.ssh:/home/tommy/conf ubuntu_iconf_23 /bin/zsh
