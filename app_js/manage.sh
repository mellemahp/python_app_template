#!/bin/sh
# Author: Hunter Mellema

#### Project Info ####
PROJECT_NAME='template'
PROJECT_VERSION=0.0.1
CURRENT_COMMIT=$(git rev-parse HEAD | cut -c1-5)


#### Help and Usage ####
HELP_MSG=" 
A Simple Python Web Application Template management script  \n
                                                            \n
usage: manage [option]                                      \n
                                                            \n
Short options:          Long Options:                       \n
        -d                  --development                   \n
        -p                  --production                    \n
        -t                  --test                          \n
        -l                  --local-build                   \n
"

#### Pretty Colors! ####
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33'
BLUE='\033[1;34m'
BOLD='\033[1m'
NC='\033[0m'

##### Actual Code #####
main() {
    action=$1
    case $action in 
        -d|--development)
            echo -e "[${GREEN}${PROJECT_NAME}:app${NC}] Building new docker image ${YELLOW}${PROJECT_NAME}-${PROJECT_VERSION}-dev:${CURRENT_COMMIT}${NC}"
            docker build -t ${PROJECT_NAME}-${PROJECT_VERSION}-dev:${CURRENT_COMMIT} -f dev.Dockerfile .
            echo -e "[${GREEN}${PROJECT_NAME}:app${NC}] Starting ${YELLOW}${PROJECT_NAME}-${PROJECT_VERSION}-dev:${CURRENT_COMMIT}${NC} on ${RED}8080${NC}"
            echo -e "[${GREEN}${PROJECT_NAME}:app${NC}] ${RED}AutoRestart Enabled${NC}"
            docker run -it --rm -v $(pwd)/code/app:/app/app -v $(pwd)/code/client:/app/client -p 8080:80 ${PROJECT_NAME}-${PROJECT_VERSION}-dev:${CURRENT_COMMIT}
        ;; 

        -p|--production)
        ;;

        -t|--test)
            echo -e "[${GREEN}${PROJECT_NAME}:app${NC}] Building new docker image ${YELLOW}${PROJECT_NAME}-${PROJECT_VERSION}-test:${CURRENT_COMMIT}${NC}"
            # check that production docker image exists
            echo -e "[${GREEN}${PROJECT_NAME}:app${NC}] Re-building production image ${YELLOW}${PROJECT_NAME}-${PROJECT_VERSION}-prod:${CURRENT_COMMIT}${NC}"
            docker build -t ${PROJECT_NAME}-${PROJECT_VERSION}-prod:${CURRENT_COMMIT} -f prod.Dockerfile .

            echo -e "[${GREEN}${PROJECT_NAME}:app${NC}] Building new test docker image ${YELLOW}${PROJECT_NAME}-${PROJECT_VERSION}-test:${CURRENT_COMMIT}${NC}"
            docker build -t ${PROJECT_NAME}-${PROJECT_VERSION}-test:${CURRENT_COMMIT} --build-arg PROD_CONTAINER=${PROJECT_NAME}-${PROJECT_VERSION}-prod:${CURRENT_COMMIT} -f test.Dockerfile .

            echo -e "[${GREEN}${PROJECT_NAME}:app${NC}] Running Tests in ${RED}${PROJECT_NAME}-${PROJECT_VERSION}-test:${CURRENT_COMMIT}${NC}"
            docker run ${PROJECT_NAME}-${PROJECT_VERSION}-test:${CURRENT_COMMIT}
        ;;

        "") 
            echo -e "\n${BOLD}No option provided. Please provide an action${NC} \n"
            echo -e $HELP_MSG
        ;; 
        *)
            echo -e "\n${BOLD}Option ${NC}${RED}$1${NC}${BOLD} not supported${NC} \n"
            echo -e $HELP_MSG
        ;;
    esac
}

main "$@"