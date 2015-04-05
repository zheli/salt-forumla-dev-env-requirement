/etc/default/locale:
  file.touch

set-system-locale:
  locale.system:
    - name: en_US.UTF-8
    - require:
      - file: /etc/default/locale

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
