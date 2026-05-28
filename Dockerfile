FROM registry.access.redhat.com/ubi9/ubi:latest
WORKDIR /ansible-rules
RUN dnf install pip -y
RUN pip install ansible-rulebook
RUN ansible-galaxy collection install ansible.eda 
COPY webhook-rulebook.yml ./
COPY inventory.yml ./
COPY action-playbook.yml ./
EXPOSE 8080
CMD ["ansible-rulebook", "-r webhook-rulebook.yml --verbose -i inventory.yml"]