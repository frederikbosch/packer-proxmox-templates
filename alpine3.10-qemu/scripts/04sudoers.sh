set -eux

# this configuration allows the alpine account to sudo su - without needing a password

# Install sudo
apk add sudo shadow

# Create Initial User
adduser -D alpine -G wheel

# allow sudo without password
echo "Defaults exempt_group=wheel" > /etc/sudoers
echo "%wheel ALL=NOPASSWD:ALL" >> /etc/sudoers

# allows ssh login without the user being locked
# https://unix.stackexchange.com/questions/193066/how-to-unlock-account-for-public-key-ssh-authorization-but-not-for-password-aut
usermod -p '*' alpine

# the root user is also being blocked from ssh login in sshd_config
# remove root password
usermod -p '*' root

# lock root account
#passwd -l root
