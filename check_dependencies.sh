# Checks the system architecture, and sets $OS accordingly.
# TODO: Handle CentOS as well.
# TODO: Check for jq (https://stedolan.github.io/jq/)

uname_response=$(uname -a)

get_architecture () {
    if [[ "$uname_response" == *"Darwin"* ]]; then
        OS="MAC"
    elif [[ "$uname_response" == *"Linux"* ]]; then
        OS="LINUX"
    else
        OS="UNKNOWN"
    fi
}

# Figures out if cowsay is installed, and installs if not.
check_cowsay () {
    if [[ $1 == "MAC" ]]; then
        brew list -q cowsay > /dev/null 2>&1
        status=$(echo $?)
        if [[ $status == "1" ]]; then
            brew install cowsay > /dev/null
        fi
    elif [[ $1 == "LINUX" ]]; then
        dpkg -s cowsay > /dev/null 2>&1
        status=$(echo $?)
        if [[ $status == "1" ]]; then
            sudo apt-get -y install cowsay > /dev/null 2>&1
        fi
    fi
}

