STORAGEACCT=mrgrewstorage
RESOURCEGROUP=$(az group list --query "[?starts_with(name,'learn')].name" --output tsv)

az storage account create  --kind StorageV2 --resource-group $RESOURCEGROUP --location centralus --name $STORAGEACCT