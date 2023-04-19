#!/bin/bash
#
# Simulates a low bandwidth, high-latency network connection
# Requires a Linux operating system with the 'tc' traffic control tool
#

VERSION=1.0.2
device=$(route | grep default | awk '{print $8}')
bandwidth=10kbps
latency=0ms
packetloss=0
command=slow
retcode=0
PATH=/sbin:/bin:/usr/sbin:/usr/bin

if ! which tc > /dev/null; then
  echo "Aborting: No 'tc' iptables firewall traffic conditioner found" 1>&2
  echo "This requires the Linux iptables firewall." 1>&2
  exit 1
fi

if [ $EUID -ne 0 ]; then
  echo "Aborting: you must run this as root."
  exit 2
fi

# Option processing courtesy of Stack Overflow question
# http://stackoverflow.com/questions/402377/using-getopts-in-bash-shell-script-to-get-long-and-short-command-line-options/7680682#7680682
# Questioner: gagneet http://stackoverflow.com/users/35416/gagneet
# Answer: http://stackoverflow.com/a/9899366
# Answerer:  http://stackoverflow.com/users/375889/jakesandlund

while test $# -gt 0
do
  case $1 in

  # Normal option processing
    -h | --help)
      # usage and help
      command=help
      break
      ;;
    -v | --version)
      command=version
      break
      ;;
    -d | --device)
      shift
      device=$1
      # DEVICE=$1
      ;;
    -b | --bandwidth)
      shift
      bandwidth=$1
      ;;
    -l | --latency)
      shift
      latency=$1
      ;;
    -p | --packetloss)
      shift
      packetloss=$1
      ;;
  # ...

  # Special cases
    --)
      break
      ;;
    --*)
      # error unknown (long) option $1
      ;;
    -?)
      # error unknown (short) option $1
      ;;
   #
   # Shortcuts
       GSM)
         command=slow
         bandwidth=14kbps
         latency=250ms
         ;;
       EDGE|2.5G|GPRS)
         command=slow
         bandwidth=50kbps
         latency=200ms
         ;;
       3G)
         command=slow
         bandwidth=1000kbps
         latency=200ms
         ;;
       4G)
         command=slow
         bandwidth=10000kbps
         latency=100ms
         ;;
       5G)
         command=slow
         bandwidth=100mbps
         latency=100ms
         ;;
       modem-0.1k|modem-110)
         command=slow
         bandwidth=110bps
         latency=350ms
         ;;
       modem-0.3k|modem-300)
         command=slow
         bandwidth=300bps
         latency=300ms
         ;;
       modem-1.2k|modem-1200)
         command=slow
         bandwidth=1200bps
         latency=280ms
         ;;
       modem-2.4k|modem-2400)
         command=slow
         bandwidth=2400bps
         latency=250ms
         ;;
       modem-9.6k|modem-9600)
         command=slow
         bandwidth=9600bps
         latency=200ms
         ;;
       modem-14.4k|modem-14400)
         command=slow
         bandwidth=14400bps
         latency=150ms
         ;;
       modem-28.8k|modem-28800)
         command=slow
         bandwidth=28800bps
         latency=150ms
         ;;
       modem-56k|modem-56000)
         command=slow
         bandwidth=56kbps
         latency=120ms
         ;;
       18k)
         command=slow
         bandwidth=18kbps
         latency=0ms
         ;;
       33k)
         command=slow
         bandwidth=33kbps
         latency=20ms
         ;;
       56k)
         command=slow
         bandwidth=56kbps
         latency=40ms
         ;;
       T1|t1)
         command=slow
         bandwidth=1500kbps
         latency=20ms
         ;;
       T3|t3)
         command=slow
         bandwidth=45mbps
         latency=10ms
         ;;
       DSL|dsl)
         command=slow
         bandwidth=2mbps
         latency=40ms
         ;;
       cablemodem)
         command=slow
         bandwidth=10mbps
         latency=20ms
         ;;
       wifi-a|wifi-g)
         command=slow
         bandwidth=54mbps
         latency=5ms
         ;;
       wifi-b)
         command=slow
         bandwidth=11mbps
         latency=10ms
         ;;
       wifi-n)
         command=slow
         bandwidth=110mbps
         latency=2ms
         ;;
       vsat)
         command=slow
         bandwidth=5mbps
         latency=500ms
         ;;
       clear|reset)
         command=clear
         ;;
       status)
         command=status
         break
         ;;


  # FUN STUFF HERE:
  # Split apart combined short options
    -*)
      split=$1
      shift
      set -- $(echo "$split" | cut -c 2- | sed 's/./-& /g') "$@"
      continue
      ;;

  # Done with options
    *)
      break
      ;;
  esac

  shift
done

case $command in
  help)
    echo $0
    echo 'Usage: slow <network-type> [-d device] [-b bandwidth] [-l latency]' # [-p packetloss] parameter is not being used
    echo
    echo "       slow GPRS -d $device"
    echo "       slow 4G -d $device"
    echo "       slow modem-56k -d $device"
    echo
    echo "       slow reset -d $device"
    echo "       slow status -d $device"
    echo
    echo 'Examples:'
    echo "       sudo slow -d $device -b 100kbps -l 0ms" # change bandwidth parameters for default network device
    echo "       sudo slow -d $device status" # get the status of default network device
    echo "       sudo slow -d $device reset" # reset bandwidth parameters for default network device
    echo
    echo '"network-type" type can be:'
    echo '  GSM'
    echo '  EDGE'
    echo '  2.5G'
    echo '  GPRS'
    echo '  3G'
    echo '  4G'
    echo '  5G'
    echo '  modem-2.4k'
    echo '  modem-9.6k'
    echo '  modem-14.4k'
    echo '  modem-28.8k'
    echo '  modem-56k'
    echo '  18k'
    echo '  33k'
    echo '  56k'
    echo '  T1'
    echo '  T3'
    echo '  DSL'
    echo '  cablemodem'
    echo '  wifi-a'
    echo '  wifi-b'
    echo '  wifi-g'
    echo '  wifi-n'
    echo '  eth-10'
    echo '  eth-100'
    echo '  eth-1000'
    echo '  vsat'
    echo '  vsat-busy'
    ;;
  version)
    # version info
    echo "slow version $VERSION"
    ;;
  slow)
    # Credit to Superuser for the basic commands that run this
    # Question: http://superuser.com/questions/147156/simulating-a-low-bandwidth-high-latency-network-connection-on-linux
    # Author: Justin L. http://superuser.com/users/38740/justin-l
    # Answer: http://superuser.com/a/147434/159810
    if  tc qdisc show dev $device | grep "qdisc htb 1: root" >/dev/null; then
      verb=change
      echo "Updating bandwidth for network device: $device (bandwidth=$bandwidth, latency=$latency)"
    else
      verb=add
      echo "Changing bandwidth for network device: $device (bandwidth=$bandwidth, latency=$latency)"
      tc qdisc $verb dev $device root handle 1: htb default 12
    fi
    tc class $verb dev $device parent 1:1 classid 1:12 htb rate $bandwidth ceil $bandwidth  &&
    tc qdisc $verb dev $device parent 1:12 netem delay $latency
    retcode=$?
    ;;
  clear)
    echo "Resetting network device: $device"
    tc qdisc del dev $device root
    retcode=$?
    ;;
  status)
    tc qdisc
    retcode=$?
    ;;
esac

exit $retcode
