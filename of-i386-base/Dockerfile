FROM jimbly/steamrt-i386:latest

#fix sources list
RUN rm -rf /etc/apt/sources.list
RUN printf 'deb http://old-releases.ubuntu.com/ubuntu/ precise main\n \
deb-src http://old-releases.ubuntu.com/ubuntu precise main \n \
deb http://old-releases.ubuntu.com/ubuntu precise universe \n \
deb-src http://old-releases.ubuntu.com/ubuntu precise universe\n' > /etc/apt/sources.list

RUN userdel -f jimb