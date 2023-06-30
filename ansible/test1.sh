          status="false"
          count=0
          while [[ "$status" != "true" && $count -lt 60 ]]; do
            sleep 60
            response=$(curl -s -X POST -H "Content-Type: application/json" -d '{"method":"eth_syncing","params":[],"id":1,"jsonrpc":"2.0"}' http://134.209.152.184:8545)
            result=$(echo "$response" | jq -r '.result')
            if [[ "$result" == "false" ]]; then
              status="true"
            fi
            echo "Iteration: $count, Status: $status"
            ((count++))
          done
