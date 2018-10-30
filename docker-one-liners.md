# Docker one-liners commands

show disk usage (run on your local)  
`for i in $(cat list-of-docker-hosts.txt); do echo "Host IP: ${i}"; ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o ConnectTimeout=5 -q ${i} df -TH | grep data; echo; done ;`

mass clean space (run on your local)  
`for i in $(cat list-of-docker-hosts.txt); do echo "Host IP: ${i}"; ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o ConnectTimeout=5 -q ${i} sudo docker system prune -f; echo; done ;`

map disk usage to docker container (run on k8s-agent, update path to your overlay)  
`for i in $(docker ps -q); do echo "$(docker ps | grep "${i}" | awk '{print $1,$2}')"; dockerFS=$(docker inspect ${i} | jq -r '.[].GraphDriver.Data | "\(.LowerDir)\n\(.MergedDir)"' | awk -F'/' '{print $6}'); for x in ${dockerFS[@]}; do du -sh /var/lib/docker/overlay/${x}*; done; echo; done;`

show the processes running in your container  
`docker top CONTAINER_ID | sed -n '1!p' | sed 's/ \+/ /g'`  

show the logs for your container  
`docker logs -f CONTAINER_ID --tail 100`  

show mem/cpu of your container  
`docker stats --no-stream=true $(docker ps -q) | sed -n '1!p' | sed 's/ \+/,/g' | awk -F',' '{print $1","$2","$3","$7}'`  

force to be root  
`docker exec -u root -it dockerid /bin/bash`

log in with default user  
`docker exec -it dockerid /bin/bash`
