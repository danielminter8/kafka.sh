# Usage: ./produce.sh <topic> <limit>
if ! command -v jq --version; then
    echo "jq is not installed. Installing..."
    brew install jq
fi

# Function to display script usage
function usage {
    echo "Usage: $0 [-t topic] [-d data] [-l limit]"
    echo "  -t      Specify the topic"
    echo "  -d      Specify the data.json"
    echo "  -l      Specify the limit"
    exit 1
}

topic=""
data=""
limit=""

# Process command-line options using getopts
while getopts ":vf:t:d:l:" opt; do
    case $opt in
        t)
            topic="$OPTARG"
            ;;
        d)
            data="$OPTARG"
            ;;
        l)
            limit="$OPTARG"
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            usage
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            usage
            ;;
    esac
done

# Shift the command-line arguments to exclude processed options
shift $((OPTIND - 1))

echo "Topic: $topic"
echo "Data: $data"
echo "Limit: $limit"

generate_uuid() {
  uuidgen | tr '[:upper:]' '[:lower:]'
}

# Retrieve JSON data
limited_array=$(jq ".[:$limit]" "$data")

# Use quotes around the URL to handle potential special characters
url="http://localhost:8082/topics/$topic"

curl -X POST \
     -H "Content-Type: application/vnd.kafka.json.v2+json" \
     -H "Accept: application/vnd.kafka.v2+json" \
     --data "{\"records\":[$updated_data]}" \
     "$url"