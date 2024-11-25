FROM python:3.9-slim-buster


WORKDIR /ditiss_python


COPY . /ditiss_python/


RUN pip install -r /ditiss_python/requirements.txt


EXPOSE 5000


CMD ["python", "app.py"]


