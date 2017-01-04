function hostip() {
    /sbin/ifconfig | grep "inet " | awk '{print $2}' | grep -v 127.0.0.1 | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/,/g'
}

# Allows kill a program by searching a string in process list (e.g. by parameter)
function akill() {
    program_name="$1"

    if [[ -z "${program_name// }" ]]; then
        (>&2 echo "Program name cannot be empty. Please provide program name in parameters.")
    else
        ps aux | grep -i "$program_name" | grep -v grep | awk '{print $2}' | xargs kill -9
    fi
}

# Allows check a program i/o by searching a string in process list (e.g. by parameter)
function ioproc {
    program_name="$1"
    echo "writes (MB): $1"
    ps aux | grep "$program_name" | awk '{print $2}' | xargs -I {} cat /proc/{}/io 2>/dev/null | grep '^write_bytes' | awk '{print $2/1024/1024}'
    echo
    echo "reads (MB): $1"
    ps aux | grep "$program_name" | awk '{print $2}' | xargs -I {} cat /proc/{}/io 2>/dev/null | grep '^read_bytes' | awk '{print $2/1024/1024}'
}

if [ -f ~/.gitautocomplete ]; then
	. ~/.gitautocomplete
fi

# load not public stuff
if [ -f ~/.slash/home/bash_aliases ]; then
    . ~/.slash/home/bash_aliases
fi
