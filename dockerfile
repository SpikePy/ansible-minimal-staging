FROM python:alpine

RUN touch ~/.ash_history

# install ansible
RUN pip install ansible-core \
 && ansible-galaxy collection install community.general

# let ansible output yaml instead of json
ENV ANSIBLE_STDOUT_CALLBACK=yaml

# customize prompt
ENV PS1='[\u@ansible-toolbox][\w] '

# set entrypoint to bash instead of python (base image)
ENTRYPOINT ["/bin/ash"]
