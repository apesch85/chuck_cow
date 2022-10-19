# Gets a Chuck Norris joke. This script could eventually incorporate other 
# stuff as well. 

get_joke () {
    JOKE=$(curl -s https://api.chucknorris.io/jokes/random | jq -r $1)
}
