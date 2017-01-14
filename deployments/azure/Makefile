.PHONY: all

RESOURCE_GROUP?=workplace
PORT=80

login:
	start "" https://aka.ms/devicelogin
	az login

group:
	az group create -n $(RESOURCE_GROUP) -l "West Europe"

vm:
	az vm create -n ubuntu -g $(RESOURCE_GROUP) \
		--image canonical:ubuntuserver:16.04.0-LTS:16.04.201611150 \
		--size Basic_A3 \
		--storage-type Standard_LRS \
		--admin-username ops \
		--ssh-key $(HOME)/.ssh/id_rsa.pub \
		--public-ip-address-dns-name 'ubuntu-$(RESOURCE_GROUP)'

open:
	az network nsg rule create -g $(RESOURCE_GROUP) \
		--access Allow \
		--destination-address-prefix 'Internet' \
		--destination-port-range $(PORT) \
		--direction Outbound \
		--nsg-name 'ubuntuNSG' \
		--name 'allow-$(PORT)' \
		--protocol Tcp \
		--source-address-prefix '*' \
		--source-port-range $(PORT)
    	
ssh:
	ssh ops@ubuntu-$(RESOURCE_GROUP).westeurope.cloudapp.azure.com

address:
	'ubuntu-$(RESOURCE_GROUP).westeurope.cloudapp.azure.com'

push:
	scp -r ../../nginx ops@ubuntu-$(RESOURCE_GROUP).westeurope.cloudapp.azure.com:/uk
	scp ../../docker-compose.yml ops@ubuntu-$(RESOURCE_GROUP).westeurope.cloudapp.azure.com:/uk
	scp ../../manifest.pp ops@ubuntu-$(RESOURCE_GROUP).westeurope.cloudapp.azure.com:/uk
	scp ../../host.Makefile ops@ubuntu-$(RESOURCE_GROUP).westeurope.cloudapp.azure.com:/uk/Makefile


clean:
	az vm delete -n ubuntu -g $(RESOURCE_GROUP)
