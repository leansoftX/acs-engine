    "masterLinuxAdminUsername": {
      "type": "string",
      "value": "[parameters('linuxAdminUsername')]"
    },
    "masterLinuxAdminPassword": {
      "type": "string",
      "value": "[parameters('linuxAdminPassword')]"
    },
    "subscriptionId": {
			"type": "string",
			"value": "[subscription().subscriptionId]"
		},
    "rgLocation": {
      "type": "string",
			"value": "[parameters('location')]"
    },
    "rgName": {
      "type": "string",
      "value": "[variables('resourceGroup')]"
    },
    "masterVMName-0": {
      "type": "string",
      "value": "[concat(variables('masterVMNamePrefix'), '0')]"
    },
    "masterFQDN": {
      "type": "string",
{{if not IsPrivateCluster}}
      "value": "[reference(concat('Microsoft.Network/publicIPAddresses/', variables('masterPublicIPAddressName'))).dnsSettings.fqdn]"
{{else}}
      "value": ""
{{end}}
    }
{{if AnyAgentUsesAvailabilitySets}}
    ,
    "agentStorageAccountSuffix": {
      "type": "string",
      "value": "[variables('storageAccountBaseName')]"
    },
    "agentStorageAccountPrefixes": {
      "type": "array",
      "value": "[variables('storageAccountPrefixes')]"
    }
{{end}}