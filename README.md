I made this project just for fun. Please feel free to make any modifications you see fit. The information required to run this is listed below. 

Below is the repo on https://hub.docker.com/r/davidks10/plexms

# Running Plex Media Server in Docker

### Using Docker CLI

#### Run the Container

```bash
docker run -d \
  --name my-plex-server \
  --network host \
  -e TZ=America/Chicago \
  -e PLEX_CLAIM=claim-claim code \
  -v /path/to/plex/config:/config \
  -v /path/to/media:/media \
  my-plex-server

```

---

### Using Docker Compose

#### Create a `docker-compose.yml` File

```yaml
version: '3'
services:
  plex:
    image: plexkrim
    container_name: my-plex-server
    ports:
      - "32400:32400/tcp"
    network_mode: "host"
    environment:
      - TZ=America/Chicago
      - PLEX_CLAIM=claim-ys35yruRSVSqzBCxn7r-
    volumes:
      - /path/to/plex/config:/config
      - /path/to/media:/media
```

#### Start the Plex Container

```bash
docker-compose up -d
```

---

**Note**: Replace `/path/to/plex/config` and `/path/to/media` with the actual paths on your host machine where you want to store Plex configuration files and media files, respectively.

The Plex container will have the same network access by utilizing the host network as if it were running directly on the host. Applications that identify devices on your local network, like Plex, may find this beneficial. You should be able to access the Plex Media Server web interface by going to "http://your-server-ip>:32400/web" after entering these commands.
