function tmux-session -a cwd
  if test ! -n "$cwd"
    set cwd (find ~/Projects -mindepth 2 -maxdepth 2 -type d | fzf)
  end
  set -l name (basename "$cwd" | tr '[:upper:]' '[:lower:]')

  tmux has-session -t=$name 2> /dev/null
  if test ! $status -eq 0
      tmux new-session -ds $name -c $cwd
  end

  tmux switch-client -t $name
end
