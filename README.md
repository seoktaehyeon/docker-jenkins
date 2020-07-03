#### docker-compose
```bash
cd /workspace
docker-compose -f compose.yaml up -d
```

#### compose.yaml
```yaml
version: '2'
services:
  jenkins:
    container_name: jenkins
    image: bxwill/jenkins:blueocean
    restart: always
    user: root
    ports:
      - 8080:8080
      - 50000:50000
    volumes:
      - ./jenkins_home:/var/jenkins_home
      - /var/run/docker.sock:/var/run/docker.sock
```
