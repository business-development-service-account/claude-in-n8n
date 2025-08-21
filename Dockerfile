FROM n8nio/n8n:latest

USER root

# Install dependencies for Claude CLI (Alpine Linux)
RUN apk add --no-cache \
    curl \
    git \
    nodejs \
    npm \
    python3 \
    py3-pip \
    bash

# Install Claude CLI
RUN npm install -g @anthropic/claude-cli

# Create a directory for Claude configurations and set proper ownership
RUN mkdir -p /home/node/.config/claude && \
    chown -R node:node /home/node/.config

# Switch back to node user for security
USER node

# Expose the default n8n port
EXPOSE 5678

# Use the default n8n entrypoint
CMD ["n8n"]