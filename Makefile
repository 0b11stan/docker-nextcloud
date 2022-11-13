all: up

.env:
	cat template.env \
		| xargs -I {} bash -c 'echo "{}$$(head -c 20 /dev/urandom | base32)"' \
		| tee .env

up: .env
	docker compose up -d

down: .env
	docker compose down

install:
	echo make src: $(src)
	echo make out: $(out)
	echo 'docker compose up -p $(name) -f $(src)/docker-compose.yml -d' \
		> $(out)/docker-nextcloud.sh

# vim: set ft=make :
