# plexconnect-synology

(this is not yet working)

1. Install Docker in Synology
2. Enable SSH and SSH into Synology nas
3. Create docker/plexconnect folder on NAS
  ```shell
  cd /volume1/docker
  mkdir plexconnect
  cd plexconnect
  ```
4.  Using filestation, upload files from this repo
  - Dockerfile
  - docker-compose.yml
  - entrypoint.sh
  - init.sh
5. Run init.sh
  ```shell
  ./init.sh
  ```
