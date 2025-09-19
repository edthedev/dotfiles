gh project item-list 10 --owner techservicesillinois --format json | jq '.items[] | select(.status == "In Progress") | .title'
