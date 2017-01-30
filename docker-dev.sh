docker build -f Dockerfile.dev -t slides:dev .
docker run -p 3000:3000 -ti --rm -w /usr/local/app -v $(pwd):/usr/local/app slides:dev bash
