script_help()
{
    local script="${1:-${0}}"
    local header="${2:-Usage}"
    local footer="${3:-Report}"

    if [[ ! -f "${script}" ]]; then
        return 1;
    fi

    sed -E 's/^#\s?(.*)/\1/g' "${script}" |
        sed -nE "/^${header}/,/^${footer}/p" |
        sed "s/{script}/$(basename "${script}")/g"
}
