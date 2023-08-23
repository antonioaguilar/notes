# AWS scripts and tricks

## Check which key-pairs are actively used

```bash
aws ec2 --profile default describe-key-pairs --query KeyPairs[].[KeyName] --output text | xargs -I {} aws ec2 --profile default describe-instances --filters Name=key-name,Values={} --query Reservations[].Instances[].[KeyName,InstanceId] --output text| uniq
```