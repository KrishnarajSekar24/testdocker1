krishna@DESKTOP-FE8TU4N:~$
krishna@DESKTOP-FE8TU4N:~$ ls
Dockerfile  krishna.html
krishna@DESKTOP-FE8TU4N:~$ cat krishna.html
<h1>Hi Krishna, Welcome to the DevOps Program</h1>
krishna@DESKTOP-FE8TU4N:~$ cat Dockerfile
FROM ubuntu
RUN apt update
RUN apt install -y nginx
COPY krishna.html /var/www/html
CMD ["nginx", "-g", "daemon off;"]


krishna@DESKTOP-FE8TU4N:~$ docker images
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
krishna@DESKTOP-FE8TU4N:~$ docker build -t krish:v1 .
[+] Building 190.8s (10/10) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                               0.1s
 => => transferring dockerfile: 164B                                                                                                                               0.0s
 => [internal] load .dockerignore                                                                                                                                  0.0s
 => => transferring context: 2B                                                                                                                                    0.0s
 => [internal] load metadata for docker.io/library/ubuntu:latest                                                                                                   6.3s
 => [auth] library/ubuntu:pull token for registry-1.docker.io                                                                                                      0.0s
 => [1/4] FROM docker.io/library/ubuntu@sha256:35fb073f9e56eb84041b0745cb714eff0f7b225ea9e024f703cab56aaa5c7720                                                    8.0s
 => => resolve docker.io/library/ubuntu@sha256:35fb073f9e56eb84041b0745cb714eff0f7b225ea9e024f703cab56aaa5c7720                                                    0.0s
 => => sha256:35fb073f9e56eb84041b0745cb714eff0f7b225ea9e024f703cab56aaa5c7720 1.42kB / 1.42kB                                                                     0.0s
 => => sha256:a8fe6fd30333dc60fc5306982a7c51385c2091af1e0ee887166b40a905691fd0 529B / 529B                                                                         0.0s
 => => sha256:216c552ea5ba7b0e3f6e33624e129981c39996021403518019d19b8843c27cbc 1.46kB / 1.46kB                                                                     0.0s
 => => sha256:cf92e523b49ea3d1fae59f5f082437a5f96c244fda6697995920142ff31d59cf 30.43MB / 30.43MB                                                                   5.3s
 => => extracting sha256:cf92e523b49ea3d1fae59f5f082437a5f96c244fda6697995920142ff31d59cf                                                                          2.3s
 => [internal] load build context                                                                                                                                  0.1s
 => => transferring context: 90B                                                                                                                                   0.0s
 => [2/4] RUN apt update                                                                                                                                          90.4s
 => [3/4] RUN apt install -y nginx                                                                                                                                85.1s
 => [4/4] COPY krishna.html /var/www/html                                                                                                                          0.1s
 => exporting to image                                                                                                                                             0.6s
 => => exporting layers                                                                                                                                            0.6s
 => => writing image sha256:3ba83749df085df76b6a1ee4122e8579f457317f02198da43052beaf57fa821b                                                                       0.0s
 => => naming to docker.io/library/krish:v1                                                                                                                        0.0s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
krishna@DESKTOP-FE8TU4N:~$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
krish        v1        3ba83749df08   24 seconds ago   171MB
krishna@DESKTOP-FE8TU4N:~$ docker tag krish:v1 krishnarajsekar24/testdocker:v1
krishna@DESKTOP-FE8TU4N:~$ docker images
REPOSITORY                     TAG       IMAGE ID       CREATED          SIZE
krishnarajsekar24/testdocker   v1        3ba83749df08   54 seconds ago   171MB
krish                          v1        3ba83749df08   54 seconds ago   171MB
krishna@DESKTOP-FE8TU4N:~$ docker login
Authenticating with existing credentials...
Login Succeeded

Logging in with your password grants your terminal complete access to your account.
For better security, log in with a limited-privilege personal access token. Learn more at https://docs.docker.com/go/access-tokens/
krishna@DESKTOP-FE8TU4N:~$ docker push krishnarajsekar24/testdocker:v1
The push refers to repository [docker.io/krishnarajsekar24/testdocker]
8cd4dc39f0dc: Pushed
23b6262dd1db: Pushed
bddbeb9ea434: Pushed
17f623af01e2: Layer already exists
v1: digest: sha256:234b6e2355050f457d5ae9d91843de784ea91fc74a7f101d5da638607f2ac9d8 size: 1160
krishna@DESKTOP-FE8TU4N:~$ docker images
REPOSITORY                     TAG       IMAGE ID       CREATED         SIZE
krish                          v1        3ba83749df08   2 minutes ago   171MB
krishnarajsekar24/testdocker   v1        3ba83749df08   2 minutes ago   171MB
krishna@DESKTOP-FE8TU4N:~$ docker run -d -p 80:80 3ba83749df08
5d6a84d1090fc4316ed695447ce23aa39ca25c2329b3bb41a47fd5a0ff8dc438
krishna@DESKTOP-FE8TU4N:~$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                NAMES
5d6a84d1090f   3ba83749df08   "nginx -g 'daemon of…"   4 seconds ago   Up 3 seconds   0.0.0.0:80->80/tcp   great_babbage