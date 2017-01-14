.PHONY: all

apply:
	puppet module install puppetlabs/apt
	puppet module install puppetlabs/stdlib
	puppet module install attachmentgenie/ufw
	puppet module install garethr-docker
	
	puppet apply manifest.pp

manual:
	mkdir /uk
	chown -R $(whoami) /uk
	apt update -y
	apt install -y puppet make
