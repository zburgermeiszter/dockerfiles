#!/bin/sh

# Credits: https://gist.github.com/siriulx/5cd60701949a52d8d1cfb83496bdc820#file-udocf-sh

CF_API=https://api.cloudflare.com/client/v4
PUBLIC_IP_V4=$(curl -s http://ipv4.icanhazip.com)

writeLog() {
    echo $(date -u "+%Y-%m-%dT%H:%M:%SZ") $@
}


getZone() {
    ZONE_ID=$(curl --fail -sX GET "${CF_API}/zones/?name=${CF_ROOT_DOMAIN}" \
                   -H "X-Auth-Key:${CF_API_KEY}" \
                   -H "X-Auth-Email:${CF_AUTH_EMAIL}" \
                   -H "Content-Type: application/json" | jq -r .result[0].id)
    writeLog "DNS zone ID:" ${ZONE_ID}
}

getRecords() {
    local result=$(curl -sX GET "${CF_API}/zones/${ZONE_ID}/dns_records?type=A&name=${CF_RECORD}&page=1&per_page=20&order=type&direction=desc&match=all" \
                        -H "X-Auth-Key:${CF_API_KEY}" \
                        -H "X-Auth-Email:${CF_AUTH_EMAIL}" \
                        -H "Content-Type: application/json")
    RID=$(echo ${result} | jq -r '.result[].id')
    CF_OIP=$(echo ${result} | jq -r '.result[0].content')
    writeLog "DNS record ID:" ${RID}
}

updateRecord() {
    writeLog "Updating DNS A Record for" ${CF_RECORD} "From:" ${CF_OIP} "To:" ${PUBLIC_IP_V4}
    local result=$(curl -sX PUT "${CF_API}/zones/${ZONE_ID}/dns_records/${RID}" \
                        -H "X-Auth-Key:${CF_API_KEY}" \
                        -H "X-Auth-Email:${CF_AUTH_EMAIL}" \
                        -H "Content-Type: application/json" \
                        --data "$(printf '{"id":"%s","type":"A","name":"%s","content":"%s","ttl":1}' $RID $CF_RECORD $PUBLIC_IP_V4)")
    writeLog "success:" $(echo ${result} | jq -r '.success')
}

run(){
    getZone
    getRecords
    updateRecord
}

run
