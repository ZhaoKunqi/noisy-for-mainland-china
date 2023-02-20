FROM docker.io/library/rockylinux:9
RUN dnf install python3-pip -y && pip3 install requests
ADD noisy.py /noisy/
ADD config_mainland_china_general_purpose.json /noisy/
WORKDIR /noisy/
CMD python3 noisy.py --config config_mainland_china_general_purpose.json
