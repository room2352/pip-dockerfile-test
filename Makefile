DOCKER = docker

IMAGE_NAME = pip-dockerfile-test


.PHONY: all
all: pipenv-all python-all

.PHONY: clean
clean:
	$(DOCKER) rmi -f $(IMAGE_NAME):pipenv-py3.7-alpine
	$(DOCKER) rmi -f $(IMAGE_NAME):pipenv-py3.7-slim
	$(DOCKER) rmi -f $(IMAGE_NAME):pipenv-pypy3.6-slim
	$(DOCKER) rmi -f $(IMAGE_NAME):python-py3.7-alpine
	$(DOCKER) rmi -f $(IMAGE_NAME):python-py3.7-slim
	$(DOCKER) rmi -f $(IMAGE_NAME):python-pypy3.6-slim

##################################################
## pipenv                                        #
##################################################
pipenv-all: pipenv-py3.7-alpine pipenv-py3.7-slim pipenv-pypy3.6-slim

pipenv-py3.7-alpine:
	cd ./alpine \
		&& $(DOCKER) build -f ./Dockerfile.pipenv.py3.7 -t $(IMAGE_NAME):$@ ./context

pipenv-py3.7-slim:
	cd ./slim \
		&& $(DOCKER) build -f ./Dockerfile.pipenv.py3.7 -t $(IMAGE_NAME):$@ ./context

pipenv-pypy3.6-slim:
	cd ./slim-pypy \
		&& $(DOCKER) build -f ./Dockerfile.pipenv.pypy3.6 -t $(IMAGE_NAME):$@ ./context

##################################################
## python                                        #
##################################################
python-all: python-py3.7-alpine python-py3.7-slim python-pypy3.6-slim

python-py3.7-alpine:
	cd ./alpine \
		&& $(DOCKER) build -f ./Dockerfile.python.py3.7 -t $(IMAGE_NAME):$@ ./context

python-py3.7-slim:
	cd ./slim \
		&& $(DOCKER) build -f ./Dockerfile.python.py3.7 -t $(IMAGE_NAME):$@ ./context

python-pypy3.6-slim:
	cd ./slim-pypy \
		&& $(DOCKER) build -f ./Dockerfile.python.pypy3.6 -t $(IMAGE_NAME):$@ ./context

