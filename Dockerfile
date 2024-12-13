FROM docker.io/library/clojure:tools-deps

# Install essential packages
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

RUN npm install -g yarn

# Verify installations
RUN java -version && clojure --version

# Set the working directory
WORKDIR /app

# Copy the project files into the container
COPY . .

# Default command
CMD ["clojure", "-M:run"]
