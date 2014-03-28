FROM crosbymichael/build-essential

RUN apt-get install -y \
    protobuf-* \
    libgflags-dev \
    libprotobuf-dev

ADD https://re2.googlecode.com/files/re2-20140304.tgz /
RUN tar -zxf re2-20140304.tgz && cd /re2 && make && make install

ADD . /lmctfy
WORKDIR /lmctfy
RUN make liblmctfy.a lmctfy-nsinit lmctfy-nscon lmctfy 
