FROM jimbly/steamrt-i386-gcc

#fix sources list
RUN rm -rf /etc/apt/sources.list
RUN printf 'deb http://old-releases.ubuntu.com/ubuntu/ precise main\n \
deb-src http://old-releases.ubuntu.com/ubuntu precise main \n \
deb http://old-releases.ubuntu.com/ubuntu precise universe \n \
deb-src http://old-releases.ubuntu.com/ubuntu precise universe\n' > /etc/apt/sources.list

RUN apt-get update && apt-get install --force-yes -y --no-install-recommends \
    git