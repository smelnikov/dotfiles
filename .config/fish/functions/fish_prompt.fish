function fish_prompt
  set -l last_status $status

  set -l normal_color (set_color normal)
  set -l error_color  (set_color brred)
  set -l python_color (set_color bryellow)
  set -l node_color   (set_color brgreen)
  set -l repo_color   (set_color cyan)

  if not set -q VIRTUAL_ENV_DISABLE_PROMPT
    set -g VIRTUAL_ENV_DISABLE_PROMPT true
  end

  set -l bg_jobs
  jobs -p >/dev/null
  and set bg_jobs 1

  if test -n "$bg_jobs"
    echo -ns "%" " "
  end

  if test -n "$last_status" -a $last_status -ne 0
    echo -ns $error_color "($last_status)" $normal_color " "
  end

  set -l cwd (prompt_pwd)

  if type -q nvm; and type -q node
      set node_version (node -v 2>/dev/null) 
      echo -n -s $node_color $node_version $normal_color " "
  end

  if test -n "$VIRTUAL_ENV"
    set venv (basename $VIRTUAL_ENV)
    echo -n -s $python_color $venv $normal_color " "
  end

  echo -n -s $normal_color $cwd $normal_color

  if git_is_repo
    echo -n -s " " $repo_color (git_branch_name) $normal_color " "
  end

  echo
  # Line 2
  echo -n -s "> "
end
