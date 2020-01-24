# GLoSS (Go SSL)
GLoSS is a simple HTTPS reverse proxy that allows you to easily develop and test on HTTPS locally

## Highlights:
- No dependencies. Just one self-contained single executable
- Passes the same headers you'd expect with any other reverse proxy ssl
  - "X-Forwarded-Proto": "https"
  - "X-Forwarded-For": "the.clients.real.ip"
- Changes Host header to work with webpack-dev-server
- Doesn't require trusting a CA cert, only valid signing for the hosts you specify (default: *.local.dev)

## Usage
1. Redirect your domain to local: `echo "127.0.0.1   example.org" | sudo tee -a /etc/hosts > /dev/null`
1. Create a certificate: `gloss setup --host example.org`
1. Start GLoSS proxy, and map the domain to local port 8080: `gloss --map "example.org:8080"`
1. Visit https://example.org, which will serve the content from localhost:8080

## Trust Certificate
Import the certificate to your keychain:
  - `open ~/.gloss/cert.pem`
  - Find the GLoSS cert and make it "Trusted"
