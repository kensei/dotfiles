#!/bin/sh

### CPU 使用率（%）
CPU=$(top -l 1 | awk '/CPU usage/ {printf "%.0f", $3+$5}')

### メモリ使用率（%）
MEM=$(vm_stat | awk '
/Pages free/ {free=$3}
/Pages active/ {active=$3}
/Pages inactive/ {inactive=$3}
/Pages speculative/ {spec=$3}
/Pages wired down/ {wired=$4}
END {
  used = active+inactive+spec+wired
  total = used+free
  printf "%.0f", used/total*100
}')

### ネットワーク種別（lan / wifi / none）
IFACE=$(route get default 2>/dev/null | awk '/interface:/{print $2}')

NET="none"
if [ -n "$IFACE" ]; then
  if networksetup -listallhardwareports | grep -B1 "$IFACE" | grep -qi "Wi-Fi"; then
    NET="wifi"
  else
    NET="lan"
  fi
fi

### VPN 状態（vpn / none）
VPN="none"
#if ifconfig | grep -q "utun"; then
if ifconfig | grep "utun" | awk '{ print $1 }' | grep utun | sed "s/://" | xargs -I{} ifconfig {} | grep -qe "-->"; then
  VPN="vpn"
fi

NETWORK="$NET - $VPN"

### バッテリー状態
PMSET=$(pmset -g batt)
if echo "$PMSET" | grep -q "AC Power"; then
  BAT="adapter"
else
  BAT=$(echo "$PMSET" | awk -F';' '/%/{gsub(/ /,"");print $2}')
fi

### 出力（" / " 区切り）
echo "cpu ${CPU}% / mem ${MEM}% / net ${NETWORK} / batt ${BAT}"
