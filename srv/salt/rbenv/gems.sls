include:
  - rbenv

gems:
  gem.installed:
    - names:
    {% for gem in pillar.get('gems', []) %}
      - {{gem}}
    {% endfor %}
    - runas: root
    - require:
      - cmd.run: profile-source
