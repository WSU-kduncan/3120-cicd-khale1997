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
