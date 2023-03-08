if ! is-executable python; then
  echo "Skipped: PIP"
  return
fi

# sudo easy_install pip

apps=(
  ansible
  boto
  boto3
  pip-upgrade-outdated
)

pip3 install "${apps[@]}"
