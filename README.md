## Scripts

This repo contains various scripts to help setup servers.

### Usage
Clone this repo:  
`git clone https://github.com/somaticbits/scripts`

And use the script you need.

### ubuntu
#### Steps
- Add a new user:
    - Create a new user
    - Copy the root ssh key to new user
    - Disable password authentification on SSH
- Add an NGINX installation (optional):
    - Prompt for deployment path and domain
    - Create basic NGINX conf and enable it
    - Create certificate for domain (optional)
#### Usage
To set up your Ubuntu 22.04 server:
1. Enter folder
2. Change permissions:
`chmod +x *`
3. Run `setup.sh`:
`./setup.sh`
4. Answer questions
5. Enjoy!
