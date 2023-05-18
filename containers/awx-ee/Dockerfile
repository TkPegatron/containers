FROM quay.io/ansible/awx-ee:latest@sha256:297114789d1436685d4b1c6383a9cc1e5668c865f37d73dd4083be2b60dcef62
# Install Python Dependencies
COPY ./containers/awx-ee/requirements.txt /opt/requirements.txt
RUN pip install -r /opt/requirements.txt

# Install Ansible Depenedencies
COPY ./containers/awx-ee/requirements.yml /opt/requirements.yml
RUN ansible-galaxy install -r /opt/requirements.yml