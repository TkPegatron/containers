ARG VERSION
FROM quay.io/ansible/awx-ee:${VERSION}

COPY ./apps/awx-ee/build/requirements.txt .
COPY ./apps/awx-ee/build/requirements.yml .

USER root

# NOTE: This RUN is an example for if we need bindeps
#RUN microdnf -y gcc

RUN pip install --upgrade pip && pip install -r requirements.txt
RUN ansible-galaxy collection install -r requirements.yml -p /usr/share/ansible/collections