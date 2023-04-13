PART 1:
  - Overview:
    - This project continues what have done in project 4.
    - However, in this project, image will be built and tagged not only "latest", but also with a version (ex: v1.1.0)
  - Generating a tag:
    - Using command: $ git tag -a <tag version>
      ex: $ git tag -a v1.1.0
  - Behavior of GitHub workflow:
    - After a tag is generated, it will be pushed to GitHub using command: $ git push origin <tag version>
      ex: $ git push origin v1.1.0
    - Workflow will be triggered when a tag is pushed
    - When the workflow is triggered, DockerHub account will be logged in
    - An image will be created, tagged with the tag "v1.1.0" generated previously, and then pushed to DockerHub
      https://hub.docker.com/repository/docker/kenledk1997/khadocker/general
  
PART 2:
  - Installing Docker to instance:
    - Connect to the instance via SSH
    - Update package list: $ sudo apt-get update
    - Install Docker: $ sudo apt-get install docker.io
  
  - Pull and run a container from DockerHub:
    - Login to Docker account from the instance
      ex: sudo docker login, then enter username and password
    - $ docker run -d -p <host-port>:<container-port> <your-image>, since the workflow in this project does not create an image with a name, so we'll run the image using its tag
      ex: $ sudo docker run -d -p 88:80 kenledk1997/khadocker:latest  
        or $ sudo docker run -d -p 88:80 kenledk1997/khadocker:1.1, where kenledk1997 is DockerHub username, khadocker is the image repository, and "latest" or "1.1" is the tag created by the workflow
    - Use command: $ sudo docker ps, to check if there is a container created by running the image
    - or go to browser, in the serach bar, type instance-public-ip:port, and Enter
      ex: 54.198.10.78:88
  
  - Container restart script: contains 4 main commands
    - $ sudo docker stop khacontainer, to stop a running container named khacontainer (if there is one)
    - $ sudo docker rm khacontainer, to rmove the stopped container named khacontainer (if there is one)
    - $ sudo docker pull kenledk1997/khadocker:latest, to pull latest image from DockerHub repo khadocker
    - $ sudo docker run -d --name khacontainer -p 88:80 kenledk1997/khadocker:latest, to run a container on port 88 and name it khacontainer using the image pulled from DockerHub repo.
    - The script is saved in a file name deploy.sh
    - Make sure change the permission so that the script is executable
    - The script can be saved in main directory or default directory when connecting to the instance
    - Using command: ./deplot.sh, to try the script and see the outcome by accessing to the container
