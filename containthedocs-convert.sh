#!/usr/bin/env bash

set -x

if [ "$#" -ne 1 ]; then
	echo "Usage $0 <file.docx>"
	exit 1
fi

COMMAND="scripts/convertdocx.sh $1"

. ./containthedocs-image

exec docker run --rm -it \
  -v "$PWD":"$PWD" --workdir "$PWD" \
  ${DOCKER_RUN_ARGS} \
  -e "LOCAL_USER_ID=$(id -u)" \
  ${DOC_IMG} ${COMMAND}
