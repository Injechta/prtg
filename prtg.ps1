$PRTGServer = "https://prtg.ga.fr"
$UserName = "user1703"
$Passhash = "1148022530"
$OutputFile = "$HOME\PRTG-Export.csv"

Write-Host "Début de l'extraction des données de PRTG..."

try {
    $Uri = "$PRTGServer/api/table.json?content=devices&output=json&columns=objid,device,group,host&username=$UserName&passhash=$Passhash"
    $Devices = Invoke-RestMethod -Uri $Uri -ErrorAction Stop

    $Results = @()

    foreach ($Device in $Devices.devices) {
        Write-Host "Extraction des donnees pour $($Device.device)..."

        $SensorUri = "$PRTGServer/api/table.json?content=sensors&output=json&columns=objid,sensor,status,lastvalue&username=$UserName&passhash=$Passhash&id=$($Device.objid)"
        $Sensors = Invoke-RestMethod -Uri $SensorUri -ErrorAction Stop

        foreach ($Sensor in $Sensors.sensors) {
            $Results += [PSCustomObject]@{
                "ID Appareil" = $Device.objid
                "Appareil" = $Device.device
                "Groupe" = $Device.group
                "Hote" = $Device.host
                "ID Capteur" = $Sensor.objid
                "Capteur" = $Sensor.sensor
                "Statut" = $Sensor.status
                "Derniere Valeur" = $Sensor.lastvalue
            }
        }
    }

    $Results | Export-Csv -Path $OutputFile -NoTypeInformation -Delimiter ";" -Encoding UTF8  # Spécification de l'encodage UTF8
    Write-Host "Les donnees ont ete exportees avec succes vers $OutputFile"
}
catch {
    Write-Host "Une erreur s'est produite : $_.Exception.Message" -ForegroundColor Red
}
