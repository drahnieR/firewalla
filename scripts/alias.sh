#!/bin/bash

alias sudo='sudo '
alias apt='/home/pi/firewalla/scripts/apt.sh'
alias apt-get='/home/pi/firewalla/scripts/apt.sh'
alias tsys='sudo tail -F /var/log/syslog'
alias t0='tail -F ~/.forever/main.log'
alias t00='tail -F ~/.forever/*.log'
alias t1='tail -F ~/.forever/kickui.log'
alias t2='tail -F ~/.forever/monitor.log'
alias t3='tail -F ~/.forever/api.log'
alias t4='tail -F ~/.forever/blue.log'
alias t5='tail -F ~/.forever/firereset.log'
alias t6='tail -F ~/.forever/router.log'
alias t7='tail -F ~/.forever/fwapc.log'
alias t8='tail -F ~/.forever/dap.log'
alias tt0='tail -F ~/logs/FireMain.log'
alias tt00='tail -F ~/logs/Fire*.log'
alias tt1='tail -F ~/logs/FireKick.log'
alias tt2='tail -F ~/logs/FireMon.log'
alias tt3='tail -F ~/logs/FireApi.log'
alias l0='less -R ~/.forever/main.log'
alias l1='less -R ~/.forever/kickui.log'
alias l2='less -R ~/.forever/monitor.log'
alias l3='less -R ~/.forever/api.log'
alias l4='less -R ~/.forever/blue.log'
alias l5='less -R ~/.forever/firereset.log'
alias l6='less -R ~/.forever/router.log'
alias l7='less -R ~/.forever/fwapc.log'
alias l8='less -R ~/.forever/dap.log'

alias frr='forever restartall'
alias fr0='forever restart 0'
alias fr1='forever restart 1'
alias fr2='forever restart 2'
alias fr3='forever restart 3'
alias sr00='sudo systemctl restart fire{main,kick,mon,api}'
alias sr0='sudo systemctl restart firemain'
alias sr1='sudo systemctl restart firekick'
alias sr2='sudo systemctl restart firemon'
alias sr3='touch /home/pi/.firewalla/managed_reboot; sudo systemctl restart fireapi'
alias sr4='sudo systemctl restart firehttpd'
alias sr5='sudo systemctl restart firereset'
alias sr6='sudo systemctl restart firerouter; source /home/pi/firerouter/bin/common; init_network_config'
alias sr7='sudo systemctl restart fwapc'
alias sr8='sudo systemctl restart fwdap'
alias srb4='sudo systemctl restart bitbridge4'
alias srb6='sudo systemctl restart bitbridge6'
alias ss7='sudo systemctl stop frpc.support.service'
alias sr4='sudo systemctl restart firehttpd'
alias fufu='sudo -u pi git fetch origin $branch && sudo -u pi git reset --hard FETCH_HEAD'
alias node='/home/pi/firewalla/bin/node'
alias fuc='/home/pi/firewalla/scripts/fireupgrade_check.sh'
alias fruc='/home/pi/firerouter/scripts/firerouter_upgrade_check.sh'
alias srr='/home/pi/firewalla/scripts/main-run'
alias srrr='/home/pi/firewalla/scripts/fireupgrade_check.sh'
alias ct0='/home/pi/firewalla/scripts/estimate_compatibility.sh'
alias rc='redis-cli'
alias frtestwan='curl -s localhost:8837/v1/config/wan/connectivity?live=true | jq .'
alias frwan='curl -s localhost:8837/v1/config/wans | jq .'
alias frbtup='redis-cli publish firereset.ble.control 1'
alias fstatus='curl -s localhost:9966 | jq .'
alias noautofr='touch /home/pi/.router/config/.no_auto_upgrade'
alias noautofw='touch /home/pi/.firewalla/config/.no_auto_upgrade'

function ll0 {
  redis-cli publish "TO.FireMain" '{"type":"ChangeLogLevel", "name":"'${1:-*}'", "toProcess":"FireMain", "level":"'${2:-info}'"}'
}
function ll1 {
  redis-cli publish "TO.FireKick" '{"type":"ChangeLogLevel", "name":"'${1:-*}'", "toProcess":"FireKick", "level":"'${2:-info}'"}'
}
function ll2 {
  redis-cli publish "TO.FireMon" '{"type":"ChangeLogLevel", "name":"'${1:-*}'", "toProcess":"FireMon", "level":"'${2:-info}'"}'
}
function ll3 {
  redis-cli publish "TO.FireApi" '{"type":"ChangeLogLevel", "name":"'${1:-*}'", "toProcess":"FireApi", "level":"'${2:-info}'"}'
}
function lld3 {
  redis-cli publish "TO.FireApi" '{"type":"ChangeLogLevel", "name":"'${1:-*}'", "toProcess":"FireApi", "level":"'${2:-debug}'"}'
}
function ll6 {
  redis-cli publish "TO.FireRouter" '{"type":"ChangeLogLevel", "name":"'${1:-*}'", "level":"'${2:-info}'"}'
}
alias rrci='redis-cli publish "TO.FireMain" "{\"type\":\"CloudReCheckin\", \"toProcess\":\"FireMain\"}"'
alias frcc='curl "http://localhost:8837/v1/config/active" 2>/dev/null | jq'
alias fapc='curl "http://localhost:8841/v1/config/active" 2>/dev/null | jq'
alias fapr='curl "http://localhost:8841/v1/config/runtime_info" 2>/dev/null | jq'

alias scc='curl https://raw.githubusercontent.com/firewalla/firewalla/master/scripts/sanity_check.sh 2>/dev/null | bash -s --'
alias cbd='curl https://raw.githubusercontent.com/firewalla/firewalla/master/scripts/check_ipdomain_block.sh 2>/dev/null | bash /dev/stdin --domain'
alias cbi='curl https://raw.githubusercontent.com/firewalla/firewalla/master/scripts/check_ipdomain_block.sh 2>/dev/null | bash /dev/stdin --ip'
alias sccf='curl https://raw.githubusercontent.com/firewalla/firewalla/master/scripts/sanity_check.sh 2>/dev/null | bash -s -- -f'
alias remote_speed_test='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias rst='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias frset='curl -X POST http://localhost:8837/v1/config/set -H "Content-Type:application/json"'
alias dusage='curl -s https://raw.githubusercontent.com/firewalla/firewalla/master/scripts/dataUsage.js | node -'
alias idresult='curl -s https://raw.githubusercontent.com/firewalla/firewalla/master/scripts/identificationResult.sh | bash -s --'

alias less='less -r'
alias ls='ls --color=auto'

export PS1='\[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] ($(redis-cli get groupName)) \$ '

alias powerup='source <(curl -s https://raw.githubusercontent.com/firewalla/firewalla/master/scripts/powerup.sh)'

alias addip='rc zadd ip_set_to_be_processed 0'

function mycat () {
  curl https://raw.githubusercontent.com/firewalla/firewalla/master/scripts/cat.js > /tmp/cat.js 2>/dev/null
  $FIREWALLA_HOME/bin/node /tmp/cat.js --device "$1"
}

function mycatip () {
  curl https://raw.githubusercontent.com/firewalla/firewalla/master/scripts/cat.js > /tmp/cat.js 2>/dev/null
  $FIREWALLA_HOME/bin/node /tmp/cat.js --ip "$1"
}

alias ggalpha='cd /home/firewalla; scripts/switch_branch.sh beta_7_0 && /home/pi/firewalla/scripts/main-run'

function ggsupport {
  SUPPORT_TOKEN=$1
  PORT=$2
  SERVER_PORT=${3:-10000}
  SERVER=${4:-support.firewalla.com}

echo "[common]
server_addr = $SERVER
server_port = $SERVER_PORT
privilege_token = $SUPPORT_TOKEN

[SSH$PORT]
type = tcp
local_ip = 127.0.0.1
local_port = 22
remote_port = $PORT
use_encryption = true" > ~/support.ini

/home/pi/firewalla/extension/frp/frpc.$(uname -m) -c ~/support.ini
}

function nd {
  local container=$1
  shift
  pid=$(sudo docker inspect -f '{{.State.Pid}}' ${container})
  sudo mkdir -p /var/run/netns/
  sudo ln -sfT /proc/$pid/ns/net /var/run/netns/$container
  sudo ip netns exec $container "$@"
}

alias dc='sudo docker-compose'
alias jdc='sudo journalctl -fu docker-compose@$(basename $(pwd))'
alias ssrb='curl https://raw.githubusercontent.com/firewalla/firewalla/master/scripts/show_syslog_reboots.sh 2>/dev/null | sudo bash -s --'
alias ssud='bash <(curl -fsSL https://raw.githubusercontent.com/firewalla/firewalla/master/scripts/sud.sh)'
alias sap='sudo wg show wg_ap'
alias lap='/home/pi/firewalla/scripts/list_ap_status.sh'
alias cap='CONNECT_AP=true /home/pi/firewalla/scripts/list_ap_status.sh'
alias las='/home/pi/firewalla/scripts/list_ap_stations.sh'
alias lss='/home/pi/firewalla/scripts/list_ap_ssids.sh'
alias ltopo='curl -s localhost:8841/v1/status/topology'
alias aprun='curl -s localhost:8841/v1/config/runtime_info | jq . | vi -'
alias tvpn='~/scripts/test_vpn.sh'
alias twan='curl -fsSL https://raw.githubusercontent.com/firewalla/firewalla/master/scripts/test_wan.sh | sudo bash -s --'
alias ttwan='sudo /home/pi/firewalla/scripts/test_wan.sh'

alias llas='curl https://raw.githubusercontent.com/firewalla/firewalla/master/scripts/list_ap_stations.sh -o /tmp/list_ap_stations.sh 2>/dev/null; bash /tmp/list_ap_stations.sh'

# view redis hash
function vh {
  echo | column -n 2>/dev/null && COLUMN_OPT='column -n' || COLUMN_OPT='column'

  local i=0
  (redis-cli -d $'\3' hgetall "$1"; printf $'\3') | while read -r -d $'\3' entry; do
    ((i++))
    echo -n "$entry"
    if ((i % 2)); then
      echo -en "\t"
    else
      echo ""
    fi
  done | $COLUMN_OPT -t
}

function local_fwapc_get() {
        curl -s -H 'Content-Type: application/json' -XGET http://127.0.0.1:8841/$1
}

function nearby() {
        if [[ "x$1" == "x" ]]; then
                echo usage: 'nearby <mac>'
                return 1
        fi
        local_fwapc_get "v1/status/nearby/$1" | jq .
}

function get_network_config() {
  redis-cli zrange history:networkConfig -$1 -$1 | jq -S .
}

function ncdiff() {
  i=${1:-1}
  vimdiff <(get_network_config $(($i+1))) <(get_network_config $i)
}

function lase() {
  local_fwapc_get "v1/event_history/$1?format=text" | jq -r '.[]'
}

function laseap() {
  local_fwapc_get "v1/event_history/$1?type=ap&format=text" | jq -r '.[]'
}

function lase10() {
  lase "$1" | head
}

function llap() {
  local_fwapc_get "v1/status/ap" | jq '.info[] | [.mac, .licenseUuid] | @tsv' -r
}

function useq() {
  local mac="$1"
  local seq="$2"
  frcc . | jq --arg mac "$mac" --arg seq "$seq" 'if .apc.assets | has($mac) then .apc.assets[$mac].sysConfig.seq = $seq else . end' | frset -d @-
}

function sapb() {
  local mac="$1"
  local branch="$2"
  curl 'http://localhost:8841/v1/control/switch_branch' -H 'Content-Type: application/json' -d "{\"uid\": \"$mac\", \"branch\": \"$branch\"}"
}

function lmove() {
  local mac="$1"
  local dst_bssid="$2"
  local payload=""
  if [[ "x$dst_bssid" == "x" ]]; then
    payload=$(jq -n --arg mac "$mac" '{"staMac": $mac}')
  else
    payload=$(jq -n --arg mac "$mac" --arg dst_bssid "$dst_bssid" '{"staMac": $mac, "dstBSSID": $dst_bssid}')
  fi
  echo $payload | curl -X POST --url http://127.0.0.1:8841/v1/control/steer_station --header 'content-type: application/json' --data @-
}

function lfmove() {
  local mac="$1"
  local dst_bssid="$2"
  local payload=""
  if [[ "x$dst_bssid" == "x" ]]; then
    payload=$(jq -n --arg mac "$mac" '{"staMac": $mac, "kickAsAlternative": true}')
  else
    payload=$(jq -n --arg mac "$mac" --arg dst_bssid "$dst_bssid" '{"staMac": $mac, "dstBSSID": $dst_bssid, "kickAsAlternative": true}')
  fi
  echo $payload | curl -X POST --url http://127.0.0.1:8841/v1/control/steer_station --header 'content-type: application/json' --data @-
}

alias lpair='curl localhost:8841/v1/runtime/pairing_stat -s | jq .'

function lastat() {
  local mac=$1
  local filter=$2

  if [[ "x$filter" == "x" ]]; then
    lase "$mac" | head -n 20 | tac | ~/firewalla/scripts/device_ap_connect.sh "$mac" | column -t --output-separator "      "
  else
    lase "$mac" | grep -- "$filter" | tac | ~/firewalla/scripts/device_ap_connect.sh "$mac" | column -t --output-separator "      "
  fi
}

# lap_patch <mac> <version>
function lap_patch() {
  local mac=$1
  local version=$2

  local payload=$(jq -n --arg mac "$mac" --arg version "$version" '{"uid": $mac, "version": $version}')
  curl -XPOST localhost:8841/v1/control/patch_version -d "$payload" -H "Content-Type:application/json"
}

function lap_support() {
  local mac=$1
  local payload=$(jq -n --arg mac "$mac" '{"uid": $mac}')
  curl 'http://localhost:8841/v1/control/support' -H 'Content-Type: application/json' -d "$payload"
}

alias dap='/home/pi/.firewalla/run/assets/dap'
alias fwapc='/home/pi/.firewalla/run/assets/fwapc'

function sef() {
  local featureName=$1
  if [[ "x$featureName" == "x" ]]; then
    echo "usage: sef <featureName>"
    return 1
  fi
  local payload=$(jq -n --arg featureName "$featureName" '{"featureName": $featureName}')
  curl 'http://localhost:8834/v1/encipher/simple?command=cmd&item=enableFeature' -H 'Content-Type: application/json' -d "$payload"
}

function sdf() {
  local featureName=$1
  if [[ "x$featureName" == "x" ]]; then
    echo "usage: sdf <featureName>"
    return 1
  fi
  local payload=$(jq -n --arg featureName "$featureName" '{"featureName": $featureName}')
  curl 'http://localhost:8834/v1/encipher/simple?command=cmd&item=disableFeature' -H 'Content-Type: application/json' -d "$payload"
}