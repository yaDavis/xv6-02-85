FROM ubuntu:16.04

# add from local directory
# ADD ./xv6-11 /xv6-11 # --no-install-recommends --reinstall ca-certificates
RUN apt-get -qq update && \
    apt-get install -y \
                    git \ 
                    make \ 
                    gcc-multilib \
                    qemu-system \ 
    &&git clone https://github.com/mit-pdos/xv6-public.git  xv6-02-85 \
    &&chmod +x xv6-02-85/*.pl \
    &&apt-get purge -qq git \
    &&apt-get autoremove --purge -qq \
    &&apt-get clean -qq &&rm -rf /var/lib/apt/lists/* \
    &&rm -rf /tmp/* /var/tmp/* \
    &&rm -rf /usr/share/man/* /usr/share/doc/*

WORKDIR /xv6-02-85
#WORKDIR /xv6-11

CMD ["/bin/bash"]

