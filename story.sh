#!/bin/bash

BLUE='\033[1;34m'
CYAN='\033[0;36m'
RED='\033[1;31m'
NC='\033[0m' # No color

NUMBER=0
UNIT=''
PLACE=''
ADJ=''
NOUN=''


function main {
    echo -e "\n${BLUE}Welcome to my story generator!$NC\n"
    # Main calls first prompt
    # All others are called only when input is validated
    input_number
}

# function is_exit_input {
# # read -s -N 1 -t 1 key
#     if [[ $1 == q ]] ; then
#         echo -e "${RED}Ending story generator."
#         exit 0
#     fi
# }

function create_story {
    # TODO: Write to file
    echo -e "\nHere is your story: \n${CYAN}One day Anna was walking her $NUMBER $UNIT commute to $PLACE and found a $ADJ $NOUN on the ground.${NC}"
}

function input_number {
    number='^[0-9]+$'
    read -p "Enter a number: " NUMBER_INPUT    
    if ! [[ $NUMBER_INPUT =~ $number ]] ; then
        echo -e "${RED}Error: $NUMBER_INPUT is not a valid number$NC\n"
        input_number
    else 
        NUMBER=$NUMBER_INPUT
        input_unit_measurement
    fi
}

function input_unit_measurement { 
    # only support commutable units
    read -p "Enter a unit of distance: " UNIT_INPUT
    if ! [[ $UNIT_INPUT =~ "mile" ]] ; then
        echo -e "${RED}Error: $UNIT_INPUT is not a valid unit of distance$NC"
        echo -e "Try entering 'mile'"
        input_unit_measurement
    else 
        UNIT=$UNIT_INPUT
        input_place
    fi

}

function input_place {
    read -e -p "Enter a place: " PLACE_INPUT
    # DO BASIC STRING VALIDATIOn
    if ! [[ $PLACE_INPUT =~ "test" ]] ; then
        echo -e "${RED}Error: $PLACE_INPUT is not a place$NC"
        echo -e "Please enter only alphabetical characters"
        input_place
    else 
        PLACE=$PLACE_INPUT
        input_adj
    fi
}

function input_adj {
    read -e -p "Enter an adjective: " ADJ_INPUT
    # DO BASIC STRING VALIDATIOn
    if ! [[ $ADJ_INPUT =~ "test" ]] ; then
        echo -e "${RED}Error: $ADJ_INPUT is not an adjective$NC"
        echo -e "Please enter only alphabetical characters"
        input_adj
    else 
        ADJ=$ADJ_INPUT
        input_noun
    fi
}

function input_noun {
    read -e -p "Enter a noun: " NOUN_INPUT
    # DO BASIC STRING VALIDATIOn
    if ! [[ $NOUN_INPUT =~ "test" ]] ; then
        echo -e "${RED}Error: $NOUN_INPUT is not a noun$NC"
        echo -e "Please enter only alphabetical characters"
        input_noun
    else 
        NOUN=$NOUN_INPUT
        create_story
        exit 0;
    fi
}

main
