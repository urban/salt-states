include:
  - nginx

nginx-conf:
  file.managed:
    - name: /etc/nginx/sites-available/my_app.conf
    - source: salt://app/nginx/my_app.conf
    - mode: 755
    - runas: root
    - require:
      - pkg: nginx

enable-nginx-site:
  file.symlink:
    - name: /etc/nginx/sites-enabled/my_app.conf
    - target: /etc/nginx/sites-available/my_app.conf
    - force: True
    - runas: root
    - require:
      - file: nginx-conf

start-nginx:
  service.running:
    - name: nginx
    - enable: True
    - watch:
      - file: enable-nginx-site
    - reload: True
    - require:
      - pkg: nginx

/tmp/sockets/:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
    - require:
      - file.symlink: enable-nginx-site
