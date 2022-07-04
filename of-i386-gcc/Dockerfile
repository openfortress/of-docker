FROM jimbly/steamrt-i386-gcc

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

ADD https://github.com/Kitware/CMake/releases/download/v3.23.2/cmake-3.23.2.tar.gz /tmp
WORKDIR /tmp
RUN tar -xvzf cmake-3.23.2.tar.gz
WORKDIR /tmp/cmake-3.23.2
RUN ./bootstrap
RUN make -j 4
RUN make install
WORKDIR /
RUN rm -rf /tmp/cmake-2.23.2

RUN ln -s /usr/lib/i386-linux-gnu/libstdc++.so.6 /usr/lib/libstdc++.so

#we may have to download and compile gcc at this point but I didnt realize that gcc 9 is already installed
#WORKDIR /tmp
#RUN git clone --depth 1 -b releases/gcc-10 git://gcc.gnu.org/git/gcc.git
#WORKDIR /tmp/gcc
#RUN ./configure
#used to use bootstrap-lean until having issues
#RUN make BOOT_CFLAGS='-O' bootstrap
#RUN make install
#WORKDIR /
#RUN rm -rf /tmp/gcc