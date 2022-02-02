build:
	hugo --gc --minify

deploy: create-build-folder rsync-deployments link-to-deployed clear-previous-build-folders

create-build-folder:
	ssh -o StrictHostKeyChecking=no ${DEPLOY_USER}@${DEPLOY_HOST} -p ${DEPLOY_PORT} 'rm -rf ${DEPLOY_PATH}/${BUILD_NUMBER}'
	ssh -o StrictHostKeyChecking=no ${DEPLOY_USER}@${DEPLOY_HOST} -p ${DEPLOY_PORT} 'mkdir -p ${DEPLOY_PATH}/${BUILD_NUMBER}'

rsync-deployments:
	cd public && rsync --verbose --archive --compress --delete -O . ${DEPLOY_USER}@${DEPLOY_HOST}:${DEPLOY_PATH}/${BUILD_NUMBER}

link-to-deployed:
	ssh -o StrictHostKeyChecking=no ${DEPLOY_USER}@${DEPLOY_HOST} -p ${DEPLOY_PORT} 'cd ${DEPLOY_PATH} && ln -sfn ${BUILD_NUMBER} deployed'

clear-previous-build-folders:
	ssh -o StrictHostKeyChecking=no ${DEPLOY_USER}@${DEPLOY_HOST} -p ${DEPLOY_PORT} 'find ${DEPLOY_PATH}/ -maxdepth 1 -mtime +1 -type d -exec rm -r {} \;'
