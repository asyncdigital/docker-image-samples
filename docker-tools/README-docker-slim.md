# docker-slim

## Installation
```sh
# Mac
curl -L -O https://github.com/docker-slim/docker-slim/releases/download/1.22/dist_mac.zip
# Linux
curl -L -O https://github.com/docker-slim/docker-slim/releases/download/1.22/dist_linux.tar.gz

unzip dist_mac.zip
ln -s dist_mac/docker-slim ~/bin/docker-slim
```
## Usage
```txt
docker-slim [version|info|build|profile] [--http-probe|--remove-file-artifacts] <IMAGE_ID_OR_NAME>
```
user `docker-slim` with sample app

```sh
docker images yoichikawasaki/helloworld-python:0.0.1
REPOSITORY                         TAG                 IMAGE ID            CREATED             SIZE
yoichikawasaki/helloworld-python   0.0.1               fda151d7e5d2        3 weeks ago         932MB

docker-slim build --http-probe yoichikawasaki/helloworld-python:0.0.1
Password:
docker-slim[build]: state=started
docker-slim[build]: info=params target=yoichikawasaki/helloworld-python:0.0.1 continue.mode=enter
docker-slim[build]: state=inspecting.image
docker-slim[build]: info=image id=sha256:fda151d7e5d2e45b291d343ad06f391fc78279f0e978179c31601f62bc6fddc6 size.bytes=932018726 size.human=932 MB
docker-slim[build]: state=inspecting.container
time="2018-12-25T20:40:12+09:00" level=fatal msg="docker-slim: failure" error="API error (400): {"message":"OCI runtime create failed: container_linux.go:348: starting container process caused \"exec: \\\"/opt/dockerslim/bin/sensor\\\": permission denied\": unknown"}
" stack="goroutine 1 [running]:
runtime/debug.Stack(0x2, 0xc42020c5a0, 0xc4201a2200)
        /usr/local/go/src/runtime/debug/stack.go:24 +0xa7
github.com/docker-slim/docker-slim/pkg/utils/errutils.FailOn(0x14c59a0, 0xc42023e720)
        /Users/q/docker-slim/docker-slim/_gopath/src/github.com/docker-slim/docker-slim/pkg/utils/errutils/errutils.go:14 +0x51
github.com/docker-slim/docker-slim/internal/app/master/commands.OnBuild(0x0, 0x0, 0x147a700, 0x0, 0x0, 0xc4200957a0, 0x7ffeefbff46f, 0x26, 0x0, 0x0, ...)
        /Users/q/docker-slim/docker-slim/_gopath/src/github.com/docker-slim/docker-slim/internal/app/master/commands/build.go:115 +0xc7a
github.com/docker-slim/docker-slim/internal/app/master.init.0.func5(0xc42001edc0, 0x0, 0xc42001edc0)
        /Users/q/docker-slim/docker-slim/_gopath/src/github.com/docker-slim/docker-slim/internal/app/master/cli.go:480 +0xd68
github.com/docker-slim/docker-slim/vendor/github.com/codegangsta/cli.HandleAction(0x13db200, 0x14906c8, 0xc42001edc0, 0xc420074400, 0x0)
        /Users/q/docker-slim/docker-slim/_gopath/src/github.com/docker-slim/docker-slim/vendor/github.com/codegangsta/cli/app.go:485 +0xc8
github.com/docker-slim/docker-slim/vendor/github.com/codegangsta/cli.Command.Run(0x1475209, 0x5, 0x0, 0x0, 0xc42006b350, 0x1, 0x1, 0x1489f8d, 0x3e, 0x0, ...)
        /Users/q/docker-slim/docker-slim/_gopath/src/github.com/docker-slim/docker-slim/vendor/github.com/codegangsta/cli/command.go:207 +0xa37
github.com/docker-slim/docker-slim/vendor/github.com/codegangsta/cli.(*App).Run(0xc420098b60, 0xc42001c140, 0x4, 0x4, 0x0, 0x0)
        /Users/q/docker-slim/docker-slim/_gopath/src/github.com/docker-slim/docker-slim/vendor/github.com/codegangsta/cli/app.go:250 +0x700
github.com/docker-slim/docker-slim/internal/app/master.runCli()
        /Users/q/docker-slim/docker-slim/_gopath/src/github.com/docker-slim/docker-slim/internal/app/master/cli.go:730 +0x55
github.com/docker-slim/docker-slim/internal/app/master.Run()
        /Users/q/docker-slim/docker-slim/_gopath/src/github.com/docker-slim/docker-slim/internal/app/master/app.go:6 +0x25
main.main()
        /Users/q/docker-slim/docker-slim/_gopath/src/github.com/docker-slim/docker-slim/cmd/docker-slim/main.go:8 +0x20
" version="darwin|Tetra|1.22|936f91d2f1f3fc9b09f94e6ce908135108696675|2018-09-08_02:00:42AM (go1.10)"

```

Like above, it ends up with errors:
```
time="2018-12-25T20:40:12+09:00" level=fatal msg="docker-slim: failure" error="API error (400): {"message":"OCI runtime create failed: container_linux.go:348: starting container process caused \"exec: \\\"/opt/dockerslim/bin/sensor\\\": permission denied\": unknown"}
```


## LINKS
- https://github.com/docker-slim/docker-slim
