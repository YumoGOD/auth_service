# Используем официальный образ Python как базовый
FROM python:3.12.3-slim

# Устанавливаем рабочую директорию в контейнере
WORKDIR /app

# Копируем файлы requirements.txt в рабочую директорию
COPY requirements.txt /app/

# Устанавливаем зависимости из requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Копируем все файлы проекта в контейнер
COPY . /app/

# Открываем порт, который будет использовать Gunicorn (например, 8000)
EXPOSE 8000

# Указываем команду для запуска Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "auth_service.wsgi:application"]
