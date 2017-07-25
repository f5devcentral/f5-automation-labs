#!/usr/bin/env bash

set -x

. ./containthedocs-image

WD=$PWD

mkdir -p tmp pdf
cd docs
find . -type f ! -path "./class*" | tar -cf ../tmp/base.tar -T -
cd ..

for i in `find . -maxdepth 2 -name class* -type d`
do
	CLASS=`basename $i`
	cd $WD/tmp
	mkdir $WD/tmp/$CLASS
	cd $WD/tmp/$CLASS
	tar -xf $WD/tmp/base.tar
	cp -Rf $WD/docs/$CLASS .
	docker run --rm -it \
	   -v $PWD:$PWD --workdir $PWD \
	   ${DOCKER_RUN_ARGS} \
	   -e "LOCAL_USER_ID=$(id -u)" \
	   ${DOC_IMG} make latexpdf

	PDFPATH=`ls _build/latex/*.pdf`
	PDFNAME=${PDFPATH##*/}
	NAME=${PDFNAME%.pdf}
	cp $PDFPATH $WD/pdf/$NAME-$CLASS.pdf
	cd ..
	rm -Rf $WD/tmp/$CLASS
done 
cd ..
rm -Rf $WD/tmp

echo ""
echo "Done... per-class PDF's are in the ./pdf directory"
