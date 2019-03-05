GCP_PROJECT=$1

# Compute instances
gcloud --format="value(networkInterfaces[0].accessConfigs[0].natIP)" --project "$GCP_PROJECT"  compute instances list >> iplist_tmp
# Forwarding rules
gcloud --format="value(IPAddress)" --project "$GCP_PROJECT" compute forwarding-rules list >> iplist_tmp
# Static addresses (primarily)
gcloud --format="value(address)" --project "$GCP_PROJECT" compute  addresses list >> iplist_tmp
# SQL instances
gcloud --format="value(ipAddresses[0].ipAddress)" --project "$GCP_PROJECT" sql instances list >> iplist_tmp

# Proccess
# Remove empty lines
# Remove RFC1918 IP's
# Sort and only list unique IP's
cat iplist_tmp | sed '/^[[:space:]]*$/d' | grep -v -E '^(192\.168|10\.|172\.1[6789]\.|172\.2[0-9]\.|172\.3[01]\.)' | sort | uniq

# Remove temporary file
rm iplist_tmp
