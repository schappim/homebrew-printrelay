# Homebrew Tap for PrintRelay

This is the official Homebrew tap for [PrintRelay](https://github.com/schappim/print-relay) - a cloud-based print relay system.

## Installation

```bash
# Add the tap
brew tap schappim/printrelay

# Install the server (for running on your cloud/server)
brew install printrelay-server

# Install the client (for machines with printers)
brew install printrelay-client
```

## Usage

### Server

```bash
# Generate API and client keys
API_KEY=$(openssl rand -hex 32)
CLIENT_KEY=$(openssl rand -hex 32)

# Start the server
printrelay-server -port 8080 -api-key "$API_KEY" -client-key "$CLIENT_KEY"
```

### Client

```bash
# Connect to your PrintRelay server
printrelay-client -server "wss://your-server.com/ws" -key "YOUR_CLIENT_KEY"
```

## Documentation

For complete documentation, see the [PrintRelay README](https://github.com/schappim/print-relay).

## License

Copyright (c) 2026, Ninja AI Labs Pty Ltd.
