# Ghost on Railway

Custom Ghost setup with dynamic configuration from environment variables.

## Deploy to Railway

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new)

## Environment Variables

- `url` - Your Ghost URL (e.g., https://blog.stevennoack.de)
- `mail__transport` - SMTP
- `mail__options__host` - smtp.resend.com
- `mail__options__port` - 587
- `mail__options__auth__user` - resend
- `mail__options__auth__pass` - Your Resend API key
- `mail__from` - noreply@stevennoack.de
