# Start from the base upstream image (e.g., Redpanda Connect)
FROM redpandadata/connect:latest

# Copy your local config files from the repo into the container
COPY ./configs /streams

# Set default execution command to use the baked config
ENTRYPOINT ["redpanda-connect"]
CMD ["streams", "/streams/*.yaml"]
