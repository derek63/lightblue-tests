#!/bin/sh

# requires resttest (https://github.com/lightblue-platform/pyresttest) and argparse module

if [ "x$1" == "x" ]; then
    echo "Must specify base URL as first command line argument."
    exit 1
fi

# Global:
INTERACTIVE="False"
LOGGING_LEVEL="debug"
if [ "x$2" != "x" ]; then
    LOGGING_LEVEL=$2
fi
export ENTITY_NAME="nmalik-$(date +'%Y%m%d%H%M%S')";

# Metadata:
export ENTITY_VERSION_1="1.0.0";
export ENTITY_VERSION_2="2.0.0"

# CRUD:
export ENTITY_VERSION="${ENTITY_VERSION_2}"

echo "Running tests for new entity: $ENTITY_NAME"

python -c "import resttest; args=dict(); args['url']='$1'; args['test']='all.yaml'; args['log']='$LOGGING_LEVEL'; args['interactive']=$INTERACTIVE; args['print_bodies']=$INTERACTIVE; resttest.main(args)" 2>&1

#unset ENTITY_NAME
#unset ENTITY_VERSION_1
#unset ENTITY_VERSION_2
