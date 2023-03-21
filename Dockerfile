FROM nginx:latest

# Installed dependencies
# RUN

#COPY our project files to some where on the container filesystem
COPY website /usr/share/nginx/html

# CMD python code.py (based on location in container)
