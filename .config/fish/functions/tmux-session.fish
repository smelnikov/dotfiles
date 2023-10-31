function tmux-session
  set -l cwd (find ~/IdeaProjects -mindepth 2 -maxdepth 2 -type d | fzf)
  set -l name (basename "$cwd" | tr . _)

  tmux has-session -t=$name 2> /dev/null

  if test ! $status -eq 0
      tmux new-session -ds $name -c $cwd
  end

  tmux switch-client -t $name
end
