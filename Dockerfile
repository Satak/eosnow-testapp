FROM python:3.7-alpine
COPY ["requirements.txt", "src/", "/app/"]
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["main.py"]
