vagrant up DRBD9-1
vagrant up DRBD9-2
vagrant up DRBD9-3

vagrant ssh DRBD9-1 -- sudo parted -s -a optimal /dev/sdb -- mklabel gpt mkpart primary xfs 1 -1 set 1 lvm on
vagrant ssh DRBD9-1 -- sudo yum install -y epel-release
vagrant ssh DRBD9-1 -- sudo yum install -y git ansible

vagrant ssh DRBD9-2 -- sudo parted -s -a optimal /dev/sdb -- mklabel gpt mkpart primary xfs 1 -1 set 1 lvm on

vagrant ssh DRBD9-3 -- sudo parted -s -a optimal /dev/sdb -- mklabel gpt mkpart primary xfs 1 -1 set 1 lvm on

echo "DRBD9-1 user vagrant password Enter"
vagrant ssh DRBD9-1 -- sudo passwd vagrant

echo "DRBD9-2 user vagrant password Enter"
vagrant ssh DRBD9-2 -- sudo passwd vagrant

echo "DRBD9-3 user vagrant password Enter"
vagrant ssh DRBD9-3 -- sudo passwd vagrant
