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

RUN rm /usr/bin/gcc
RUN rm /usr/bin/g++

RUN ln -s /usr/bin/gcc-9 /usr/bin/gcc
RUN ln -s /usr/bin/g++-9 /usr/bin/g++

RUN apt-get update && apt-get install --force-yes -y --no-install-recommends \
    libstdc++6-4.6-dbg \
    libstdc++6-4.6-dev
#    libmpfr-dev \
#    libmpc-dev \
#    flex

RUN ln -s /usr/lib/i386-linux-gnu/libstdc++.so.6 /usr/lib/libstdc++.so

RUN userdel -f jimb

RUN addgroup --gid $GROUP_ID of
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID of

RUN mkdir /ofd
RUN chown of /ofd

USER of