#!/bin/sh
# Author: Hunter Mellema

PROJECT_NAME=template

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
# Colors for terminal outputs
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33'
BLUE='\033[1;34m'
BOLD='\033[1m'
NC='\033[0m'


main() {
    action=$1
    case $action in 
        -d|--development)
            echo -e "[${GREEN}${PROJECT_NAME}:app${NC}] Building new docker image ${YELLOW}${PROJECT_NAME}:dev${NC}"
            docker build -t ${PROJECT_NAME}:dev -f dev.Dockerfile .
            echo -e "[${GREEN}${PROJECT_NAME}:app${NC}] Starting ${YELLOW}${PROJECT_NAME}:dev${NC} on ${RED}8080${NC}"
            echo -e "[${GREEN}${PROJECT_NAME}:app${NC}] ${RED}AutoRestart Enabled${NC}"
            docker run -it --rm -p 8080:80 ${PROJECT_NAME}:dev
        ;; 

        -p|--production)
        ;;

        -t|--test)
            echo -e "[${GREEN}${PROJECT_NAME}:app${NC}] Building new docker image ${YELLOW}${PROJECT_NAME}:test${NC}"
            # check that production docker image exists
            if [[ "$(docker images -q ${PROJECT_NAME}:prod 2> /dev/null)" == "" ]]; then
                echo -e "[${GREEN}${PROJECT_NAME}:app${NC}] Production image does not exist ${RED}${PROJECT_NAME}:prod${NC}"
                echo -e "[${GREEN}${PROJECT_NAME}:app${NC}] Building new production image ${YELLOW}${PROJECT_NAME}:prod${NC}"
                docker build -t ${PROJECT_NAME}:prod -f prod.Dockerfile .
            fi
            echo -e "[${GREEN}${PROJECT_NAME}:app${NC}] Building new test docker image ${YELLOW}${PROJECT_NAME}:test${NC}"
            docker build -t ${PROJECT_NAME}:test --build-arg PROD_CONTAINER=${PROJECT_NAME}:prod -f test.Dockerfile .

            echo -e "[${GREEN}${PROJECT_NAME}:app${NC}] Running Tests in ${RED}${PROJECT_NAME}:test${NC}"
            docker run ${PROJECT_NAME}:test
        ;;

        -l|--local-build)
            echo -e "[${GREEN}template:app${NC}] Building new docker image ${YELLOW}template:local${NC}"
            docker build -t ${PROJECT_NAME}:local -f prod.Dockerfile .
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