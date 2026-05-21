function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	# Use sympop yazi with separate config (includes symbol preview plugin)
	XDG_CONFIG_HOME="$HOME/.config/yazi-sympop" /Users/zach/Documents/zv/projects/design/app/sympop/target/release/yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
