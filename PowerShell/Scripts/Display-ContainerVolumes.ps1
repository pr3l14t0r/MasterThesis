# Get the pod information as json output
$json = kubectl get pods etcd-k8s-m-1 --namespace kube-system -o json | ConvertFrom-Json

# parse the volumes first and match them to the containers by name
$Volumes = @()

foreach($volume in $json.spec.volumes)
{
    $Volumes += [PSCustomObject]@{
        Name = $volume.name
        HostPath = $volume.hostPath.path
        Type = $volume.hostPath.type
    }
}

# Now parse the containers and create a custom object tha contains all mounts.
$AllMounts = @()

foreach($container in $json.spec.containers)
{
    foreach($mount in $container.volumeMounts)
    {
        $AllMounts += [PSCustomObject]@{
            ContainerName = $container.name
            MountName = $mount.name
            ContainerPath = $mount.mountPath
            HostPath = ($Volumes | Where-Object {$_.Name -eq $mount.name}).HostPath
            Type = ($Volumes | Where-Object {$_.Name -eq $mount.name}).Type
        }
    }
}

#Write to console
Write-Output $AllMounts