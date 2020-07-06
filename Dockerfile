FROM python:3.6 

MAINTAINER Your Name "mario.fried@gmail.com"

WORKDIR /app

RUN pip install flask

COPY . /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
