set -gx VISUAL nvim
set -gx EDITOR nvim
set -gx MANPAGER nvim -c 'Man!' -o -
set -gx FZF_DEFAULT_OPTS --color 16
if status is-interactive
    # Commands to run in interactive sessions can go here
end

