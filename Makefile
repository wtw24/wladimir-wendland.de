deploy: build create-build-folder rsync-deployments link-to-deployed clear-previous-build-folders

build:
	hugo --gc --minify

create-build-folder:
	ssh -o StrictHostKeyChecking=no ${USER}@${HOST} -p ${PORT} 'rm -rf ${PATH}/${BUILD_NUMBER}'
	ssh -o StrictHostKeyChecking=no ${USER}@${HOST} -p ${PORT} 'mkdir -p ${PATH}/${BUILD_NUMBER}'

rsync-deployments:
	cd public && rsync --verbose --archive --compress --delete -O . ${USER}@${HOST}:${PATH}/${BUILD_NUMBER}

link-to-deployed:
	ssh -o StrictHostKeyChecking=no ${USER}@${HOST} -p ${PORT} 'cd ${PATH} && ln -sfn ${BUILD_NUMBER} deployed'

clear-previous-build-folders:
	ssh -o StrictHostKeyChecking=no ${USER}@${HOST} -p ${PORT} 'find ${PATH}/ -maxdepth 1 -mtime +1 -type d -exec rm -r {} \;'

ping:
	echo "pong"