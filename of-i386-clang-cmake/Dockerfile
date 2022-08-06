FROM jimbly/steamrt-i386-clang-3.6
#FROM jimbly/steamrt-i386-gcc

ARG GROUP_ID
ARG USER_ID 

#fix sources list
RUN rm -rf /etc/apt/sources.list
RUN printf 'deb http://old-releases.ubuntu.com/ubuntu/ precise main\n \
deb-src http://old-releases.ubuntu.com/ubuntu precise main \n \
deb http://old-releases.ubuntu.com/ubuntu precise universe \n \
deb-src http://old-releases.ubuntu.com/ubuntu precise universe\n' > /etc/apt/sources.list

RUN update-alternatives --install /usr/bin/ld ld /usr/bin/ld-2.30 50
RUN update-alternatives --set ld /usr/bin/ld-2.30

#RUN ln -s /usr/include/asm-generic /usr/include/asm

#RUN rm /usr/bin/gcc
#RUN rm /usr/bin/cc
#RUN rm /usr/bin/g++

#RUN ln -s /usr/bin/gcc-9 /usr/bin/gcc
#RUN ln -s /usr/bin/gcc-9 /usr/bin/cc
#RUN ln -s /usr/lib/gcc-9/bin/gcc-9 /usr/lib/gcc-9/bin/cc
#RUN ln -s /usr/bin/g++-9 /usr/bin/g++

#RUN ln -s /usr/lib/i386-linux-gnu/libstdc++.so.6 /usr/lib/libstdc++.so

#RUN apt-get update && apt-get install --force-yes -y --no-install-recommends \
#    libstdc++6-4.6-dbg \
#    libstdc++6-4.6-dev \
#   unzip \
#    libmpfr-dev \
#    libmpc-dev \
#    flex \
#    gcc-multilib
RUN apt-get update && apt-get install --force-yes -y --no-install-recommends \
    unzip

ADD https://github.com/Kitware/CMake/releases/download/v3.23.2/cmake-3.23.2.tar.gz /tmp
WORKDIR /tmp
RUN tar -xvzf cmake-3.23.2.tar.gz
WORKDIR /tmp/cmake-3.23.2
RUN ./bootstrap --parallel=`nproc`
RUN make -j `nproc`
RUN make install

#we may have to download and compile gcc at this point but I didnt realize that gcc 9 is already installed
#ADD https://bigsearcher.com/mirrors/gcc/releases/gcc-10.4.0/gcc-10.4.0.tar.gz /tmp
#WORKDIR /tmp
#RUN tar -xvzf gcc-10.4.0.tar.gz
#RUN git clone --depth 1 -b releases/gcc-10 git://gcc.gnu.org/git/gcc.git
#RUN mkdir /tmp/gccobjdir
#WORKDIR /tmp/gccobjdir
#RUN /tmp/gcc-10.4.0/configure --disable-gnu-unique-object --build=x86_64-linux-gnu --prefix=/usr --program-suffix=-10.4
#used to use bootstrap-lean until having issues
#RUN make -j `nproc` BOOT_CFLAGS='-O' bootstrap
#RUN make install

WORKDIR /tmp
ADD https://github.com/Fenteale/caffeene/archive/refs/heads/main.zip /tmp
RUN unzip main.zip
WORKDIR /tmp/caffeene-main
RUN make
RUN make install

WORKDIR /
RUN rm -rf /tmp/cmake-3.23.2
RUN rm -rf /tmp/caffeene-main
#RUN rm -rf /tmp/gcc-10.4.0
#RUN rm -rf /tmp/gccobjdir

RUN userdel -f jimb

RUN addgroup --gid $GROUP_ID of
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID of
RUN usermod -aG sudo of

RUN echo "username  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/username
RUN chmod 440 /etc/sudoers.d/username

RUN mkdir /ofd
RUN chown of /ofd

USER of