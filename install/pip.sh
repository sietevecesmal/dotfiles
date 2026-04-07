if ! is-executable python3; then
  echo "Skipped: PIP"
  return
fi

apps=(
  ansible
  boto3
)

pip3 install "${apps[@]}"
