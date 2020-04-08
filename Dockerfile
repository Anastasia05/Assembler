FROM amazonlinux
WORKDIR /usr/assembler/
COPY ./assembler.s .
COPY ./c.c .
RUN yum install -y gcc
RUN yum install -y nano
RUN yum install -y gdb
RUN gcc assembler.s c.c -no-pie -o nastya -g
ENTRYPOINT /bin/bash