# uPass

A simple dockerize unix password manager using alpine as base.

Simply build the image and you can use it now on your own machine.

``` shell
docker build --build-arg keyid=[gpg-id]:6: -t upass:latest .
```

Running the program.

``` shell
docker run --rm -v [host-dir]/.password-store:/root/.password-store -it upass pass [command]
```

Powershell Alias Helper

``` powershell
function runPass {
    docker run --rm -v [host-dir-store]:/root/.password-store -it upass pass $args
}

set-alias pass runPass
```
