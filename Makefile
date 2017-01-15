.PHONY: all

LANGUKADMIN?=admin
LANGUKIP?=localhost

ssh:
	ssh $(LANGUKADMIN)@$(LANGUKIP)

push:
	scp -r ./nginx $(LANGUKADMIN)@$(LANGUKIP):/uk
	scp manifest.pp $(LANGUKADMIN)@$(LANGUKIP):/uk
	scp docker-compose.yml $(LANGUKADMIN)@$(LANGUKIP):/uk
	scp host.Makefile $(LANGUKADMIN)@$(LANGUKIP):/uk/Makefile

up:
	docker-compose up

build:
	docker-compose build

kill:
	docker-compose kill

rm: kill
	docker-compose rm
