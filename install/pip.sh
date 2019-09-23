if ! is-executable python; then
  echo "Skipped: PIP"
  return
fi

sudo easy_install pip

apps=(
  tornado
  nose
  ansible
  awscli
  boto
  boto3
  # docker
  pip-upgrade-outdated
)

pip3 install --user "${apps[@]}"
