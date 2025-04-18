COMPOSE_FILE=./srcs/docker-compose.yml
RED=\033[1;31m
GREEN=\033[1;32m
BLUE=\033[1;36m
GRAY=\033[1;37m
NC=\033[0m

all: up

up: $(COMPOSE_FILE)
	@echo "\n${BLUE}BOOTING UP..${NC}\n"
	-@$(MAKE) fix_network
	docker-compose --file $(COMPOSE_FILE) up --build
down: $(COMPOSE_FILE)
	@echo "\n${BLUE}POWERING OFF..${NC}\n"
	docker-compose --file $(COMPOSE_FILE) down
restart: $(COMPOSE_FILE)
	@echo "\n${BLUE}RESTARTING...${NC}\n"
	docker-compose --file $(COMPOSE_FILE) restart

stop_containers:
	@echo "\n${BLUE}stoping containers...${NC}\n"
	-@docker container stop $(shell docker ps -aq) 2>/dev/null

rm_containers:
	@echo "\n${BLUE}removing containers...${NC}\n"
	-@docker container rm $(shell docker ps -aq) 2>/dev/null

rm_images:
	@echo "\n${BLUE}removing images...${NC}\n"
	-@docker rmi $(shell docker image ls -aq) --force 2>/dev/null

reset_network:
	@echo "\n${BLUE}removing docker network..${NC}\n"
	-@docker network rm inception 2>/dev/null

fix_network:
	@echo "\n${BLUE}[fixing docker network]${NC}\n"
	-@ip link delete docker0
	service docker restart

reset_volumes:
	@echo "\n${BLUE} - removing docker volumes and any associated data...${NC}\n"
	-@rm -rf /home/$(LOGIN)/data/wordpress-files/* 2>/dev/null
	-@rm -rf /home/$(LOGIN)/data/database-files/* 2>/dev/null
	-@rm -rf /home/$(LOGIN)/data/nginx-log/* 2>/dev/null
	-@rm -rf /home/$(LOGIN)/data/ssl_certs/* 2>/dev/null
	-@docker volume rm $(shell docker volume ls -q)

clean:
	@echo "\n${BLUE}containers and images cleaning...${NC}\n"
	-@$(MAKE) stop_containers
	-@$(MAKE) rm_containers
	-@$(MAKE) rm_images

fclean: 
	@echo "${BLUE}attempting general project cleaning...\n"
	-@$(MAKE) clean
	-@$(MAKE) reset_network
	-@$(MAKE) reset_volumes

re: fclean up

