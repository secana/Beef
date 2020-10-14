FROM ubuntu:20.04

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
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
    ruby2.7-doc \
    locales

RUN locale-gen en_US.UTF-8 && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"'>/etc/default/locale  && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

# Clone beef from Github
WORKDIR /usr/share
RUN git clone git://github.com/beefproject/beef.git

# Install beef
WORKDIR /usr/share/beef
RUN printf '%s\n' Y Y | ./install
RUN sed -i 's/passwd: "beef"/passwd: "feeb"/' ./config.yaml

EXPOSE 3000
ENTRYPOINT [ "./beef" ]

