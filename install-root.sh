#!/bin/bash -e

install_dir=$(readlink -f $(dirname $0))

echo "This is step two of two.  Please also run ${install_dir}/install-user.sh"

if [[ $(id -u) -ne "0" ]] ; then
  echo You must be root: run \"sudo $0\" to install.  Exiting.
  exit 1
fi


# backups will be .~1~, .~2~, depending how many times it's run.  Investigate other options.
cp -fr --preserve=mode,timestamps \
  --backup=numbered "${install_dir}"/root/* /

# TODO only run update-grub when it's actually changed.
# FIXME figure out which files to not backup because they'll be included!
# FIXME or, better yet, place all backup files in a separate tree.

apt install fvwm3 vim git
