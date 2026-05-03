#!/opt/homebrew/bin/fish
set -e

set env_file /etc/newt/newt.env
if not test -f "$env_file"
    echo "Missing $env_file" >&2
    exit 1
end

while read -l line
    set line (string trim -- $line)
    if test -z "$line"
        continue
    end
    if string match -qr '^#' -- $line
        continue
    end
    set parts (string split -m 1 '=' -- $line)
    if test (count $parts) -lt 2
        continue
    end
    set key (string trim -- $parts[1])
    set value (string trim -- $parts[2])
    set value (string trim -c '"' -- $value)
    set value (string trim -c "'" -- $value)
    set -gx $key "$value"
end < "$env_file"

exec /usr/local/bin/newt
