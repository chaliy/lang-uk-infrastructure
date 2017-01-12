.PHONY: all

LANGUKADMIN?=admin
LANGUKIP?=localhost

ssh:
	ssh $(LANGUKADMIN)@$(LANGUKIP)

up:
	docker-compose up