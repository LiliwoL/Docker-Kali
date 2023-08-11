# Kali Linux latest with useful tools by tsumarios
#FROM docker.io/kalilinux/kali-rolling

# Pour Mac ARM
FROM kalilinux/kali-rolling:arm64

# Let the container know there will be no TTY
ENV DEBIAN_FRONTEND=noninteractive

# Set working directory to /root
WORKDIR /root

# From the upstream docker image
RUN echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list && \
    echo "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list

# Get the latest everything
RUN apt-get -y update && \
    apt-get -y dist-upgrade

RUN apt -y install ca-certificates curl gnupg lsb-release

RUN apt -y autoremove && apt clean

# Install tools we want
RUN apt-get install -y \
    hydra \
    john \
    metasploit-framework \
    nmap \
    sqlmap \
    wfuzz \
    exploitdb \
    nikto \
    commix \
    hashcat \
    # Wordlists
    wordlists \
    cewl

# Install Other tools
RUN apt-get install -y \
    gdb

# Install utils
RUN apt-get install -y \
    vim \
    git \
    wget \
    net-tools  \
    iputils-ping \
    whois  \
    netcat-traditional pciutils usbutils

# Install useful languages
RUN apt -y install python3-pip golang nodejs npm

# Install Kali Linux "Top 10" metapackage and a few cybersecurity useful tools
RUN DEBIAN_FRONTEND=noninteractive apt -y install kali-tools-top10 exploitdb man-db dirb nikto wpscan uniscan lsof apktool dex2jar

CMD ["/bin/bash"]