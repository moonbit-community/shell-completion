# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_moon_global_optspecs
	string join \n C/directory= target-dir= q/quiet v/verbose trace dry-run build-graph h/help
end

function __fish_moon_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_moon_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_moon_using_subcommand
	set -l cmd (__fish_moon_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c moon -n "__fish_moon_needs_command" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_needs_command" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_needs_command" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_needs_command" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_needs_command" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_needs_command" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_needs_command" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_needs_command" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_needs_command" -f -a "new" -d 'Create a new MoonBit module'
complete -c moon -n "__fish_moon_needs_command" -f -a "bundle" -d 'Bundle the module'
complete -c moon -n "__fish_moon_needs_command" -f -a "build" -d 'Build the current package'
complete -c moon -n "__fish_moon_needs_command" -f -a "check" -d 'Check the current package, but don\'t build object files'
complete -c moon -n "__fish_moon_needs_command" -f -a "run" -d 'Run a main package'
complete -c moon -n "__fish_moon_needs_command" -f -a "test" -d 'Test the current package'
complete -c moon -n "__fish_moon_needs_command" -f -a "generate-test-driver" -d 'Generate tests for the provided packages'
complete -c moon -n "__fish_moon_needs_command" -f -a "clean" -d 'Remove the target directory'
complete -c moon -n "__fish_moon_needs_command" -f -a "fmt" -d 'Format source code'
complete -c moon -n "__fish_moon_needs_command" -f -a "doc" -d 'Generate documentation'
complete -c moon -n "__fish_moon_needs_command" -f -a "info" -d 'Generate public interface (`.mbti`) files for all packages in the module'
complete -c moon -n "__fish_moon_needs_command" -f -a "bench" -d 'Run benchmarks in the current package'
complete -c moon -n "__fish_moon_needs_command" -f -a "add" -d 'Add a dependency'
complete -c moon -n "__fish_moon_needs_command" -f -a "remove" -d 'Remove a dependency'
complete -c moon -n "__fish_moon_needs_command" -f -a "install" -d 'Install dependencies'
complete -c moon -n "__fish_moon_needs_command" -f -a "tree" -d 'Display the dependency tree'
complete -c moon -n "__fish_moon_needs_command" -f -a "login" -d 'Log in to your account'
complete -c moon -n "__fish_moon_needs_command" -f -a "register" -d 'Register an account at mooncakes.io'
complete -c moon -n "__fish_moon_needs_command" -f -a "publish" -d 'Publish the current module'
complete -c moon -n "__fish_moon_needs_command" -f -a "package" -d 'Package the current module'
complete -c moon -n "__fish_moon_needs_command" -f -a "update" -d 'Update the package registry index'
complete -c moon -n "__fish_moon_needs_command" -f -a "coverage" -d 'Code coverage utilities'
complete -c moon -n "__fish_moon_needs_command" -f -a "generate-build-matrix" -d 'Generate build matrix for benchmarking (legacy feature)'
complete -c moon -n "__fish_moon_needs_command" -f -a "query"
complete -c moon -n "__fish_moon_needs_command" -f -a "upgrade" -d 'Upgrade toolchains'
complete -c moon -n "__fish_moon_needs_command" -f -a "shell-completion" -d 'Generate shell completion for bash/elvish/fish/pwsh/zsh to stdout'
complete -c moon -n "__fish_moon_needs_command" -f -a "version" -d 'Print version information and exit'
complete -c moon -n "__fish_moon_needs_command" -f -a "tool"
complete -c moon -n "__fish_moon_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c moon -n "__fish_moon_using_subcommand new" -l path -d 'Output path of the package' -r -F
complete -c moon -n "__fish_moon_using_subcommand new" -l user -d 'The user name of the package' -r
complete -c moon -n "__fish_moon_using_subcommand new" -l name -d 'The name part of the package' -r
complete -c moon -n "__fish_moon_using_subcommand new" -l license -d 'The license of the package' -r
complete -c moon -n "__fish_moon_using_subcommand new" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand new" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand new" -l lib -d 'Create a library package instead of an executable'
complete -c moon -n "__fish_moon_using_subcommand new" -l no-license -d 'Do not set a license for the package'
complete -c moon -n "__fish_moon_using_subcommand new" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand new" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand new" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand new" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand new" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand new" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand bundle" -l target -d 'Select output target' -r -f -a "{wasm\t'',wasm-gc\t'',js\t'',native\t'',llvm\t'',all\t''}"
complete -c moon -n "__fish_moon_using_subcommand bundle" -l warn-list -d 'Warn list config' -r
complete -c moon -n "__fish_moon_using_subcommand bundle" -l alert-list -d 'Alert list config' -r
complete -c moon -n "__fish_moon_using_subcommand bundle" -s j -l jobs -d 'Set the max number of jobs to run in parallel' -r
complete -c moon -n "__fish_moon_using_subcommand bundle" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand bundle" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand bundle" -l std -d 'Enable the standard library (default)'
complete -c moon -n "__fish_moon_using_subcommand bundle" -l nostd -d 'Disable the standard library'
complete -c moon -n "__fish_moon_using_subcommand bundle" -s g -l debug -d 'Emit debug information'
complete -c moon -n "__fish_moon_using_subcommand bundle" -l release -d 'Compile in release mode'
complete -c moon -n "__fish_moon_using_subcommand bundle" -l strip -d 'Enable stripping debug information'
complete -c moon -n "__fish_moon_using_subcommand bundle" -l no-strip -d 'Disable stripping debug information'
complete -c moon -n "__fish_moon_using_subcommand bundle" -l serial -d 'Handle the selected targets sequentially'
complete -c moon -n "__fish_moon_using_subcommand bundle" -l enable-coverage -d 'Enable coverage instrumentation'
complete -c moon -n "__fish_moon_using_subcommand bundle" -l sort-input -d 'Sort input files'
complete -c moon -n "__fish_moon_using_subcommand bundle" -l output-wat -d 'Output WAT instead of WASM'
complete -c moon -n "__fish_moon_using_subcommand bundle" -s d -l deny-warn -d 'Treat all warnings as errors'
complete -c moon -n "__fish_moon_using_subcommand bundle" -l no-render -d 'Don\'t render diagnostics from moonc (don\'t pass \'-error-format json\' to moonc)'
complete -c moon -n "__fish_moon_using_subcommand bundle" -l enable-value-tracing -d 'Enable value tracing'
complete -c moon -n "__fish_moon_using_subcommand bundle" -l all -d 'Bundle all targets'
complete -c moon -n "__fish_moon_using_subcommand bundle" -l frozen -d 'Do not sync dependencies, assuming local dependencies are up-to-date'
complete -c moon -n "__fish_moon_using_subcommand bundle" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand bundle" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand bundle" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand bundle" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand bundle" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand bundle" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand build" -l target -d 'Select output target' -r -f -a "{wasm\t'',wasm-gc\t'',js\t'',native\t'',llvm\t'',all\t''}"
complete -c moon -n "__fish_moon_using_subcommand build" -l warn-list -d 'Warn list config' -r
complete -c moon -n "__fish_moon_using_subcommand build" -l alert-list -d 'Alert list config' -r
complete -c moon -n "__fish_moon_using_subcommand build" -s j -l jobs -d 'Set the max number of jobs to run in parallel' -r
complete -c moon -n "__fish_moon_using_subcommand build" -l install-path -r -F
complete -c moon -n "__fish_moon_using_subcommand build" -l package -r
complete -c moon -n "__fish_moon_using_subcommand build" -l bin-alias -r
complete -c moon -n "__fish_moon_using_subcommand build" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand build" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand build" -l std -d 'Enable the standard library (default)'
complete -c moon -n "__fish_moon_using_subcommand build" -l nostd -d 'Disable the standard library'
complete -c moon -n "__fish_moon_using_subcommand build" -s g -l debug -d 'Emit debug information'
complete -c moon -n "__fish_moon_using_subcommand build" -l release -d 'Compile in release mode'
complete -c moon -n "__fish_moon_using_subcommand build" -l strip -d 'Enable stripping debug information'
complete -c moon -n "__fish_moon_using_subcommand build" -l no-strip -d 'Disable stripping debug information'
complete -c moon -n "__fish_moon_using_subcommand build" -l serial -d 'Handle the selected targets sequentially'
complete -c moon -n "__fish_moon_using_subcommand build" -l enable-coverage -d 'Enable coverage instrumentation'
complete -c moon -n "__fish_moon_using_subcommand build" -l sort-input -d 'Sort input files'
complete -c moon -n "__fish_moon_using_subcommand build" -l output-wat -d 'Output WAT instead of WASM'
complete -c moon -n "__fish_moon_using_subcommand build" -s d -l deny-warn -d 'Treat all warnings as errors'
complete -c moon -n "__fish_moon_using_subcommand build" -l no-render -d 'Don\'t render diagnostics from moonc (don\'t pass \'-error-format json\' to moonc)'
complete -c moon -n "__fish_moon_using_subcommand build" -l enable-value-tracing -d 'Enable value tracing'
complete -c moon -n "__fish_moon_using_subcommand build" -l frozen -d 'Do not sync dependencies, assuming local dependencies are up-to-date'
complete -c moon -n "__fish_moon_using_subcommand build" -s w -l watch -d 'Monitor the file system and automatically build artifacts'
complete -c moon -n "__fish_moon_using_subcommand build" -l show-artifacts
complete -c moon -n "__fish_moon_using_subcommand build" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand build" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand build" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand build" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand build" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand build" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand check" -l target -d 'Select output target' -r -f -a "{wasm\t'',wasm-gc\t'',js\t'',native\t'',llvm\t'',all\t''}"
complete -c moon -n "__fish_moon_using_subcommand check" -l warn-list -d 'Warn list config' -r
complete -c moon -n "__fish_moon_using_subcommand check" -l alert-list -d 'Alert list config' -r
complete -c moon -n "__fish_moon_using_subcommand check" -s j -l jobs -d 'Set the max number of jobs to run in parallel' -r
complete -c moon -n "__fish_moon_using_subcommand check" -l patch-file -d 'The patch file to check, Only valid when checking specified package' -r -F
complete -c moon -n "__fish_moon_using_subcommand check" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand check" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand check" -l std -d 'Enable the standard library (default)'
complete -c moon -n "__fish_moon_using_subcommand check" -l nostd -d 'Disable the standard library'
complete -c moon -n "__fish_moon_using_subcommand check" -s g -l debug -d 'Emit debug information'
complete -c moon -n "__fish_moon_using_subcommand check" -l release -d 'Compile in release mode'
complete -c moon -n "__fish_moon_using_subcommand check" -l strip -d 'Enable stripping debug information'
complete -c moon -n "__fish_moon_using_subcommand check" -l no-strip -d 'Disable stripping debug information'
complete -c moon -n "__fish_moon_using_subcommand check" -l serial -d 'Handle the selected targets sequentially'
complete -c moon -n "__fish_moon_using_subcommand check" -l enable-coverage -d 'Enable coverage instrumentation'
complete -c moon -n "__fish_moon_using_subcommand check" -l sort-input -d 'Sort input files'
complete -c moon -n "__fish_moon_using_subcommand check" -l output-wat -d 'Output WAT instead of WASM'
complete -c moon -n "__fish_moon_using_subcommand check" -s d -l deny-warn -d 'Treat all warnings as errors'
complete -c moon -n "__fish_moon_using_subcommand check" -l no-render -d 'Don\'t render diagnostics from moonc (don\'t pass \'-error-format json\' to moonc)'
complete -c moon -n "__fish_moon_using_subcommand check" -l enable-value-tracing -d 'Enable value tracing'
complete -c moon -n "__fish_moon_using_subcommand check" -l output-json -d 'Output in json format'
complete -c moon -n "__fish_moon_using_subcommand check" -l frozen -d 'Do not sync dependencies, assuming local dependencies are up-to-date'
complete -c moon -n "__fish_moon_using_subcommand check" -s w -l watch -d 'Monitor the file system and automatically check files'
complete -c moon -n "__fish_moon_using_subcommand check" -l no-mi -d 'Whether to skip the mi generation, Only valid when checking specified package'
complete -c moon -n "__fish_moon_using_subcommand check" -l explain -d 'Whether to explain the error code with details'
complete -c moon -n "__fish_moon_using_subcommand check" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand check" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand check" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand check" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand check" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand check" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand run" -l target -d 'Select output target' -r -f -a "{wasm\t'',wasm-gc\t'',js\t'',native\t'',llvm\t'',all\t''}"
complete -c moon -n "__fish_moon_using_subcommand run" -l warn-list -d 'Warn list config' -r
complete -c moon -n "__fish_moon_using_subcommand run" -l alert-list -d 'Alert list config' -r
complete -c moon -n "__fish_moon_using_subcommand run" -s j -l jobs -d 'Set the max number of jobs to run in parallel' -r
complete -c moon -n "__fish_moon_using_subcommand run" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand run" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand run" -l std -d 'Enable the standard library (default)'
complete -c moon -n "__fish_moon_using_subcommand run" -l nostd -d 'Disable the standard library'
complete -c moon -n "__fish_moon_using_subcommand run" -s g -l debug -d 'Emit debug information'
complete -c moon -n "__fish_moon_using_subcommand run" -l release -d 'Compile in release mode'
complete -c moon -n "__fish_moon_using_subcommand run" -l strip -d 'Enable stripping debug information'
complete -c moon -n "__fish_moon_using_subcommand run" -l no-strip -d 'Disable stripping debug information'
complete -c moon -n "__fish_moon_using_subcommand run" -l serial -d 'Handle the selected targets sequentially'
complete -c moon -n "__fish_moon_using_subcommand run" -l enable-coverage -d 'Enable coverage instrumentation'
complete -c moon -n "__fish_moon_using_subcommand run" -l sort-input -d 'Sort input files'
complete -c moon -n "__fish_moon_using_subcommand run" -l output-wat -d 'Output WAT instead of WASM'
complete -c moon -n "__fish_moon_using_subcommand run" -s d -l deny-warn -d 'Treat all warnings as errors'
complete -c moon -n "__fish_moon_using_subcommand run" -l no-render -d 'Don\'t render diagnostics from moonc (don\'t pass \'-error-format json\' to moonc)'
complete -c moon -n "__fish_moon_using_subcommand run" -l enable-value-tracing -d 'Enable value tracing'
complete -c moon -n "__fish_moon_using_subcommand run" -l frozen -d 'Do not sync dependencies, assuming local dependencies are up-to-date'
complete -c moon -n "__fish_moon_using_subcommand run" -l build-only -d 'Only build, do not run the code'
complete -c moon -n "__fish_moon_using_subcommand run" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand run" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand run" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand run" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand run" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand run" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand test" -l target -d 'Select output target' -r -f -a "{wasm\t'',wasm-gc\t'',js\t'',native\t'',llvm\t'',all\t''}"
complete -c moon -n "__fish_moon_using_subcommand test" -l warn-list -d 'Warn list config' -r
complete -c moon -n "__fish_moon_using_subcommand test" -l alert-list -d 'Alert list config' -r
complete -c moon -n "__fish_moon_using_subcommand test" -s j -l jobs -d 'Set the max number of jobs to run in parallel' -r
complete -c moon -n "__fish_moon_using_subcommand test" -s p -l package -d 'Run test in the specified package' -r
complete -c moon -n "__fish_moon_using_subcommand test" -s f -l file -d 'Run test in the specified file. Only valid when `--package` is also specified' -r
complete -c moon -n "__fish_moon_using_subcommand test" -s i -l index -d 'Run only the index-th test in the file. Only valid when `--file` is also specified' -r
complete -c moon -n "__fish_moon_using_subcommand test" -s l -l limit -d 'Limit of expect test update passes to run, in order to avoid infinite loops' -r
complete -c moon -n "__fish_moon_using_subcommand test" -l patch-file -d 'Path to the patch file' -r -F
complete -c moon -n "__fish_moon_using_subcommand test" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand test" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand test" -l std -d 'Enable the standard library (default)'
complete -c moon -n "__fish_moon_using_subcommand test" -l nostd -d 'Disable the standard library'
complete -c moon -n "__fish_moon_using_subcommand test" -s g -l debug -d 'Emit debug information'
complete -c moon -n "__fish_moon_using_subcommand test" -l release -d 'Compile in release mode'
complete -c moon -n "__fish_moon_using_subcommand test" -l strip -d 'Enable stripping debug information'
complete -c moon -n "__fish_moon_using_subcommand test" -l no-strip -d 'Disable stripping debug information'
complete -c moon -n "__fish_moon_using_subcommand test" -l serial -d 'Handle the selected targets sequentially'
complete -c moon -n "__fish_moon_using_subcommand test" -l enable-coverage -d 'Enable coverage instrumentation'
complete -c moon -n "__fish_moon_using_subcommand test" -l sort-input -d 'Sort input files'
complete -c moon -n "__fish_moon_using_subcommand test" -l output-wat -d 'Output WAT instead of WASM'
complete -c moon -n "__fish_moon_using_subcommand test" -s d -l deny-warn -d 'Treat all warnings as errors'
complete -c moon -n "__fish_moon_using_subcommand test" -l no-render -d 'Don\'t render diagnostics from moonc (don\'t pass \'-error-format json\' to moonc)'
complete -c moon -n "__fish_moon_using_subcommand test" -l enable-value-tracing -d 'Enable value tracing'
complete -c moon -n "__fish_moon_using_subcommand test" -s u -l update -d 'Update the test snapshot'
complete -c moon -n "__fish_moon_using_subcommand test" -l frozen -d 'Do not sync dependencies, assuming local dependencies are up-to-date'
complete -c moon -n "__fish_moon_using_subcommand test" -l build-only -d 'Only build, do not run the tests'
complete -c moon -n "__fish_moon_using_subcommand test" -l no-parallelize -d 'Run the tests in a target backend sequentially'
complete -c moon -n "__fish_moon_using_subcommand test" -l test-failure-json -d 'Print failure message in JSON format'
complete -c moon -n "__fish_moon_using_subcommand test" -l doc -d 'Run doc test'
complete -c moon -n "__fish_moon_using_subcommand test" -l md -d 'Run test in markdown file'
complete -c moon -n "__fish_moon_using_subcommand test" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand test" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand test" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand test" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand test" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand test" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l target -d 'Select output target' -r -f -a "{wasm\t'',wasm-gc\t'',js\t'',native\t'',llvm\t'',all\t''}"
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l warn-list -d 'Warn list config' -r
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l alert-list -d 'Alert list config' -r
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -s j -l jobs -d 'Set the max number of jobs to run in parallel' -r
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -s p -l package -d 'The paths of the packages' -r
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l coverage-package-override -d 'Override coverage package name; `@self` is a special value that means the package itself' -r
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l driver-kind -d 'The test driver kind' -r -f -a "{internal\t'',whitebox\t'',blackbox\t''}"
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l patch-file -d 'Path to the patch file' -r -F
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l mode -r
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l single-test-file -d 'Path to the single test file' -r -F
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l std -d 'Enable the standard library (default)'
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l nostd -d 'Disable the standard library'
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -s g -l debug -d 'Emit debug information'
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l release -d 'Compile in release mode'
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l strip -d 'Enable stripping debug information'
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l no-strip -d 'Disable stripping debug information'
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l serial -d 'Handle the selected targets sequentially'
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l enable-coverage -d 'Enable coverage instrumentation'
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l sort-input -d 'Sort input files'
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l output-wat -d 'Output WAT instead of WASM'
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -s d -l deny-warn -d 'Treat all warnings as errors'
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l no-render -d 'Don\'t render diagnostics from moonc (don\'t pass \'-error-format json\' to moonc)'
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l enable-value-tracing -d 'Enable value tracing'
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand generate-test-driver" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand clean" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand clean" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand clean" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand clean" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand clean" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand clean" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand clean" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand clean" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand fmt" -l block-style -d 'Add separator between each segments' -r -f -a "{false\t'',true\t''}"
complete -c moon -n "__fish_moon_using_subcommand fmt" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand fmt" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand fmt" -l check -d 'Check only and don\'t change the source code'
complete -c moon -n "__fish_moon_using_subcommand fmt" -l sort-input -d 'Sort input files'
complete -c moon -n "__fish_moon_using_subcommand fmt" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand fmt" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand fmt" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand fmt" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand fmt" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand fmt" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand doc" -s b -l bind -d 'The address of the server' -r
complete -c moon -n "__fish_moon_using_subcommand doc" -s p -l port -d 'The port of the server' -r
complete -c moon -n "__fish_moon_using_subcommand doc" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand doc" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand doc" -l serve -d 'Start a web server to serve the documentation'
complete -c moon -n "__fish_moon_using_subcommand doc" -l frozen -d 'Do not sync dependencies, assuming local dependencies are up-to-date'
complete -c moon -n "__fish_moon_using_subcommand doc" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand doc" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand doc" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand doc" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand doc" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand doc" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand info" -l target -d 'Select output target' -r -f -a "{wasm\t'',wasm-gc\t'',js\t'',native\t'',llvm\t'',all\t''}"
complete -c moon -n "__fish_moon_using_subcommand info" -s p -l package -d 'only emit mbti files for the specified package' -r
complete -c moon -n "__fish_moon_using_subcommand info" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand info" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand info" -l frozen -d 'Do not sync dependencies, assuming local dependencies are up-to-date'
complete -c moon -n "__fish_moon_using_subcommand info" -l no-alias -d 'Do not use alias to shorten package names in the output'
complete -c moon -n "__fish_moon_using_subcommand info" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand info" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand info" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand info" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand info" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand info" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand bench" -l target -d 'Select output target' -r -f -a "{wasm\t'',wasm-gc\t'',js\t'',native\t'',llvm\t'',all\t''}"
complete -c moon -n "__fish_moon_using_subcommand bench" -l warn-list -d 'Warn list config' -r
complete -c moon -n "__fish_moon_using_subcommand bench" -l alert-list -d 'Alert list config' -r
complete -c moon -n "__fish_moon_using_subcommand bench" -s j -l jobs -d 'Set the max number of jobs to run in parallel' -r
complete -c moon -n "__fish_moon_using_subcommand bench" -s p -l package -d 'Run test in the specified package' -r
complete -c moon -n "__fish_moon_using_subcommand bench" -s f -l file -d 'Run test in the specified file. Only valid when `--package` is also specified' -r
complete -c moon -n "__fish_moon_using_subcommand bench" -s i -l index -d 'Run only the index-th test in the file. Only valid when `--file` is also specified' -r
complete -c moon -n "__fish_moon_using_subcommand bench" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand bench" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand bench" -l std -d 'Enable the standard library (default)'
complete -c moon -n "__fish_moon_using_subcommand bench" -l nostd -d 'Disable the standard library'
complete -c moon -n "__fish_moon_using_subcommand bench" -s g -l debug -d 'Emit debug information'
complete -c moon -n "__fish_moon_using_subcommand bench" -l release -d 'Compile in release mode'
complete -c moon -n "__fish_moon_using_subcommand bench" -l strip -d 'Enable stripping debug information'
complete -c moon -n "__fish_moon_using_subcommand bench" -l no-strip -d 'Disable stripping debug information'
complete -c moon -n "__fish_moon_using_subcommand bench" -l serial -d 'Handle the selected targets sequentially'
complete -c moon -n "__fish_moon_using_subcommand bench" -l enable-coverage -d 'Enable coverage instrumentation'
complete -c moon -n "__fish_moon_using_subcommand bench" -l sort-input -d 'Sort input files'
complete -c moon -n "__fish_moon_using_subcommand bench" -l output-wat -d 'Output WAT instead of WASM'
complete -c moon -n "__fish_moon_using_subcommand bench" -s d -l deny-warn -d 'Treat all warnings as errors'
complete -c moon -n "__fish_moon_using_subcommand bench" -l no-render -d 'Don\'t render diagnostics from moonc (don\'t pass \'-error-format json\' to moonc)'
complete -c moon -n "__fish_moon_using_subcommand bench" -l enable-value-tracing -d 'Enable value tracing'
complete -c moon -n "__fish_moon_using_subcommand bench" -l frozen -d 'Do not sync dependencies, assuming local dependencies are up-to-date'
complete -c moon -n "__fish_moon_using_subcommand bench" -l build-only -d 'Only build, do not bench'
complete -c moon -n "__fish_moon_using_subcommand bench" -l no-parallelize -d 'Run the benchmarks in a target backend sequentially'
complete -c moon -n "__fish_moon_using_subcommand bench" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand bench" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand bench" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand bench" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand bench" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand bench" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand add" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand add" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand add" -l bin -d 'Whether to add the dependency as a binary'
complete -c moon -n "__fish_moon_using_subcommand add" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand add" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand add" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand add" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand add" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand add" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand remove" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand remove" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand remove" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand remove" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand remove" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand remove" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand remove" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand remove" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand install" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand install" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand install" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand install" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand install" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand install" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand install" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand install" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand tree" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand tree" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand tree" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand tree" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand tree" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand tree" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand tree" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand tree" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand login" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand login" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand login" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand login" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand login" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand login" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand login" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand login" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand register" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand register" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand register" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand register" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand register" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand register" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand register" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand register" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand publish" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand publish" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand publish" -l frozen -d 'Do not sync dependencies, assuming local dependencies are up-to-date'
complete -c moon -n "__fish_moon_using_subcommand publish" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand publish" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand publish" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand publish" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand publish" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand publish" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand package" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand package" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand package" -l frozen -d 'Do not sync dependencies, assuming local dependencies are up-to-date'
complete -c moon -n "__fish_moon_using_subcommand package" -l list
complete -c moon -n "__fish_moon_using_subcommand package" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand package" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand package" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand package" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand package" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand package" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand update" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand update" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand update" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand update" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand update" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand update" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand update" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand update" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand coverage; and not __fish_seen_subcommand_from report clean help" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand coverage; and not __fish_seen_subcommand_from report clean help" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand coverage; and not __fish_seen_subcommand_from report clean help" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand coverage; and not __fish_seen_subcommand_from report clean help" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand coverage; and not __fish_seen_subcommand_from report clean help" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand coverage; and not __fish_seen_subcommand_from report clean help" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand coverage; and not __fish_seen_subcommand_from report clean help" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand coverage; and not __fish_seen_subcommand_from report clean help" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand coverage; and not __fish_seen_subcommand_from report clean help" -f -a "report" -d 'Generate code coverage report'
complete -c moon -n "__fish_moon_using_subcommand coverage; and not __fish_seen_subcommand_from report clean help" -f -a "clean" -d 'Clean up coverage artifacts'
complete -c moon -n "__fish_moon_using_subcommand coverage; and not __fish_seen_subcommand_from report clean help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c moon -n "__fish_moon_using_subcommand coverage; and __fish_seen_subcommand_from report" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand coverage; and __fish_seen_subcommand_from report" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand coverage; and __fish_seen_subcommand_from report" -s h -l help -d 'Show help for the coverage utility'
complete -c moon -n "__fish_moon_using_subcommand coverage; and __fish_seen_subcommand_from report" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand coverage; and __fish_seen_subcommand_from report" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand coverage; and __fish_seen_subcommand_from report" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand coverage; and __fish_seen_subcommand_from report" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand coverage; and __fish_seen_subcommand_from report" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand coverage; and __fish_seen_subcommand_from clean" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand coverage; and __fish_seen_subcommand_from clean" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand coverage; and __fish_seen_subcommand_from clean" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand coverage; and __fish_seen_subcommand_from clean" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand coverage; and __fish_seen_subcommand_from clean" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand coverage; and __fish_seen_subcommand_from clean" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand coverage; and __fish_seen_subcommand_from clean" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand coverage; and __fish_seen_subcommand_from clean" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand coverage; and __fish_seen_subcommand_from help" -f -a "report" -d 'Generate code coverage report'
complete -c moon -n "__fish_moon_using_subcommand coverage; and __fish_seen_subcommand_from help" -f -a "clean" -d 'Clean up coverage artifacts'
complete -c moon -n "__fish_moon_using_subcommand coverage; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c moon -n "__fish_moon_using_subcommand generate-build-matrix" -s n -d 'Set all of `drow`, `dcol`, `mrow`, `mcol` to the same value' -r
complete -c moon -n "__fish_moon_using_subcommand generate-build-matrix" -l drow -d 'Number of directory rows' -r
complete -c moon -n "__fish_moon_using_subcommand generate-build-matrix" -l dcol -d 'Number of directory columns' -r
complete -c moon -n "__fish_moon_using_subcommand generate-build-matrix" -l mrow -d 'Number of module rows' -r
complete -c moon -n "__fish_moon_using_subcommand generate-build-matrix" -l mcol -d 'Number of module columns' -r
complete -c moon -n "__fish_moon_using_subcommand generate-build-matrix" -s o -l output-dir -d 'The output directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand generate-build-matrix" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand generate-build-matrix" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand generate-build-matrix" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand generate-build-matrix" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand generate-build-matrix" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand generate-build-matrix" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand generate-build-matrix" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand generate-build-matrix" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand query" -l target -d 'Select output target' -r -f -a "{wasm\t'',wasm-gc\t'',js\t'',native\t'',llvm\t'',all\t''}"
complete -c moon -n "__fish_moon_using_subcommand query" -l warn-list -d 'Warn list config' -r
complete -c moon -n "__fish_moon_using_subcommand query" -l alert-list -d 'Alert list config' -r
complete -c moon -n "__fish_moon_using_subcommand query" -s j -l jobs -d 'Set the max number of jobs to run in parallel' -r
complete -c moon -n "__fish_moon_using_subcommand query" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand query" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand query" -l std -d 'Enable the standard library (default)'
complete -c moon -n "__fish_moon_using_subcommand query" -l nostd -d 'Disable the standard library'
complete -c moon -n "__fish_moon_using_subcommand query" -s g -l debug -d 'Emit debug information'
complete -c moon -n "__fish_moon_using_subcommand query" -l release -d 'Compile in release mode'
complete -c moon -n "__fish_moon_using_subcommand query" -l strip -d 'Enable stripping debug information'
complete -c moon -n "__fish_moon_using_subcommand query" -l no-strip -d 'Disable stripping debug information'
complete -c moon -n "__fish_moon_using_subcommand query" -l serial -d 'Handle the selected targets sequentially'
complete -c moon -n "__fish_moon_using_subcommand query" -l enable-coverage -d 'Enable coverage instrumentation'
complete -c moon -n "__fish_moon_using_subcommand query" -l sort-input -d 'Sort input files'
complete -c moon -n "__fish_moon_using_subcommand query" -l output-wat -d 'Output WAT instead of WASM'
complete -c moon -n "__fish_moon_using_subcommand query" -s d -l deny-warn -d 'Treat all warnings as errors'
complete -c moon -n "__fish_moon_using_subcommand query" -l no-render -d 'Don\'t render diagnostics from moonc (don\'t pass \'-error-format json\' to moonc)'
complete -c moon -n "__fish_moon_using_subcommand query" -l enable-value-tracing -d 'Enable value tracing'
complete -c moon -n "__fish_moon_using_subcommand query" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand query" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand query" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand query" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand query" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand query" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand upgrade" -l base-url -r
complete -c moon -n "__fish_moon_using_subcommand upgrade" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand upgrade" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand upgrade" -s f -l force -d 'Force upgrade'
complete -c moon -n "__fish_moon_using_subcommand upgrade" -l dev -d 'Install the latest development version'
complete -c moon -n "__fish_moon_using_subcommand upgrade" -l non-interactive
complete -c moon -n "__fish_moon_using_subcommand upgrade" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand upgrade" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand upgrade" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand upgrade" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand upgrade" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand upgrade" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand shell-completion" -l shell -d 'The shell to generate completion for' -r -f -a "{bash\t'',elvish\t'',fish\t'',powershell\t'',zsh\t''}"
complete -c moon -n "__fish_moon_using_subcommand shell-completion" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand shell-completion" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand shell-completion" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand shell-completion" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand shell-completion" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand shell-completion" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand shell-completion" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand shell-completion" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand version" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand version" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand version" -l all -d 'Print all version information'
complete -c moon -n "__fish_moon_using_subcommand version" -l json -d 'Print version information in JSON format'
complete -c moon -n "__fish_moon_using_subcommand version" -l no-path -d 'Do not print the path'
complete -c moon -n "__fish_moon_using_subcommand version" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand version" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand version" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand version" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand version" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand version" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand tool; and not __fish_seen_subcommand_from format-and-diff embed help" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand tool; and not __fish_seen_subcommand_from format-and-diff embed help" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand tool; and not __fish_seen_subcommand_from format-and-diff embed help" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand tool; and not __fish_seen_subcommand_from format-and-diff embed help" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand tool; and not __fish_seen_subcommand_from format-and-diff embed help" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand tool; and not __fish_seen_subcommand_from format-and-diff embed help" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand tool; and not __fish_seen_subcommand_from format-and-diff embed help" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand tool; and not __fish_seen_subcommand_from format-and-diff embed help" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand tool; and not __fish_seen_subcommand_from format-and-diff embed help" -f -a "format-and-diff" -d 'Format the code and print the difference'
complete -c moon -n "__fish_moon_using_subcommand tool; and not __fish_seen_subcommand_from format-and-diff embed help" -f -a "embed"
complete -c moon -n "__fish_moon_using_subcommand tool; and not __fish_seen_subcommand_from format-and-diff embed help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from format-and-diff" -l old -d 'The source path of the code which needs to be formatted' -r -F
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from format-and-diff" -l new -d 'The target path of the formatted code' -r -F
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from format-and-diff" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from format-and-diff" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from format-and-diff" -l block-style -d 'Add separator between each segments'
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from format-and-diff" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from format-and-diff" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from format-and-diff" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from format-and-diff" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from format-and-diff" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from format-and-diff" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from embed" -s i -l input -r -F
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from embed" -s o -l output -r -F
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from embed" -l name -r
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from embed" -s C -l directory -d 'The source code directory. Defaults to the current directory' -r -F
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from embed" -l target-dir -d 'The target directory. Defaults to `source_dir/target`' -r -F
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from embed" -l binary
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from embed" -l text
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from embed" -l timestamp
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from embed" -s q -l quiet -d 'Suppress output'
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from embed" -s v -l verbose -d 'Increase verbosity'
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from embed" -l trace -d 'Trace the execution of the program'
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from embed" -l dry-run -d 'Do not actually run the command'
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from embed" -l build-graph -d 'Generate build graph'
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from embed" -s h -l help -d 'Print help'
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from help" -f -a "format-and-diff" -d 'Format the code and print the difference'
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from help" -f -a "embed"
complete -c moon -n "__fish_moon_using_subcommand tool; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "new" -d 'Create a new MoonBit module'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "bundle" -d 'Bundle the module'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "build" -d 'Build the current package'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "check" -d 'Check the current package, but don\'t build object files'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "run" -d 'Run a main package'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "test" -d 'Test the current package'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "generate-test-driver" -d 'Generate tests for the provided packages'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "clean" -d 'Remove the target directory'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "fmt" -d 'Format source code'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "doc" -d 'Generate documentation'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "info" -d 'Generate public interface (`.mbti`) files for all packages in the module'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "bench" -d 'Run benchmarks in the current package'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "add" -d 'Add a dependency'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "remove" -d 'Remove a dependency'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "install" -d 'Install dependencies'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "tree" -d 'Display the dependency tree'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "login" -d 'Log in to your account'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "register" -d 'Register an account at mooncakes.io'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "publish" -d 'Publish the current module'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "package" -d 'Package the current module'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "update" -d 'Update the package registry index'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "coverage" -d 'Code coverage utilities'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "generate-build-matrix" -d 'Generate build matrix for benchmarking (legacy feature)'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "query"
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "upgrade" -d 'Upgrade toolchains'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "shell-completion" -d 'Generate shell completion for bash/elvish/fish/pwsh/zsh to stdout'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "version" -d 'Print version information and exit'
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "tool"
complete -c moon -n "__fish_moon_using_subcommand help; and not __fish_seen_subcommand_from new bundle build check run test generate-test-driver clean fmt doc info bench add remove install tree login register publish package update coverage generate-build-matrix query upgrade shell-completion version tool help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c moon -n "__fish_moon_using_subcommand help; and __fish_seen_subcommand_from coverage" -f -a "report" -d 'Generate code coverage report'
complete -c moon -n "__fish_moon_using_subcommand help; and __fish_seen_subcommand_from coverage" -f -a "clean" -d 'Clean up coverage artifacts'
complete -c moon -n "__fish_moon_using_subcommand help; and __fish_seen_subcommand_from tool" -f -a "format-and-diff" -d 'Format the code and print the difference'
complete -c moon -n "__fish_moon_using_subcommand help; and __fish_seen_subcommand_from tool" -f -a "embed"


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