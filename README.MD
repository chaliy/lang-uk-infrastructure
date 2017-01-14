# Instructions


At host
```
# Dependecies
sudo apt update -y && sudo apt install -y puppet make

# Work directory
sudo mkdir /uk && sudo chown -R $(whoami) /uk
```

At local computer
```
# Copy files to host
make push
```

At host
```
cd /uk
sudo make apply
```