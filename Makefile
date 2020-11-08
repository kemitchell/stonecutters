tag=stonecutters

docker:
	docker build -t $(tag) .
	docker run --name $(tag) $(tag)
	docker cp $(tag):/workdir/book.pdf .
	docker cp $(tag):/workdir/site .
	docker rm $(tag)

.PHONY: clean

clean:
	rm -fr site
	rm -fr book
	rm -f book.pdf
