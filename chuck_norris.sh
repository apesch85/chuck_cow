get_joke () {
    RESPONSE=$(curl -s https://api.chucknorris.io/jokes/random | jq -r $1)
}
