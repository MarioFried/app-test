#!/bin/bash

declare -a containers=($( docker ps --format "{{.Names}}" ))

existe=0

for i in ${containers[@]}
do
  if [ $i = "tel-aviv" ]
  then
     (( existe=1 ))
  fi
  echo $i
done
echo $existe

if [ $existe = 0 ]
then
   docker run -d --name tel-aviv                                            \
                 --mount source=nginx-vol,destination=/usr/share/nginx/html \
                 --mount source=nginx-etc-vol,destination=/etc/nginx        \
              -p 8080:80                                                    \
                 nginx
fi

sudo cp index.html /var/lib/docker/volumes/nginx-vol/_data/
