## moon

complete -c moon -n __fish_use_subcommand -x -a new -d "Create a new moon module"
complete -c moon -n __fish_use_subcommand -x -a build -d "Build the current package"
complete -c moon -n __fish_use_subcommand -x -a check -d "Check the current package, but don't build object files"
complete -c moon -n __fish_use_subcommand -x -a run -d "Run a main package"
complete -c moon -n __fish_use_subcommand -x -a test -d "Test the current package"
complete -c moon -n __fish_use_subcommand -x -a clean -d "Remove the target directory"
complete -c moon -n __fish_use_subcommand -x -a fmt -d "Format source code"
complete -c moon -n __fish_use_subcommand -x -a doc -d "Generate documentation"
complete -c moon -n __fish_use_subcommand -x -a info -d "Generate public interface (\.mbti\) files for all packages in the module"
complete -c moon -n __fish_use_subcommand -x -a bench -d "Run benchmarks in the current package"
complete -c moon -n __fish_use_subcommand -x -a add -d "Add a dependency"
complete -c moon -n __fish_use_subcommand -x -a remove -d "Remove a dependency"
complete -c moon -n __fish_use_subcommand -x -a install -d "Install dependencies"
complete -c moon -n __fish_use_subcommand -x -a tree -d "Display the dependency tree"
complete -c moon -n __fish_use_subcommand -x -a login -d "Log in to your account"
complete -c moon -n __fish_use_subcommand -x -a register -d "Register an account at mooncakes.io"
complete -c moon -n __fish_use_subcommand -x -a publish -d "Publish the current module"
complete -c moon -n __fish_use_subcommand -x -a package -d "Package the current module"
complete -c moon -n __fish_use_subcommand -x -a update -d "Update the package registry index"
complete -c moon -n __fish_use_subcommand -x -a coverage -d "Code coverage utilities"
complete -c moon -n __fish_use_subcommand -x -a generate-build-matrix -d "Generate build matrix for benchmarking (legacy feature)"
complete -c moon -n __fish_use_subcommand -x -a upgrade -d "Upgrade toolchains"
complete -c moon -n __fish_use_subcommand -x -a shell-completion -d "Generate shell completion for bash/elvish/fish/pwsh/zsh to stdout"
complete -c moon -n __fish_use_subcommand -x -a version -d "Print version information and exit"
complete -c moon -n __fish_use_subcommand -x -a help -d "Print this message or the help of the given subcommand(s)"

# Options
complete -c moon -s h -l help -d "Print help"

# Common Options:
complete -c moon -s C -l directory -r -d "The source code directory. Defaults to the current directory"
complete -c moon -l target-dir -r -d "The target directory. Defaults to `source_dir/target`"
complete -c moon -s q -l quiet -d "Suppress output"
complete -c moon -s v -l verbose -d "Increase verbosity"
complete -c moon -l trace -d "Trace the execution of the program"
complete -c moon -l dry-run -d "Do not actually run the command"
complete -c moon -l build-graph -d "Generate build graph"


set -l cmds build run test bench
# moon $cmds subcommand completions
complete -c moon -n "__fish_seen_subcommand_from $cmds" -s h -l help -d "Print help"
complete -c moon -n "__fish_seen_subcommand_from $cmds" -l std -d "Enable the standard library (default)"
complete -c moon -n "__fish_seen_subcommand_from $cmds" -l nostd -d "Disable the standard library"
complete -c moon -n "__fish_seen_subcommand_from $cmds" -s g -l debug -d "Emit debug information"
complete -c moon -n "__fish_seen_subcommand_from $cmds" -l release -d "Compile in release mode"
complete -c moon -n "__fish_seen_subcommand_from $cmds" -l strip -d "Enable stripping debug information"
complete -c moon -n "__fish_seen_subcommand_from $cmds" -l no-strip -d "Disable stripping debug information"
complete -c moon -n "__fish_seen_subcommand_from $cmds" -l target -x -a "wasm wasm-gc js native llvm all" -d "Select output target"
complete -c moon -n "__fish_seen_subcommand_from $cmds" -l serial -d "Handle the selected targets sequentially"
complete -c moon -n "__fish_seen_subcommand_from $cmds" -l enable-coverage -d "Enable coverage instrumentation"
complete -c moon -n "__fish_seen_subcommand_from $cmds" -l sort-input -d "Sort input files"
complete -c moon -n "__fish_seen_subcommand_from $cmds" -l output-wat -d "Output WAT instead of WASM"
complete -c moon -n "__fish_seen_subcommand_from $cmds" -s d -l deny-warn -d "Treat all warnings as errors"
complete -c moon -n "__fish_seen_subcommand_from $cmds" -l no-render -d "Don't render diagnostics from moonc (don't pass '-error-format json' to moonc)"
complete -c moon -n "__fish_seen_subcommand_from $cmds" -l warn-list -r -d "Warn list config"
complete -c moon -n "__fish_seen_subcommand_from $cmds" -l alert-list -r -d "Alert list config"
complete -c moon -n "__fish_seen_subcommand_from $cmds" -s j -l jobs -r -d "Set the max number of jobs to run in parallel"

# Manifest options for moon run
complete -c moon -n "__fish_seen_subcommand_from $cmds" -l frozen -d "Do not sync dependencies, assuming local dependencies are up-to-date"
complete -c moon -n "__fish_seen_subcommand_from $cmds" -l build-only -d "Only build, do not run the code"

# set -l cmds build test bench

complete -c moon -n "__fish_seen_subcommand_from $cmds" -s p -l package -x -d "specify package"

set -l user_path ~/.moon/registry/index/user
set -l authors (ls $user_path)

# set -l xs 

for author in $authors
  set -l pkg_idxs (ls "$user_path/$author")
  for pkg_idx in $pkg_idxs
    set -l pkg (echo (string replace --all ".index" "" $pkg_idx))
    set xs $xs "$author/$pkg"
  end
end 

complete -c moon -n "__fish_seen_subcommand_from add" -x -a "$xs"
