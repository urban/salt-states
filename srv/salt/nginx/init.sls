
nginx:
  pkgrepo.managed:
    - ppa: nginx/stable
    - require_in:
      - pkg: nginx
  pkg:
    - installed

nginx-sockets:
  file.directory:
    - name: /tmp/sockets
    - user: root
    - group: root
    - mode: 755
    - recurse:
      - user
      - group
      - mode
    - makedirs: True
    - runas: root
    - require:
      - pkg.installed: nginx

default-nginx:
  file.absent:
    - name: /etc/nginx/sites-enabled/default
