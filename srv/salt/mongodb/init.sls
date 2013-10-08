
mongodb:
  pkgrepo.managed:
    - humanname: 10gen-repo
    - name: deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen
    - keyid: 7F0CEB10
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: mongodb
  pkg:
    - installed
  service.running:
    - require:
      - pkg: mongodb
