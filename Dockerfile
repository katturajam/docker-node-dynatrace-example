# Specifies the base image we're extending
FROM node:8.12.0-slim

RUN apt-get update \
&& apt-get install -y unzip \
&& apt-get install -y wget

# Start :: Dynatrace Paas Agent Installation
ENV DT_HOME="/opt/dynatrace/oneagent"
ARG DT_ONEAGENT_OPTIONS="flavor=default&include=nodejs"
ARG DT_API_TOKEN="VB5D9oRHQliJo8YSmNbbk"
ARG DT_ENVIRONMENT_ID="psp74061"
ARG DT_API_URL="https://psp74061.live.dynatrace.com/api"

RUN mkdir -p $DT_HOME \
&& wget -O $DT_HOME/oneagent.zip "$DT_API_URL/v1/deployment/installer/agent/unix/paas/latest?Api-Token=$DT_API_TOKEN&$DT_ONEAGENT_OPTIONS" \
&& unzip $DT_HOME/oneagent.zip -d $DT_HOME  \
&& rm $DT_HOME/oneagent.zip 
# End :: Dynatrace Paas Agent Installation


# Start :: NODE JS Application - Create base directory
RUN mkdir -p /src

# Specify the "working directory" for the rest of the Dockerfile
WORKDIR /src

# Copy your application source files
COPY . /src

# clean
RUN npm cache clean -f \
&& npm install --only=prod

EXPOSE 3000
# End :: NODE JS Application

ENTRYPOINT ["/opt/dynatrace/oneagent/dynatrace-agent64.sh"]
CMD ["node", "server.js"]
