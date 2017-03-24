---

- name: install pack
  hosts: all
  connection: local
  gather_facts: False
