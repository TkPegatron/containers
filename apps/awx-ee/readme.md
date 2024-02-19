# AWX Ansible Execution Environment

This context was mostly generated using the `ansible-builder create` command and the following `execution-environment.yml`:

```yaml
version: 1
dependencies:
  galaxy: requirements.yml
  python: requirements.txt

additional_build_steps:
  prepend: |
    RUN pip3 install --upgrade pip setuptools
```

then meshed into this repository for automating the build and push workflows.