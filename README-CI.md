PART 1:
- CI Project Over
  - Using Ubuntu to create a Dockerfile
  - Using Dockerfile to create a container image
  - Using image to run a container
  - Basically, container will help website applications run smoothly on any platform or cloud.

- Run Project locally
  - to download docker, on Ubuntu, use command $ sudo apt install docker.io
  - After Dockerfile created, use command $ docker build -t <image-name> . (in this case, image-name is kha-ci), to create container image
  - After image crated, use command $ docker run -d -p 89:80 kha-ci, to run the container
  - To view the project, open a browser, in the search bar, type "localhost:89", or "localhost:89/test.html" to see the webpage contained in the container

PART 2:
- Create public Docker repo:
  - Sign in to DockerHub
  - Select Create a Repository
  
