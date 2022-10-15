# Pull everything together here. 
# TODO: Do something different if $OS is "UNKNOWN"

source chuck_norris.sh
source variables.sh
source check_dependencies.sh

main () {
    check_cowsay $OS
    get_joke $JOKE
    cowsay $RESPONSE
}

main