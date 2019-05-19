function fish_prompt
  set -l symbol_path \uf815
  set -l symbol_chevron_right \uf460

  set -l git_status
  set -l is_behind
  set -l is_ahead

  set_color -b black
  echo -n $symbol_path ' '
  echo -n (pwd | sed "s|^$HOME|~|")
  echo -n ' '
  set_color normal

  echo -n ' '

  set -l index (git status --porcelain -b 2>/dev/null)
  if test "$index"
    set -l symbol_git_branch \ue725
    set -l trimmed_index (string split \n $index | string sub --start 1 --length 2)

    for i in $trimmed_index
      if test (string match '\?\?' $i)
        set git_status untracked $git_status
      end
      if test (string match '*A*' $i)
        set git_status added $git_status
      end
      if test (string match '*M*' $i)
        set git_status modified $git_status
      end
      if test (string match '*R*' $i)
        set git_status renamed $git_status
      end
      if test (string match '*D*' $i)
        set git_status deleted $git_status
      end
      if test (string match '*U*' $i)
        set git_status unmerged $git_status
      end
    end

    # Check whether the branch is ahead
    if test (string match '*ahead*' $index)
      set is_ahead true
    end

    # Check whether the branch is behind
    if test (string match '*behind*' $index)
      set is_behind true
    end

    set_color black
    if test "$git_status"
      set_color -b red
    else
      set_color -b green
    end

    set -l git_branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)

    echo -n ' '$symbol_git_branch
    echo -n ' '$git_branch

    if test "$git_status"
      set -l symbol_git_dirty \uf911
      echo -n ' '$symbol_git_dirty
    end

    if test "$is_behind" = "true"
      set -l symbol_git_behind \ue340
      echo -n ' '$symbol_git_behind
    end

    if test "$is_ahead" = "true"
      set -l symbol_git_ahead \ue353
      echo -n ' '$symbol_git_ahead
    end

    echo -n ' '
    set_color normal
    echo -n ' '
  end

  # Prompt
  echo ''
  set_color normal
  echo -n $symbol_chevron_right
  echo -n ' '
end
