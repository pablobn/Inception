# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pbengoec <pbengoec@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/06 13:10:17 by pbengoec          #+#    #+#              #
#    Updated: 2024/05/06 19:00:31 by pbengoec         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Docker compose file
DOC_FILE = ./srcs/docker-compose.yml

# Folder volumes
FD_WORD = /home/pbengoec/data/wordpress
FD_MARIA = /home/pbengoec/data/mariadb

# colors
R = \033[31m
G = \033[32m
X = \033[0m

all: build run 

build: 
	@echo "${G}Building docker-compose...${X}"
	@mkdir -p ${FD_WORD}
	@mkdir -p ${FD_MARIA}
	@docker-compose -f ${DOC_FILE} build
	@echo "${G}Building completed${X}"

run: 
	@echo "${G}Starting inception...${X}"
	@docker-compose -f ${DOC_FILE} up -d
	@echo "${G}Inception started${X}"


stop:
	@echo "${R}Stopping docker-compose...${X}"
	@docker-compose -f ${DOC_FILE} stop
	@echo "${R}Docker-compose stopped${X}"

down:
	@echo "${R}Removing docker-compose...${X}"
	@docker-compose -f ${DOC_FILE} down
	@echo "${R}Docker-compose removed${X}"

clean: stop down

re: down build run

.PHONY: all build run clean stop down re