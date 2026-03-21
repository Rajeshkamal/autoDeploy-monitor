FROM python:3.11-slim

WORKDIR /app

COPY app/requirement.txt .

RUN pip install --no-cache-dir -r requirement.txt

COPY app/ .

EXPOSE 5000

CMD ["python" , "app.py"]
