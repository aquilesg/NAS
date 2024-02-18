Phony: test-setup

# Create debian docker container and execute ansible commands
docker-build:
	docker build -t nas-image .
test-setup: docker-build
	docker run -d --name NAS_SERVER nas-image
	ansible-playbook -i localhost, ./setup/setup_pi.yaml.ansible

