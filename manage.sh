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
            docker build -t ${PROJECT_NAME}-${PROJECT_VERSION}-dev:${CURRENT_COMMIT} -f Dockerfile .
            echo -e "[${GREEN}${PROJECT_NAME}:app${NC}] Starting ${YELLOW}${PROJECT_NAME}-${PROJECT_VERSION}-dev:${CURRENT_COMMIT}${NC} on ${RED}${PYTHON_PORT}${NC}"
            echo -e "[${GREEN}${PROJECT_NAME}:app${NC}] ${RED}AutoRestart Enabled${NC}"
            docker run -it --rm -v $(pwd)/code/app:/app/app -p ${PYTHON_PORT}:80 ${PROJECT_NAME}-${PROJECT_VERSION}-dev:${CURRENT_COMMIT}
        ;; 

        -p|--production)
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