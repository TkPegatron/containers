FROM quay.io/ansible/awx-ee:latest@sha256:df599ea31f352fa0065a0626f1412488af9b7c216922909b674c5a7167804d1b

USER root

# Install Python Dependencies
COPY ./containers/awx-ee/requirements.txt /opt/requirements.txt
RUN pip install -r /opt/requirements.txt

# Install Ansible Depenedencies
COPY ./containers/awx-ee/requirements.yml /opt/requirements.yml
RUN ansible-galaxy install -r /opt/requirements.yml

USER 1000