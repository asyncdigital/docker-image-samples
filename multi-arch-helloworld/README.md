# Building Multi-Architecture Image

## Enable experimental CLI options

```
$ vi ~/.docker/config.json

{
  "experimental": "enabled",        ## <<< enable
  "credsStore" : "osxkeychain",
  "HttpHeaders" : {
    "User-Agent" : "Docker-Client/18.09.0 (darwin)"
  },
  "credSstore" : "osxkeychain",
  "auths" : {
    "https://index.docker.io/v1/" : {

    }
  },
  "stackOrchestrator" : "swarm"
}
```

## Sample Manifest

For linux
```sh
$ cat linux/Dockerfile

FROM alpine:latest
CMD echo "Hello World from Linux"
```

For Windows
```sh
$ cat windows/Dockerfile

FROM microsoft/nanoserver:latest
CMD echo "Hello World from Windows"
```

## Build Multi-Architecture Image

```sh
$ cd linux
$ docker image build  -t yoichikawasaki/multi-arch-helloworld:linux .
$ docker image push yoichikawasaki/multi-arch-helloworld:linux
$ cd windows 
$ docker image build  -t yoichikawasaki/multi-arch-helloworld:windows .

$ docker manifest create \
    yoichikawasaki/multi-arch-helloworld:latest \
    yoichikawasaki/multi-arch-helloworld:linux \
    yoichikawasaki/multi-arch-helloworld:windows

Created manifest list docker.io/yoichikawasaki/multi-arch-helloworld:latest

$ docker manifest push yoichikawasaki/multi-arch-helloworld:latest
```

Inspect
```sh
$ docker manifest inspect yoichikawasaki/multi-arch-helloworld:linux

{
        "schemaVersion": 2,
        "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
        "config": {
                "mediaType": "application/vnd.docker.container.image.v1+json",
                "size": 1758,
                "digest": "sha256:b5a7944885cc7f244be007719af7f2fb5196d30b25f278bc7899c71c35037a7e"
        },
        "layers": [
                {
                        "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
                        "size": 2206931,
                        "digest": "sha256:4fe2ade4980c2dda4fc95858ebb981489baec8c1e4bd282ab1c3560be8ff9bde"
                }
        ]
}

#  you’ll get the manifest list you created 

$ docker manifest inspect yoichikawasaki/multi-arch-helloworld
{
   "schemaVersion": 2,
   "mediaType": "application/vnd.docker.distribution.manifest.list.v2+json",
   "manifests": [
      {
         "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
         "size": 528,
         "digest": "sha256:5bae73aa52efb04e3e0f7fc471efa1e4c76ab388a7873091985b0c25f864fde2",
         "platform": {
            "architecture": "amd64",
            "os": "linux"
         }
      }
   ]
}

```

Check supported architecture
```sh
$ docker run --rm mplatform/mquery yoichikawasaki/multi-arch-helloworld

Image: yoichikawasaki/multi-arch-helloworld
 * Manifest List: Yes
 * Supported platforms:
   - linux/amd64
```

## REFERENCES
- https://docs.docker.com/edge/engine/reference/commandline/manifest/
- https://medium.com/@mauridb/docker-multi-architecture-images-365a44c26be6
- https://jugsaxony.org/wp-content/uploads/2017/11/20171109_JUG_Saxony_Multi-arch_Images.pdf
