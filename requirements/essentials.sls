/etc/default/locale:
  file.managed:
    - source: salt://requirements/files/locale

essential-packages:
  pkg.installed:
    - names:
      - vim-nox
      - sysstat
      - build-essential
      - language-pack-en
      # We need this to recognize rxvt terminal
      - ncurses-term
      - bash
      - openssh-server
      # Some tools for development
      - tmux
      - git
      - htop
      - silversearcher-ag

{{pillar['current_user']}}:
  user.present:
    - shell: /bin/bash
    - home: /home/{{pillar['current_user']}}
    - gid_from_name: True

Europe/Stockholm:
  timezone.system
