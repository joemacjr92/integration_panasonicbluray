FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy dependency list and install them
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY src/ ./src/
COPY driver.json .
COPY panasonic.png .

# The Panasonic integration defaults to 9091 but can be overridden
ENV UC_INTEGRATION_HTTP_PORT=9091
EXPOSE 9091

# Execute the driver
CMD ["python3", "src/driver.py"]
