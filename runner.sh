GITHUB_TOKEN="$1"
REPO="$2"
TEMP_FILE="temp.json"

curl \
    --silent \
    --location \
    --request GET \
    --header 'Accept: application/vnd.github.everest-preview+json' \
    --header 'Content-Type: application/json' \
    --header "Authorization: token $GITHUB_TOKEN" \
    --header 'cache-control: no-cache' \
    "https://api.github.com/repos/${REPO}/actions/runs?per_page=2" > $TEMP_FILE

STATUS=$(jq -r ".workflow_runs | .[0] | .status" $TEMP_FILE)

echo $STATUS
rm $TEMP_FILE
