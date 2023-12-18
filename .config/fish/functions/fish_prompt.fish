function fish_prompt
  set -l last_status $status

  set -l normal_color (set_color normal)
  set -l error_color  (set_color brred)
  set -l python_color (set_color bryellow)
  set -l node_color   (set_color brgreen)
  set -l repo_color   (set_color cyan)
  set -l jobs_color   (set_color brmagenta)

  if not set -q VIRTUAL_ENV_DISABLE_PROMPT
    set -g VIRTUAL_ENV_DISABLE_PROMPT true
  end

  set -l jobs_count (jobs | wc -l | tr -d " ")
  if test $jobs_count -ne 0
    echo -ns $jobs_color "%$jobs_count" $normal_color " "
  end

  if test -n "$last_status" -a $last_status -ne 0
    echo -ns $error_color "!$last_status" $normal_color " "
  end

  set -l node_version
  if type -q nvm; and type -q node
    set node_version (nvm current) 
  end
  if test -n "$node_version" -a "$node_version" != "system"
    echo -ns $node_color $node_version $normal_color " "
  end

  if test -n "$VIRTUAL_ENV"
    set venv (basename $VIRTUAL_ENV)
    echo -ns $python_color $venv $normal_color " "
  end

  set -l cwd (prompt_pwd)
  echo -ns $normal_color $cwd $normal_color " "

  if git_is_repo
    echo -ns $repo_color (git_branch_name) $normal_color " "
  end

  echo
  # Line 2
  echo -n "··· "
end
