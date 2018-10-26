#Usage to build

Navigate to dockerfile directory

1. Build your docker image - example
```
docker build -t katturaja/docker-node-dynatrace-example .
```

2. Run your docker image - example
```
docker run -d --name katturaja/docker-node-dynatrace-example -p 3000:3000/tcp -it example
```

3. Debug your docker image - example
```
docker exec -it katturaja/docker-node-dynatrace-example /bin/bash
```

4. 3rd step following to Navigate to dynatrace log directory
```
cd $DT_HOME/log/nodejs/
```

