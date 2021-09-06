sudo yum install epel-release
sudo amazon-linux-extras install epel
sudo yum install ansible

sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install java-1.8.0-openjdk -y

**change java version:**
alternatives --config java
or 
sudo update-alternatives --config java