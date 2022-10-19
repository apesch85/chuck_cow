# Pull everything together here. 
# TODO: Do something different if $OS is "UNKNOWN"

source chuck_norris.sh
source variables.sh
source dieselnator.sh
source check_dependencies.sh

main () {
    check_cowsay $OS
    check_jq $OS
    get_joke $VALUE
    dieselfy "$JOKE"
    cowsay $JOKE
}

main
