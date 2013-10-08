include:
  - rbenv.gems

bundle-install:
  cmd.run:
    - name: bundle install
    - cwd: /vagrant
    - require:
      - gem.installed: gems
