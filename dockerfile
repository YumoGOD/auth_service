FROM python:3.12.3-slim

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt


COPY . .

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
EXPOSE 8000

CMD ["uvicorn", "auth_service.asgi:application", "--host", "0.0.0.0", "--port", "8000"]