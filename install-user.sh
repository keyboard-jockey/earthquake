#!/bin/bash -e

install_dir=$(readlink -f $(dirname $0))

echo "This is step one of two.  Please also run \"sudo ${install_dir}/install-root.sh\""

if [[ $(id -u) -eq "0" ]] ; then
  echo You must not be root: run without sudo, just: \"$0\" to install.  Exiting.
  exit 1
fi

mv -f ~/.fvwm ~/.fvwm-$(date -Iseconds) || true no previous .fvwm dir.
ln -sf "${install_dir}/fvwm3" ~/.fvwm

# TODO - Ponder name & templating it.
# FIXME - Currently hardcoded in mozilla config files.
whose_page='barbara'
homepage_path="${install_dir}/www/${whose_page}shomepage.html"

test -e "${homepage_path}" || echo '<html><title>Your friend needs to create your homepage</title></html>' > "${homepage_path}"


