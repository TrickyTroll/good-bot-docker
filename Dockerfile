FROM ubuntu:latest

RUN apt update; apt upgrade -y

RUN apt install -y \
	python3-dev \
	python3-pip \
	python3.9 \
	ttyrec \
	wget \
	pv \
	git
	
#RUN wget https://dl.google.com/go/go1.13.linux-amd64.tar.gz; \
#    tar -C /usr/local -xzf go1.13.linux-amd64.tar.gz; \
#	export PATH=$PATH:/usr/local/go/bin; \
#	source ~/.profile; \
#	go get github.com/sugyan/ttyrec2gif

ADD ./app $HOME/src/
COPY requirements.txt /home/all
WORKDIR /tutorial
VOLUME ["/tutorial"]

ENTRYPOINT ["python3", "/src/hello.py"]