function repo_root --argument-names script_path
    set -l script_dir (cd (dirname $script_path); and pwd)
    cd $script_dir/..
    pwd
end

function load_dotenv --argument-names env_file
    if not test -f "$env_file"
        return 0
    end

    while read -l line
        set line (string trim -- $line)

        if test -z "$line"
            continue
        end

        if string match -qr '^#' -- $line
            continue
        end

        set -l parts (string split -m 1 '=' -- $line)
        if test (count $parts) -lt 2
            continue
        end

        set -l key (string trim -- $parts[1])
        set -l value (string trim -- $parts[2])
        set value (string trim -c '"' -- $value)
        set value (string trim -c "'" -- $value)

        set -gx $key "$value"
    end < "$env_file"
end

function require_command --argument-names cmd install_hint
    if command -q $cmd
        return 0
    end

    echo "$cmd not found. $install_hint" >&2
    return 1
end
