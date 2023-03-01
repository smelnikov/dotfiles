function bobthefish_colors -S -d 'Define a custom bobthefish color scheme'
  __bobthefish_colors dracula

  set -l bg           282a36
  set -l yellow       f1fa8c

  set -x color_virtualfish     $yellow $bg --bold
  set -x superscript_glyph     \uE73C \uE73C \uE73C
  set -x virtualenv_glyph      ''
end
