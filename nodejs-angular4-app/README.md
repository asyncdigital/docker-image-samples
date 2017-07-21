
# build container image
docker build -t angular4-app .

# Test the image
docker run --rm -p 4200:4200 angular4-app
curl http://localhost:4200
