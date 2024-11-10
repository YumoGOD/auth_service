FROM python:3.12.3-slim

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt


COPY . .

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1


CMD ["gunicorn", "--bind", "0.0.0.0:8000", "config.wsgi:application"]