build:
	docker build -t pw/words:latest .

run: build
	docker run -it --rm -p 8000:8000/tcp --name words pw/words:latest
