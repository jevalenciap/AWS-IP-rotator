$INSTANCE=iwr  http://169.254.169.254/latest/meta-data/instance-id | Select-Object -ExpandProperty Content
$OLD_IP=  iwr http://169.254.169.254/latest/meta-data/public-ipv4 | Select-Object -ExpandProperty Content
$Alloc=  aws ec2 allocate-address --domain vpc --query AllocationId
$Alloc= $Alloc -replace '"', ""
$OldAlloc=aws ec2 describe-addresses --filters "Name=public-ip,Values=$OLD_IP" --query 'Addresses[*].AllocationId' 
$OldAlloc=[string]$OldAlloc
$OldAlloc= $OldAlloc -replace '"', ""
$OldAlloc= $OldAlloc -replace  '[ ]', ""
$OldAlloc= $OldAlloc -replace ']', ""
$OldAlloc= $OldAlloc -replace  '[[]', ""
aws ec2 associate-address  --network-interface-id eni-a2742f8e --allocation-id $Alloc 
echo 'Releasing old IP...'
aws ec2 release-address --allocation-id $OldAlloc


 
