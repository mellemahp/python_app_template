#!/bin/sh
# Author: Hunter Mellema

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
            echo -e "[${GREEN}template:app${NC}] Building new docker image ${YELLOW}template:dev${NC}"
            docker build -t template:dev -f dev.Dockerfile .
            echo -e "[${GREEN}template:app${NC}] Starting ${YELLOW}template:dev${NC} on ${RED}8080${NC}"
            docker run --rm -p 8080:80 template:dev
        ;; 

        -p|--production)
        ;;

        -t|--test)
        ;;

        -l|--local-build)
            echo -e "[${GREEN}template:app${NC}] Building new docker image ${YELLOW}template:local${NC}"
            docker build -t template:local -f prod.Dockerfile .
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