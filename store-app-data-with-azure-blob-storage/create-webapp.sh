APPNAME=mrgrewstorageapp
RESOURCEGROUP=$(az group list --query "[?starts_with(name,'learn')].name" --output tsv)
CONNECTIONSTRING=$(az storage account show-connection-string --name mrgrewstorage --output tsv)
az appservice plan create --name blob-exercise-plan --resource-group $RESOURCEGROUP --sku FREE --location centralus
az webapp create --name $APPNAME --plan blob-exercise-plan --resource-group $RESOURCEGROUP
az webapp config appsettings set --name $APPNAME --resource-group $RESOURCEGROUP --settings AzureStorageConfig:ConnectionString=$CONNECTIONSTRING AzureStorageConfig:FileContainerName=files
