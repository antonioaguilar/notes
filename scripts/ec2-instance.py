#!/usr/bin/python
#
# Custom AWS script to start|stop EC2 instances in python
# Author: Antonio Aguilar
# https://github.com/antonioaguilar/aws-scripts
#
 
import boto.ec2, sys
 
# AWS_ACCESS_KEY_ID
AKID='01234567890123456789'

# AWS_SECRET_ACCESS_KEY
ASAK='0123456789123456789123456789123456789123'

# Region string (EU region is default)
REGION='eu-west-1'

 
def print_usage(args):
  print 'Usage:', args[0], 'stop|start <instance name>'
  sys.exit(1)
 
def usage(args):
  arg1 = ['stop', 'start']
  if not len(args) == 3:
    print_usage(args)
  else:
    if not args[1] in arg1:
      print_usage(args)
    else:
      return args[2]
 
myinstance = usage(sys.argv)
conn = boto.ec2.connect_to_region(REGION, aws_access_key_id=AKID, aws_secret_access_key=ASAK)
if sys.argv[1] == 'start':
  try:
    inst = conn.get_all_instances(filters={'tag:Name': myinstance})[0].instances[0]
  except IndexError:
    print 'Error:', myinstance, 'not found!'
    sys.exit(1)
  if not inst.state == 'running':
    print 'Starting', myinstance
    inst.start()
  else:
    print 'Error:', myinstance, 'already running or starting up!'
    sys.exit(1)
 
if sys.argv[1] == 'stop':
  try:
    inst = conn.get_all_instances(filters={'tag:Name': myinstance})[0].instances[0]
  except IndexError:
    print 'Error:', myinstance, 'not found!'
    sys.exit(1)
  if inst.state == 'running':
    print 'Stopping', myinstance
    inst.stop()
  else:
    print 'Error:', myinstance, 'already stopped or stopping'
    sys.exit(1)
    
