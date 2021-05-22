targetScope = 'tenant'

param deploymentName string = concat('managementGroups', utcNow())

module managementGroupGlobal '../main.bicep' = {
  name: concat(deploymentName, 'managementGroupGlobal')
  params: {
    managementGroupDisplayName: 'MyOrganisation'
    managementGroupId: 'gbl-org-mgp'
    subscriptionIds: []
  }
}

module managementGroupPlatform '../main.bicep' = {
  name: concat(deploymentName, 'managementGroupPlatform')
  params: {
    managementGroupDisplayName: 'Platform'
    managementGroupId: 'pfm-org-mgp'
    parentManagementGroupId: managementGroupGlobal.outputs.managementGroupID
    subscriptionIds: [
      '63c1651a-ec30-4f6c-a3ec-671e23063585'
    ]
  }
}

module managementGroupSandbox '../main.bicep' = {
  name: concat(deploymentName, 'managementGroupSandbox')
  params: {
    managementGroupDisplayName: 'Sandbox'
    managementGroupId: 'sbx-org-mgp'
    parentManagementGroupId: managementGroupGlobal.outputs.managementGroupID
    subscriptionIds: []
  }
}

module managementGroupLandingZones '../main.bicep' = {
  name: concat(deploymentName, 'managementGroupLandingZones')
  params: {
    managementGroupDisplayName: 'LandingZones'
    managementGroupId: 'lzn-org-mgp'
    parentManagementGroupId: managementGroupGlobal.outputs.managementGroupID
    subscriptionIds: []
  }
}

module managementGroupTeam1 '../main.bicep' = {
  name: concat(deploymentName, 'managementGroupTeam1')
  params: {
    managementGroupDisplayName: 'Team1'
    managementGroupId: 'tm1-org-mgp'
    parentManagementGroupId: managementGroupLandingZones.outputs.managementGroupID
    subscriptionIds: [
      'fb749e0a-8d15-4f8d-9dfa-0470c5447930'
      'df2aa6ac-1751-4f29-a6c8-6e52ac20e305'
    ]
  }
}

module managementGroupTeam2 '../main.bicep' = {
  name: concat(deploymentName, 'managementGroupTeam2')
  params: {
    managementGroupDisplayName: 'Team2'
    managementGroupId: 'tm2-org-mgp'
    parentManagementGroupId: managementGroupLandingZones.outputs.managementGroupID
    subscriptionIds: []
  }
}
