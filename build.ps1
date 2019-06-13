param(
    [switch]$Push,
    [switch]$Run,
    [string]$Version = 'latest',
    [string]$AppName = 'eosnow',
    [string]$DockerHubUser = 'satak',
    [string]$Folder = '.'
)

$tag = "$($DockerHubUser)/$($AppName):$($Version)"

docker kill $AppName
docker rm $AppName
docker rmi $AppName
docker build -t $tag $Folder

if ($Push) {
    docker push $tag
}

if ($Run) {
    $internalPort = 80
    $externalPort = 80
    docker run -it -d --name $appName -p "$($externalPort):$($internalPort)" $tag
}
