# Check if system is Debian or Ubuntu and install Docker
if [ -e /etc/debian_version ]; then

   # Check if Ubuntu
   if grep -qi ubuntu /etc/os-release; then

       # Remove any existing Docker installs
       sudo apt-get remove docker docker.io containerd runc

       # Update packages and install dependencies
       sudo apt-get update
       sudo apt-get install ca-certificates curl gnupg -y

       # Add Docker GPG key
       sudo mkdir -m 0755 -p /etc/apt/keyrings
       curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

   # Else must be Debian
   else

       # Remove any existing Docker packages
       for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

       # Update packages and install dependencies 
       sudo apt-get update
       sudo apt-get install ca-certificates curl gnupg

       # Add Docker GPG key
       sudo install -m 0755 -d /etc/apt/keyrings
       curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

   fi

   # Add Docker repository 
   echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

   # Install Docker and dependencies
   sudo apt-get update
   sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose -y

# Not Debian/Ubuntu, exit  
else
   echo "Incompatible distribution"
fi
