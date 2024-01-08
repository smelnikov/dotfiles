set -gx VISUAL nvim
set -gx EDITOR nvim
set -gx MANPAGER nvim -c 'Man!' -o -
set -gx FZF_DEFAULT_OPTS --color 16

if status is-interactive
  fish_hybrid_key_bindings
  fish_config theme choose Dracula
end

