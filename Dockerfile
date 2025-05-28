FROM python:3.9-alpine as builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
FROM python:3.9-alpine
WORKDIR /app
COPY --from=builder /app /app
COPY app.py app.py
CMD ['python', 'app.py']
FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt requirements.txt
COPY app.py app.py
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5000
CMD ["python", "app.py"]

