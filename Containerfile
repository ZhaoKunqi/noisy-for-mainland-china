FROM docker.io/library/almalinux:latest
RUN dnf upgrade -y && dnf install python3 python3-pip -y && pip3 install requests
ADD noisy.py config_mainland_china_general_purpose_v01.json /noisy/
WORKDIR /noisy/
CMD python3 noisy.py --config config_mainland_china_general_purpose_v01.json
