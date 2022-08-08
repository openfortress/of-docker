FROM jimbly/steamrt-i386-clang-3.6

ARG GROUP_ID
ARG USER_ID 

RUN rm -rf /etc/apt/sources.list
RUN printf 'deb http://old-releases.ubuntu.com/ubuntu/ precise main\n \
deb-src http://old-releases.ubuntu.com/ubuntu precise main \n \
deb http://old-releases.ubuntu.com/ubuntu precise universe \n \
deb-src http://old-releases.ubuntu.com/ubuntu precise universe\n' > /etc/apt/sources.list

RUN update-alternatives --install /usr/bin/ld ld /usr/bin/ld-2.30 50
RUN update-alternatives --set ld /usr/bin/ld-2.30

RUN ln -s /usr/lib/i386-linux-gnu/libstdc++.so.6 /usr/lib/libstdc++.so

RUN userdel -f jimb

RUN addgroup --gid $GROUP_ID of
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID of
RUN usermod -aG sudo of

RUN echo "username  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/username
RUN chmod 440 /etc/sudoers.d/username

RUN mkdir /ofd
RUN chown of /ofd

USER of