# Create resource group
az group create --name udemy-bicep --location westeurope

# Deploy Bicep template
az deployment group create --subscription "Abonnement" --resource-group udemy-bicep --template-file main.bicep

# Generate parameter file
az bicep generate-params --file main.bicep

# Deploy Bicep template with parameters
az deployment group create --subscription "Abonnement" --resource-group udemy-bicep --template-file main.bicep --parameters @main.parameters.json

# Generate parameter file including all parameters
az bicep generate-params --file main.bicep  --include-params all