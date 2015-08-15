{% set user=pillar['current_user'] %}
{% set home='/home/%s'%user %}
git:
  pkg:
    - installed

{{home}}/.gitconfig:
  file.managed:
    - source: salt://requirements/files/gitconfig
