FROM node
MAINTAINER tommy810

RUN apt-get update; \
    apt-get install -y unzip;

ADD https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip / 

RUN unzip ngrok-stable-linux-amd64.zip -d /bin; \
    rm -f ngrok-stable-linux-amd64.zip;

COPY ngrok-local.yml /ngrok.yml

CMD ["/bin/ngrok", "http", "-config=/ngrok.yml", "80"]
