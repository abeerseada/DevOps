FROM ubuntu:22.04

WORKDIR /app

RUN apt-get update
RUN apt-get install -y python3 python3-pip

RUN pip install --upgrade pip

RUN pip install flask 

COPY app2.py .

EXPOSE 3000

CMD [ "python3", "app2.py" ]



