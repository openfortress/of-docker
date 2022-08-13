FROM fenteale/openfortress-i386-base

RUN apt-get update && apt-get install --force-yes -y --no-install-recommends \
  gcc-4.8 g++-4.8 gcc-9 g++9 \
  # clang-3.4:i386 lldb-3.4:i386 \
  # clang-3.6:i386 lldb-3.6:i386 \
  && if [ -d /usr/include/i386-linux-gnu/c++/4.8 ]; then \
    ln -s /usr/include/i386-linux-gnu/c++/4.8 /usr/include/c++/4.8/i686-linux-gnu; \
  fi && \
  update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 50 && \
  update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 50 && \
  update-alternatives --install /usr/bin/cpp cpp-bin /usr/bin/cpp-4.8 50 && \
  \
  update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 100 && \
  update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 100 && \
  update-alternatives --install /usr/bin/cpp cpp-bin /usr/bin/cpp-9 100 && \
  \
  # update-alternatives --install /usr/bin/gcc gcc /usr/bin/clang-3.4 50 && \
  # update-alternatives --install /usr/bin/g++ g++ /usr/bin/clang++-3.4 50 && \
  # \
  # update-alternatives --install /usr/bin/gcc gcc /usr/bin/clang-3.6 50 && \
  # update-alternatives --install /usr/bin/g++ g++ /usr/bin/clang++-3.6 50   && \
  \
  update-alternatives --set gcc /usr/bin/gcc-9 && \
  update-alternatives --set g++ /usr/bin/g++-9 && \
  update-alternatives --set cpp-bin /usr/bin/cpp-9

RUN apt-get update && apt-get install --force-yes -y --no-install-recommends \
    libstdc++6-4.6-dbg \
    libstdc++6-4.6-dev

RUN ln -s /usr/lib/i386-linux-gnu/libstdc++.so.6 /usr/lib/libstdc++.so