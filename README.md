# Beef Docker Image

Docker image for [The Browser Exploitation Framework (Beef)](https://beefproject.com/)

## Run

Run with: `docker run -p 3000:3000 -p 6789:6789 -p 61985:61985 -p 61986:61986 --rm --name beef secana/beef`

Web interface: [http://localhost:3000/ui/panel](http://localhost:3000/ui/panel)

    Username: beef
    Password: feeb

## Build and deploy

Build image: `docker build -t secana/beef .`

Deploy: `docker push secana/beef`
