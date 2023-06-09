PART 1: Dockerize it
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

PART 2: GitHub Actions and DockerHub
- Create public Docker repo:
  - Sign in to DockerHub
  - Select Create a Repository
  - Name the new repo, and then select Public under Visibility section
  - Click Create
- Authenticate with DockerHub via CLI using Dockerhub credentials:
  - Open a terminal, in this case is Ubuntu
  - Use the command ($ docker login -u Docker-username)  
  (ex: $ docker login -u kenledk1997) to start logining into DockerHub accouint
  - When prompted, enter the DockerHub password  
  If you are using two-factor authentication (2FA) for your DockerHub account, you may need to enter both a token and your password. This token can be generated by in Account setting, under Security section. This 2FA is recommended since it provides an extra layer of security and help protect your DockerHub account from unauthorized access.  
- Push container image to Dockerhub (without GitHub Actions):
  - Make sure Docker installed on the machine, and DockerHub account is logged in via the CLI
  - After login, in Ubuntu terminal, use the command ($ docker build -t image-name:tag .)  
  (ex: $ docker build -t kha-ci:latest .) to build an image named kha-ci with the tag latest from the current directory '.'
  - To see other existing images, use the command ($ docker images)
  - Use the command ($ docker tag image-name:tag Docker-username/Docker-repository:tag)
  (ex: $ docker tag kha-ci:latest kenledk1997/khadocker:1.0) to tag the image that needs to push with nametag '1.0'
  - Use the command ($ docker push Docker-username/Docker-repository:tag)
  (ex: $ docker push kenledk1997/khadocker:1.0) to push the image with the tag 1.0 to DockerHub
- Configuring GitHub Secrets
  - Login to GitHub account, then go to the repository that needs to configured secrets
  - Go to Setting tab
  - Under Security section on the left, click "Secrets and variables" drop-down, then select Actions
  - Click "New repository secret"
  - Under the Name field, enter the name of the secret (ex: DOCKER_USERNAME)
  - Under the Secret field, enter the actual Docker username (ex: kenledk1997)
  - Click "Add secret"
  - Repeat previous 4 steps to create another secret named DOCKER_PASSWORD with the actual Docker account password
- Behavior of GitHub workflow:
  - A GitHub workflow is a script that defines a set of automated tasks or actions to be performed when certain events occur in a GitHub repository (ex: in this project, the event is pushing new code or changes to GitHub repo)
  - There are some variables in the workflow that are custom to the project such as:
    - Repo name and branch
    - Environment variables such as Docker username, Docker password, image name, tag
    - Actions or tasks in 'steps' block
  
PART 3: Diagramming
  ![3120-Project3-Diagram](https://user-images.githubusercontent.com/70625271/228714360-acf15c55-4b41-47f6-85d5-7c9321836ea8.png)

  - In the diagram, Ubuntu user pushes changes to GitHub repository
  - GitHub repo triggers GitHub actions on 'push' event
  - When triggered, GitHub actions performs the following steps:
    - Checkout Code: The workflow checks out the code changes from the GitHub repository
    - Build Docker image: The workflow builds a Docker image using Dockerfile located in GitHub repository
    - Tag image to DockerHub repo: The workflow gives a tag to previously built image
    - Push Image to DockerHub: The workflow finally pushes the tagged image to DockerHub account
  - If code fails, GitHub actions will show the errors for the user to fix
  - If code succeeds, the image will be available on DockerHub repository and ready for deployment.
