FROM comics/centos:latest
MAINTAINER Ian Merrick <MerrickI@Cardiff.ac.uk>

##############################################################
# Software:             gcc
# Software Version:     8.2.0
# Software Website:     -
# Description:          
##############################################################

RUN yum install -y gmp-devel mpfr-devel libmpc-devel && \ 
    yum clean all && \
    rm -rf /var/cache/yum
WORKDIR /gcc 
RUN curl -L ftp://ftp.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-8.2.0/gcc-8.2.0.tar.gz | tar xzf - && \
    cd gcc-* && \
    ./configure --prefix=/usr/local/ --enable-languages=c,c++,fortran --disable-multilib && \
    make -j && \
    make install

ENTRYPOINT ["/usr/local/bin/user_entrypoint.sh"]

