FROM ubuntu:hirsute AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y sudo curl git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

WORKDIR /root/ansible
COPY . .
RUN chmod +x ansible.sh
CMD ["cd ","ansible"]

