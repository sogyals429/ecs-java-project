build:
	docker build -t spring-app .

init:
	terraform12 workspace select dev1
	terraform12 init

dev:
	terraform12 workspace select dev1
	terraform12 apply