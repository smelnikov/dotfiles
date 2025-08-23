function brew_dump -d "Brew dump with no dependencies"
  rm -f ~/Brewfile

  for t in (brew tap | sort)
    echo "tap \"$t\"" >> ~/Brewfile
  end

  for f in (brew leaves | sort)
    echo "brew \"$f\"" >> ~/Brewfile
  end

  for c in (brew list --cask | sort)
    echo "cask \"$c\"" >> ~/Brewfile
  end
end;
