    "masterLinuxAdminUsername": {
      "type": "string",
      "value": "[parameters('linuxAdminUsername')]"
    },
    "masterLinuxAdminPassword": {
      "type": "string",
      "value": "[parameters('linuxAdminPassword')]"
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