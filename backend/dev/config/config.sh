#!/usr/bin/env bash

export Domains__Public='local.lncd.pl'
export Domains__ApiInternal='api.local.lncd.pl:8080'

export Logging__EnableDetailedInternalLogs=true
export Logging__MinimumLevel=Verbose

export Telemetry__ZipkinEndpoint='http://zipkin:9411/api/v2/spans'

export SqlServer__ConnectionString='Server=db.local.lncd.pl,1433;Database=App;User Id=sa;Password=Passw12#'
export BlobStorage__ConnectionString='DefaultEndpointsProtocol=https;AccountName=furniturestoreblob1;AccountKey=7RElTWiIcqNeijKRBODpw6cBG9xxVOsWzriCs3bEXkLkGBt026Lvfcdi+Oec8Gg0Jn6eNDj4MEAVm365iIEb0g==;EndpointSuffix=core.windows.net'
export BlobStorage__ModelsContainerName='furniturestoremodels'
export BlobStorage__PhotosContainerName='furniturestorephotos'

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ -f "$DIR/secrets.sh" ]]; then
    source "$DIR/secrets.sh"
fi
