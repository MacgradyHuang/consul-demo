#! /bin/bash

set -e

usage() {
  cat <<EOF
  usage: $(basename $0) <org-name/box-name>
EOF
}

main() {

  if [ $# -eq 0 ]; then
    usage
    echo "error: too few arguments"
    exit 1
  fi

  local box_name="$1"
  local box_file="${box_name##*/}.box"

  echo "Creating and provisioning ${box_name}..."
  vagrant up --provision
  echo "Packaging ${box_name}..."
  vagrant package --output "${box_file}"
  echo "Adding box ${box_name}..."
  vagrant box add --force --name "${box_name}" ./"${box_file}"
  echo "Cleaning up..."
  vagrant halt
  vagrant destroy --force
  rm -f ./"${box_file}"
}

main "$@"
