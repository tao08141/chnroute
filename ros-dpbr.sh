#!/bin/sh
mkdir -p ./pbr
cd ./pbr

# AS4809 BGP
wget --no-check-certificate -c -O CN.txt https://raw.githubusercontent.com/Hackl0us/GeoIP2-CN/release/CN-ip-cidr.txt

{
echo "/ip firewall address-list"

for net in $(cat CN.txt) ; do
  if [ -n "$net" ]; then
    echo "add list=CN address=$net comment=CNIP"
  fi
done

} > ../CN.rsc

cd ..
rm -rf ./pbr
