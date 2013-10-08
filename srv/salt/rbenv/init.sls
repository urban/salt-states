
rbenv-deps:
  pkg.installed:
    - pkgs:
      - bash
      - git
      - openssl
      - make
      - curl

ruby-{{ pillar['ruby']['version'] }}:
  rbenv.installed:
    - default: True
    - require:
      - pkg: rbenv-deps

rbenv-profile:
  file.append:
    - name: /home/vagrant/.profile
    - text:
      - export RBENV_ROOT=/usr/local/rbenv
      - export export PATH="$RBENV_ROOT/bin:$PATH"
      - eval "$(rbenv init -)"
    - require:
      - rbenv: ruby-{{ pillar['ruby']['version'] }}

profile-source:
  cmd.run:
    - name: source ~/.profile
    - user: vagrant
    - cmd: /home/vagrant
    - require:
      - file.append: rbenv-profile
