# Use the Debian base image
FROM debian:buster-slim

# Maintainer information
LABEL maintainer="David Al-hakeem <davidks10@gmail.com>"

# Disable interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list, install required packages, and add Plex repository
RUN apt-get update && \
    apt-get install -y \
        apt-transport-https \
        curl \
        gnupg && \
    curl https://downloads.plex.tv/plex-keys/PlexSign.key | apt-key add - && \
    echo "deb https://downloads.plex.tv/repo/deb/ public main" > /etc/apt/sources.list.d/plexmediaserver.list && \
    apt-get update && \
    apt-get install -y plexmediaserver && \
    rm -rf /var/lib/apt/lists/*

# Expose Plex Media Server ports
EXPOSE 32400/tcp

# Start Plex Media Server
CMD ["/usr/lib/plexmediaserver/Plex Media Server"]
