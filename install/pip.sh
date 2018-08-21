if ! is-executable python; then
  echo "Skipped: PIP"
  return
fi

sudo easy_install pip

apps=(
  ansible
  awscli
  boto
  pip-upgrade-outdated
)

pip install "${apps[@]}"