{% set user=pillar['current_user'] %}
{% set home='/home/%s'%user %}
{% set vim_path='/home/%s/.vim'%user %}
vim:
  pkg:
    - installed

{{home}}/.vimrc:
  file:
    - managed
    - source: salt://requirements/files/vimrc
    - mode: 664
    - user: {{user}}
    - group: {{user}}

{{vim_path}}:
  file.directory:
    - user: {{user}}
    - group: {{user}}
    - template: jinja
    - mode: 775

{{vim_path}}/bundle:
  file.directory:
    - user: {{user}}
    - group: {{user}}
    - template: jinja
    - mode: 775

vundle_source:
  git.latest:
    - name: https://github.com/gmarik/Vundle.vim.git
    - target: {{vim_path}}/bundle/Vundle.vim
    - force: true

#install-vim-plugins:
#  cmd.run:
#    - name: 'vim +PluginInstall +qall'
#    - user: {{user}}
#    - require:
#      - git: vundle_source
