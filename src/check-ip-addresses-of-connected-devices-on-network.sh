#!/bin/sh
USAGE="$0 FIRST_IP LAST_IP
FIRST_IP=first IP address in range
LAST_IP=last IP address in range"
FIRST_IP=${1:-$1}
LAST_IP=${2:-$2}

usage()
{
	echo "$USAGE"
    exit 1
}

dotted_decimal_to_integer()
{
	IFS="." read octet_24 octet_16 octet_8 octet_1 <<< `echo $1`
	expr $(( (octet_24 << 24) + (octet_16 << 16) + (octet_8 << 8) + octet_1 ))
}

integer_to_dotted_decimal()
{
	local IP=$1
	let octet_24=$((IP >> 24 & 255))
	let octet_16=$((IP >> 16 & 255))
	let octet_8=$((IP >> 8 & 255))
	let octet_1=$((IP & 255))
	echo "${octet_24}.${octet_16}.${octet_8}.${octet_1}"
}

if [ "$#" -lt 2 ]
then
	usage
fi

echo "Pinging all network devices from $FIRST_IP to $LAST_IP:"

IP_RANGE_START=$(dotted_decimal_to_integer $FIRST_IP)
IP_RANGE_END=$(dotted_decimal_to_integer $LAST_IP)

for IP in `seq $IP_RANGE_START $IP_RANGE_END`
do
	( ping -c1 -w1 ${IP} > /dev/null 2>&1 && integer_to_dotted_decimal ${IP} ) &
done
wait
