CTR_NAME=git-scheetz

running=$(docker container ls | grep -c $CTR_NAME)
if [[ "$running" -eq 1 ]]; then
  docker attach -it $CTR_NAME
  exit 0
fi
stopped=$(docker container ls -a | grep -c $CTR_NAME)
if [[ "$stopped" -eq 1 ]]; then
  docker start -i $CTR_NAME
  exit 0
fi

docker run -it -e https_proxy -e http_proxy -e no_proxy -v /home/scheetz/.ssh/id_rsa_git_scheetz:/root/.ssh/id_rsa -v /home/scheetz/workspace:/home/scheetz/workspace --workdir /home/scheetz/workspace --entrypoint bash --name $CTR_NAME scheetz/devenv:master

