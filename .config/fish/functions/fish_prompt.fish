function fish_prompt
  set -l last_status $status

  set -l normal_color (set_color normal)

  set -l jobs_color (set_color brmagenta)
  set -l error_color (set_color brred)
  set -l private_color (set_color brblue)

  set -l cwd_color (set_color blue)
  set -l python_color (set_color yellow)
  set -l node_color (set_color green)
  set -l repo_color (set_color cyan)

  set -l cmd_color (set_color cyan)

  if not set -q VIRTUAL_ENV_DISABLE_PROMPT
    set -g VIRTUAL_ENV_DISABLE_PROMPT true
  end

  if test -n "$fish_private_mode"
    echo -ns $private_color "*P" $normal_color " "
  end

  set -l jobs_count (jobs | wc -l | tr -d " ")
  if test $jobs_count -ne 0
    echo -ns $jobs_color "%$jobs_count" $normal_color " "
  end

  if test -n "$last_status" -a $last_status -ne 0
    echo -ns $error_color "!$last_status" $normal_color " "
  end

  if test -n "$VIRTUAL_ENV"
    echo -ns $python_color ^V $normal_color " "
  end

  set -l cwd (prompt_pwd)
  echo -ns $cwd_color $cwd $normal_color " "

  if git_is_repo
    echo -ns $repo_color (git_branch_name) $normal_color " "
  end

  echo
  # Line 2
  echo -ns $cmd_color ">" $normal_color " "
end
