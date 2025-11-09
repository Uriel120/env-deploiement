# Create resource group
az group create --name yyyyy --location westeurope

# Deploy Bicep template
az deployment group create --subscription "xxxxx" --resource-group yyyyy --template-file main.bicep

# Generate parameter file
az bicep generate-params --file main.bicep

# Deploy Bicep template with parameters
az deployment group create --subscription "xxxxx" --resource-group yyyyy --template-file main.bicep --parameters @main.parameters.json

# Generate parameter file including all parameters
az bicep generate-params --file main.bicep  --include-params all