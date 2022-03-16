az extension add `
  --source https://workerappscliextension.blob.core.windows.net/azure-cli-extension/containerapp-0.2.4-py2.py3-none-any.whl
  
az provider register --namespace Microsoft.Web  
$RESOURCE_GROUP="ff-container-apps"
$LOCATION="westeurope"
$LOG_ANALYTICS_WORKSPACE="ff-container-apps-logs"
$CONTAINERAPPS_ENVIRONMENT="ff-environment"
$CONTAINERAPPS_ACREGISTRY
az group create `
  --name $RESOURCE_GROUP `
  --location $LOCATION
az monitor log-analytics workspace create `
  --resource-group $RESOURCE_GROUP `
  --workspace-name $LOG_ANALYTICS_WORKSPACE
$LOG_ANALYTICS_WORKSPACE_CLIENT_ID=(az monitor log-analytics workspace show --query customerId -g $RESOURCE_GROUP -n $LOG_ANALYTICS_WORKSPACE --out tsv)

$LOG_ANALYTICS_WORKSPACE_CLIENT_SECRET=(az monitor log-analytics workspace get-shared-keys --query primarySharedKey -g $RESOURCE_GROUP -n $LOG_ANALYTICS_WORKSPACE --out tsv)
 

