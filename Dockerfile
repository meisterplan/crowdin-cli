FROM openjdk:11-jdk

ENV CROWDIN_VERSION=3.1-15

RUN apt-get update && \
    apt-get install -y apt-transport-https make git jq && \
    apt-get clean
RUN wget -qO - https://artifacts.crowdin.com/repo/GPG-KEY-crowdin | apt-key add -
RUN echo "deb https://artifacts.crowdin.com/repo/deb/ /" > /etc/apt/sources.list.d/crowdin.list
RUN apt-get update && \
    apt-get install -y crowdin3=${CROWDIN_VERSION} && \
    apt-get clean
