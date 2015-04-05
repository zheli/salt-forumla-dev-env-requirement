tmux:
  pkg.installed: []

/home/vagrant/.tmux.conf:
  file.managed:
    - name: /home/{{pillar['current_user']}}/.tmux.conf
    - source: salt://requirements/files/tmux.conf
    - require:
      - pkg: tmux
