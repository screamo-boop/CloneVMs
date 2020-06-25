Function Clone
{
    Param($DESTSRV,
          $DSNAME,
          $DATACENTER)
$DESTSRV = Read-Host DESTSRV
$DSNAME = Read-Host DSNAME
$DATACENTER = Read-Host DATACENTER
If ( ($null -eq $DESTSRV) -or ($null -eq $DSNAME) -or ($null -eq $DATACENTER) ) 
{
    Write-Output "All parameters must be set"
}
else {
    Connect-VIServer vc.au.team
    $vms = Get-VM -Location TSHOOT_1 | select -ExpandProperty Name
    foreach ($vm in $vms) {
        New-VM -Name $vm -VM $vm -vmhost $DESTSRV -datastore $DSNAME -DiskStorageFormat Thin -Location $DATACENTER -RunAsync
}
}
}
Clone -DESTSRV $DESTSRV -DSNAME $DSNAME -DATACENTER $DATACENTER