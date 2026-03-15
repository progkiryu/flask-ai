# Use official Python image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy files
COPY requirements.txt .
COPY app/ ./app
COPY best_stroke_model.pth .

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose port
EXPOSE 5000

# Run server (bind to $PORT if set)
CMD ["sh", "-lc", "gunicorn index:app -b 0.0.0.0:${PORT:-5000}"]
