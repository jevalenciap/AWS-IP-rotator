# AWS-IP-rotator
This script developed in Poweshell can be executed to change the elastic IP automatically on AWS for Windows machines.
You create a schedule task in Windows to change the public IP every X minutes automatically.

Follow the next instructions to execute the script (change the script folder):

powershell.exe -ExecutionPolicy Bypass C:\Users\Administrator\Desktop\rotate_ip.ps1

You need to exchange the eni ID.

Note: Changing IP on AWS has a fee (USD$0,01), TAKE CARE OF THAT 


