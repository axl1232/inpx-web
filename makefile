.PHONY: all build

build:
	docker build -t inpx-web -f docker/Dockerfile .

%:
	@npm run $@