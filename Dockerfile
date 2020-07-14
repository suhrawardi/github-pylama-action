FROM python:3.7-alpine

LABEL "com.github.actions.name"="GitHub Action for Pylama"
LABEL "com.github.actions.description"="Run Pylama"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="green"

RUN apk add --no-cache bash build-base gcc
RUN pip install --upgrade pip
RUN pip install pylint pylama
RUN python --version ; pip --version ; pylama --version

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
