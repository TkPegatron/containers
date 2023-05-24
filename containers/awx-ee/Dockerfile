FROM quay.io/ansible/awx-ee:latest@sha256:5baf14e999b4a287e0e122c6f50b41cdef79a64889358f1c4db63695f484448b

# Install Python Dependencies
USER root
COPY ./containers/awx-ee/requirements.txt /opt/requirements.txt
RUN pip install -r /opt/requirements.txt

# Install Ansible Depenedencies
USER 1000
COPY ./containers/awx-ee/requirements.yml /opt/requirements.yml
RUN ansible-galaxy install -r /opt/requirements.yml
