# .bash_functions

function clean {
    local d
    for d in "$@"; do
        if test -f "$d/pom.xml"; then (set -x; mvn -f "$d/pom.xml" -B clean) || return
        else echo "! dunno how to clean $d" >&2; fi
    done
}

function re {
    local d f
    f=${1?}
    shift
    while read -r d; do (set -x; cd "$d" && "$@"); done < "$f"
}

function regit {
    local d
    for d in *; do [ -d "$d/.git" ] && (set -x; cd "$d" && git "$@"); done
}

function remvn {
    local d
    for d in *; do [ -f "$d/pom.xml" ] && (set -x; cd "$d" && mvn "$@"); done
}

function resvn {
    local d
    for d in *; do [ -d "$d/.svn" ] && set -- "$@" "$d"; done
    (set -x; svn "$@")
}

