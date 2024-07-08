# terraform
# Exercise reference 

https://learn.microsoft.com/en-us/training/modules/configure-virtual-networks/9-simulation-create-networks

## Objectives
### Task 1: Create a virtual network.
Create a virtual network, vnet1, with an IP address space of 10.1.0.0/16.
Create a subnet, default, with an IP address space of 10.1.0.0/24.

### Task 2: Create two virtual machines.
Create a virtual machine, vm1, in vnet1 and allow inbound RDP.
Create a second virtual machine, vm2, in vnet1 and allow inbound RDP.
Ensure both virtual machines are deployed and running before continuing.

### Task 3: Test the virtual machine connections.
Connect to vm1 with RDP.
Connect to vm2 with RDP.
Disable the public and private Windows Firewall on both virtual machines.
Use Azure PowerShell to confirm vm1 can ping vm2.
