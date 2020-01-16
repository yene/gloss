# GLoSS (Go SSL)
GLoSS is a simple HTTPS reverse proxy that allows you to easily develop and test on HTTPS locally

## Highlights:
- No dependencies. Just one self-contained single executable
- Works on a variety of platforms and architectures: Mac, Linux - Arm7(Raspi2)/Arm6(Raspi)/Amd64/386
- Passes the same headers you'd expect with any other reverse proxy ssl
  - "X-Forwarded-Proto": "https"
  - "X-Forwarded-For": "the.clients.real.ip"
- Changes Host header to work with webpack-dev-server
- Doesn't require trusting a CA cert, only valid signing for the hosts you specify (default: *.local.dev)

## Usage
1. Pick a hostname for your local development
  - `echo "127.0.0.1   example.org" | sudo tee -a /etc/hosts > /dev/null`
1. Create a certificate
  - `gloss setup --host example.org`
1. Import the certificate to your keychain (Mac specific instructions below)
  - `open ~/.gloss/cert.pem`
  - Find the GLoSS cert and make it "Trusted"
1. Start using GLoSS
  - `gloss --map "example.org:8080"` Maps example.org to port 8080
1. Visit https://example.org
  - Will return the content at localhost:8080 via HTTPS

Or just run `gloss -h` for more help
