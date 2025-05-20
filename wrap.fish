## support complete author/module

set -l user_path ~/.moon/registry/index/user
set -l authors (ls $user_path)

# set -l xs 

for author in $authors
  set -l mod_idxs (ls "$user_path/$author")
  for mod_idx in $mod_idxs
    set -l mod (echo (string replace --all ".index" "" $mod_idx))
    set xs $xs "$author/$mod"
  end
end 

complete -c moon -n "__fish_seen_subcommand_from add" -x -a "$xs"