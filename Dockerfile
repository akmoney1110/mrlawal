FROM python:3.13-slim

# Prevent Python from writing .pyc files
ENV PYTHONDONTWRITEBYTECODE=1

# Show Python output immediately in Docker logs
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install Python dependencies first
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy Django project
COPY . .

# Django/Gunicorn port
EXPOSE 8000

# Start Django with Gunicorn
CMD ["gunicorn", "mrlawal.wsgi:application", "--bind", "0.0.0.0:8000"]
