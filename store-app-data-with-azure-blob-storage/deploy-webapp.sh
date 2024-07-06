APPNAME=mrgrewstorageapp
RESOURCEGROUP=$(az group list --query "[?starts_with(name,'learn')].name" --output tsv)

cd ~/mslearn-store-data-in-azure/store-app-data-with-azure-blob-storage/src/start
dotnet publish -o pub
cd pub
zip -r ../site.zip *

az webapp deployment source config-zip --src ../site.zip --name $APPNAME --resource-group $RESOURCEGROUP
