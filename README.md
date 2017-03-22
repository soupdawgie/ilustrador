# Ilustrador
**Ilustrador** is an image generator for the social network announcements.

## Stack
Sinatra + imgkit + wkhtmltoimage-binary.

## Description
The app receives a GET request (that controls contents of an output) and returns the generated image.

## Usage
Start the service:
```
rackup -D
```

Make a request:
http://0.0.0.0:9292/generate?id=1&type=fb&section=%D0%BC%D0%B0%D1%81%D1%82%D0%B5%D1%80-%D0%BA%D0%BB%D0%B0%D1%81%D1%81%D1%8B%20%E2%88%99%20%D1%81%D0%B5%D0%BC%D1%8C%D1%8F&title=%D0%92%D1%8F%D0%B6%D0%B5%D0%BC%20%D1%82%D0%B5%D0%BF%D0%BB%D1%83%D1%8E%20%D1%88%D0%B0%D0%BF%D0%BA%D1%83%20%D0%B8%D0%B7%20%D0%B0%D0%BA%D1%80%D0%B8%D0%BB%D0%B0&image=L3N5c3RlbS9hcnRpY2xlcy9pbWFnZXMvMDAwLzAwMC8zNTgvbGFyZ2UvY2F0LXJvcGUtY29pbC1iYXNrZXQtJTI4MSUyOS5qcGc=
