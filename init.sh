#!/bin/sh
# http://www.ruanyifeng.com/blog/2017/11/bash-set.html
set -euo pipefail
DEMO_PROJECT_NAME="guardian-spring-cloud-demo"
DEMO_VERSION="0.0.1"
DEMO_REPO="git@repo.advai.org:zhongyi.dai/guardian-spring-cloud-demo.git"
function usage() {
    echo "usage: ./init.sh PROJECT_NAME VERSION"
    echo ""
    echo "PROJECT_NAME like guardian-spring-cloud-demo-demo, use it to generate "
    echo "guardian-spring-cloud-demo-demo-client, guardian-spring-cloud-demo-demo-core"
    echo "and guardian-spring-cloud-demo-demo-service module."
    echo ""
    echo "VERSION is this project initial version."
}
if [ "$#" -gt 1 ]; then
    PROJECT_NAME=$1
    VERSION=${DEMO_VERSION}
    if [ -z "$1" ]; then
        VERSION=$2
    fi
    CURRENT_PATH="./${PROJECT_NAME}"
    git clone ${DEMO_REPO} ${PROJECT_NAME}
    rm -rf "${CURRENT_PATH}/.git" "${CURRENT_PATH}/init.sh"
    find ${CURRENT_PATH} -type f | xargs sed -i "s/${DEMO_PROJECT_NAME}/${PROJECT_NAME}/g; s/${DEMO_VERSION}/${VERSION}/g"
    mv "${CURRENT_PATH}/${DEMO_PROJECT_NAME}-client" "${CURRENT_PATH}/${PROJECT_NAME}-client"
    mv "${CURRENT_PATH}/${DEMO_PROJECT_NAME}-core" "${CURRENT_PATH}/${PROJECT_NAME}-core"
    mv "${CURRENT_PATH}/${DEMO_PROJECT_NAME}-service" "${CURRENT_PATH}/${PROJECT_NAME}-service"
else
    usage
fi
