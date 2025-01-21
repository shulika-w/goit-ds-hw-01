# Docker-команда FROM вказує базовий образ контейнера
# Наш базовий образ - це Linux з попередньо встановленим python-3.12
FROM python:3.12

# Встановимо робочу директорію всередині контейнера
WORKDIR /app

# Встановлюємо Poetry
RUN pip install poetry

# Копіюємо файл pyproject.toml та poetry.lock до контейнера
COPY pyproject.toml poetry.lock* /app/

# Встановлюємо залежності
RUN poetry install --no-root

# Копіюємо весь проект до робочої директорії
COPY . /app

# Вказуємо команду для запуску застосунку
CMD ["poetry", "run", "python", "main.py"]