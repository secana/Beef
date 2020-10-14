FROM ubuntu:20.04

ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt update
RUN apt install -y apt-utils \
    git \
    curl \
    ruby \
    sudo \
    tzdata \
    libgmp-dev \
    libgmpxx4ldbl \
    ruby-dev \
    ruby2.7-dev \
    ruby2.7-doc

# Clone beef from Github
WORKDIR /usr/share
RUN git clone git://github.com/beefproject/beef.git

# Install beef
WORKDIR /usr/share/beef
RUN printf '%s\n' Y Y | ./install
RUN sed -i 's/passwd: "beef"/passwd: "feeb"/' ./config.yaml

EXPOSE 3000
ENTRYPOINT [ "./beef" ]

