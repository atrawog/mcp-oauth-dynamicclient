FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy pyproject.toml and install dependencies
COPY pyproject.toml setup.py MANIFEST.in ./
COPY src ./src

# Install the package
RUN pip install -e .

# Expose port 8000
EXPOSE 8000

# Start the server
CMD ["python", "-m", "mcp_oauth_dynamicclient", "--host", "0.0.0.0", "--port", "8000"]