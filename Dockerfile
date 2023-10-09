FROM python:3.7-alpine

WORKDIR /home/app

COPY . .

CMD ["python", "main.py"]