#!/bin/bash

BLUE='\033[1;34m'
CYAN='\033[0;36m'
RED='\033[1;31m'
NC='\033[0m' # No color

function main {
    echo -e "\n${BLUE}Welcome to my story generator!$NC"
    echo -e "Press Enter at any point to exit the story generator."
    
    NUMBER=0

    # Main calls first prompt
    # All others are called only when input is validated
    input_number
}

function is_exit_input {
# read -s -N 1 -t 1 key
    if [[ $1 == q ]] ; then
        echo -e "${RED}Ending story generator."
        exit 0
    fi
}

# call echo before each function

function input_number {
    number='^[0-9]+$'

    read -p "Enter a number: " NUMBER

    is_exit_input $NUMBER
    
    if ! [[ $NUMBER =~ $number ]] ; then
        echo -e "${RED}Error: $NUMBER is not a valid number$NC\n"
        input_number
    else 
        input_unit_measurement
    fi
}

function input_unit_measurement { 
    # only support commutable units
    read -p "Enter a unit of distance: " UNIT

    is_exit_input $UNIT

    if ! [[ $UNIT =~ "mile" ]] ; then
        echo -e "${RED}Error: $UNIT is not a valid unit of distance$NC"
        echo -e "Try entering 'mile'"
        input_unit_measurement
    else 
        input_place
    fi

}

function input_place {
    read -e -p "Enter a place:" PLACE
    # DO BASIC STRING VALIDATIOn
    if ! [[ $PLACE =~ "test" ]] ; then
        echo -e "${RED}Error: $PLACE is not a place$NC"
        echo -e "Please enter only alphabetical characters"
        input_place
    else 
        input_adj
    fi
}

function input_adj {
        echo
        read -e -p "Enter an adjective:" PLACE
    # DO BASIC STRING VALIDATIOn
    if ! [[ $PLACE =~ "test" ]] ; then
        echo -e "${RED}Error: $PLACE is not a place$NC"
        echo -e "Please enter only alphabetical characters"
        input_adj
    else 
        input_noun
    fi
}

function input_noun {
        echo
        read -e -p "Enter a noun:" PLACE
    # DO BASIC STRING VALIDATIOn
    if ! [[ $PLACE =~ "test" ]] ; then
        echo -e "${RED}Error: $PLACE is not a place$NC"
        echo -e "Please enter only alphabetical characters"
        input_adj
    else 
        exit 0;
    fi
}

main
