FROM alpine:latest

# Install required tools
RUN apk add --no-cache curl unzip

# Download and extract Xray
RUN curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip xray.zip -d /xray && \
    rm xray.zip

# Copy config
COPY config.json /xray/config.json

WORKDIR /xray
EXPOSE 8080

# Start Xray
CMD ["./xray", "-c", "/xray/config.json"]