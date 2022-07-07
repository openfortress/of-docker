FROM jimbly/steamrt-i386-gcc

ARG GROUP_ID
ARG USER_ID

#fix sources list
RUN rm -rf /etc/apt/sources.list
RUN printf 'deb http://old-releases.ubuntu.com/ubuntu/ precise main\n \
deb-src http://old-releases.ubuntu.com/ubuntu precise main \n \
deb http://old-releases.ubuntu.com/ubuntu precise universe \n \
deb-src http://old-releases.ubuntu.com/ubuntu precise universe\n' > /etc/apt/sources.list

#RUN ln -s /usr/include/asm-generic /usr/include/asm

#RUN groupdel jimb
RUN userdel -f jimb

RUN addgroup --gid $GROUP_ID of
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID of

USER of