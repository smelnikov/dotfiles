set -gx VISUAL nvim
set -gx EDITOR nvim
set -gx MANPAGER nvim -c 'Man!' -o -
set -gx FZF_DEFAULT_OPTS --color 16

source ~/.asdf/asdf.fish
source ~/.asdf/completions/asdf.fish

set -gx VIRTUAL_ENV_DISABLE_PROMPT true
set -q VIRTUAL_ENV; and source "$VIRTUAL_ENV/bin/activate.fish"

if status is-interactive
  fish_hybrid_key_bindings
  fish_config theme choose Dracula

  set fish_cursor_default block
  set fish_cursor_insert block
  set fish_cursor_replace_one block
  set fish_cursor_replace block
  set fish_cursor_external block
  set fish_cursor_visual block

end

