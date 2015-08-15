{% set user=pillar['current_user'] %}
{% set home='/home/%s'%user %}

tmux:
  pkg:
  - installed

{{home}}/.tmux.conf:
  file.managed:
    - source: salt://requirements/files/tmux.conf
    - require:
      - pkg: tmux
