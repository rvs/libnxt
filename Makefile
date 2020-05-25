all:
	docker build -t local/libnxt .
	C=`docker create local/libnxt dummy` && rm -rf out && docker cp $$C:/out . && docker rm $$C

clean:
	rm -rf out
