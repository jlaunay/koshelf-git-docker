## koshelf-git-docker

Unofficial Docker image for git version of [KoShelf](https://github.com/paviro/KoShelf).

---
### Edit Docker Compose

Edit the given compose file to fit your needs (HASHDOCSETTINGS etc.)

```yaml
services:
  koshelf:
    container_name: koshelf-git
    build: .
    ports:
      - "3000:3000"
    volumes:
      - $SYNCTHING_DIR/books:/books
      - $SYNCTHING_DIR/stats:/settings
      # - $SYNCTHING_DIR/hashdocsettings:/hashdocsettings # Optional
      # - $SYNCTHING_DIR/docsettings:/docsettings # Optional
    environment:
      TITLE: "My KoShelf library" # Optional
      # DOCSETTINGS: /docsettings # Optional
      # HASHDOCSETTINGS: /hashdocsettings # Optional
    restart: unless-stopped
```

Then pull, build and run

```sh
docker compose pull
docker compose up -d --build
```
```
```
