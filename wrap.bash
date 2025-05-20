## support complete author/module


_moon_modules() {
  local user_path authors mod
  user_path=~/.moon/registry/index/user

  authors=$(ls $user_path)

  _MOON_MODULES=""
  for author in $authors ; do
    for mod_idx in $(ls "$user_path/$author" ); do 
      mod=${mod_idx/.index/}
      _MOON_MODULES+=" $author/$mod"
    done 
  done
}

_moon_modules

_moon_add() 
{
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"


  for i in ${COMP_WORDS[@]}; do 
    if [[ $i == add ]]; then 
      COMPREPLY=( $(compgen -W "$_MOON_MODULES" -- ${cur} ))
      return 0
    fi
  done 
  _moon moon
}



if [[ "${BASH_VERSINFO[0]}" -eq 4 && "${BASH_VERSINFO[1]}" -ge 4 || "${BASH_VERSINFO[0]}" -gt 4 ]]; then
    complete -F _moon_add -o nosort -o bashdefault -o default moon
else
    complete -F _moon_add -o bashdefault -o default moon
fi