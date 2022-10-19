# Checks for and installs all dependencies for chuck_cow.sh.
# TODO: Handle CentOS as well.
# TODO: Check for jq (https://stedolan.github.io/jq/)

uname_response=$(uname -a)

# Checks the system architecture, and sets $OS accordingly.
get_architecture () {
    if [[ "$uname_response" == *"Darwin"* ]]; then
        OS="MAC"
    elif [[ "$uname_response" == *"Linux"* ]]; then
        OS="LINUX"
    else
        OS="UNKNOWN"
    fi
    if [[ $OS == "UNKNOWN" ]]; then
        echo "Well, we /were/ going to install cowsay."
        echo "Here's hoping you have cowsay, curl, and jq!"
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
        if [[ "$uname_response" == *"Ubuntu"* ]]; then
            dpkg -s cowsay > /dev/null 2>&1
            status=$(echo $?)
            if [[ $status == "1" ]]; then
                sudo apt-get -y install cowsay > /dev/null 2>&1
            fi
        else
            echo "We're currently only installing for Ubuntu & Darwin."
            echo "Please check back later for updates."
        fi
    fi
}

# Figures out if jq is installed, and installs if not.
check_jq () {
    if [[ $1 == "MAC" ]]; then
        brew list -q jq > /dev/null 2>&1
        status=$(echo $?)
        if [[ $status == "1" ]]; then
            brew install jq > /dev/null
        fi
    elif [[ $1 == "LINUX" ]]; then
        if [[ "$uname_response" == *"Ubuntu"* ]]; then
            dpkg -s jq > /dev/null 2>&1
            status=$(echo $?)
            if [[ $status == "1" ]]; then
                sudo apt-get -y install jq > /dev/null 2>&1
            fi
        else
            echo "We're currently only installing for Ubuntu & Darwin."
            echo "Please check back later for updates."
        fi
    fi
}
