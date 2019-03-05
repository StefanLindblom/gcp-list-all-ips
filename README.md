# gcp-list-all-ips
A simple script that aims to list all external IP addresses in a project.
It's a quick hack to be able to do port scans of a small GCP project, including as many GCP services as possible.

## Supported services
* Compute instances 
* Forwarding rules
* Static addresses
* SQL instances

This list can surely be extended, PR's are welcome :)

## How to run and example output
You need to have the gcloud SDK installed, and authenticated in your environment.

Supply the GCP Project ID as an argument.
```
./gcp_list_public_ips.sh johndoe-1234
8.8.8.8
8.8.4.4
```
