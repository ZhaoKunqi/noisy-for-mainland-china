FROM docker.io/library/rockylinux:9
RUN dnf install python3-pip -y && pip3 install requests
ADD noisy.py /noisy/
ADD config-mcgp.json /noisy/
WORKDIR /noisy/
CMD python3 noisy.py --config config-mcgp.json
