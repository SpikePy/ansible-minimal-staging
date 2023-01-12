# Minimal Ansible Setup with Staging

This is just a POC of how to create a minimal ansible setup with staging.

## Usage

### ansible installed on host

To run the example playbook for a stage execute

```sh
ansible-playbook example.playbook.yaml --inventory=variables/dev
ansible-playbook example.playbook.yaml --inventory=variables/prd
```

### ansible in docker toolbox

#### non-interactive

```sh
./ansible-playbook.sh example.playbook.yaml --inventory=variables/dev
./ansible-playbook.sh example.playbook.yaml --inventory=variables/prd
```

#### interactive

```sh
./ansible-playbook.sh
```
