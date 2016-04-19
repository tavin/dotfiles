# .bash_functions

function re {
    local d f
    f=${1?}
    shift
    while read -r d; do
        (set -x; cd "$d" && "$@")
        echo
    done < "$f"
}

function remvn {
    local d
    for d in *; do
        if test -d "$d" -a -f "$d/pom.xml"; then
            (set -x; cd "$d" && mvn "$@")
            echo
        fi
    done
}

function resvn {
    local d
    for d in *; do
        if test -d "$d" -a -e "$d/.svn"; then
            (set -x; cd "$d" && svn "$@")
            echo
        fi
    done
}

function regit {
    local d
    for d in *; do
        if test -d "$d" -a -e "$d/.git"; then
            (set -x; cd "$d" && git "$@")
            echo
        fi
    done
}

