#!/bin/bash

# Function to check if the port number is valid (1-65535)
validate_port() {
  if [[ $1 -lt 1 || $1 -gt 65535 ]]; then
    echo -e "\e[31mInvalid port number! Please provide a port number between 1 and 65535.\e[0m"
    exit 1
  fi
}

# Function to convert time from minutes (e.g., 30m) to seconds
convert_time_to_seconds() {
  local time_value=$1
  local unit=${time_value: -1}
  local number=${time_value%?}

  if [[ "$unit" == "m" ]]; then
    echo $((number * 60))
  else
    echo -e "\e[31mInvalid time format! Please specify time in minutes (e.g., 30m).\e[0m"
    exit 1
  fi
}

# Function to open a port
open_port() {
  echo -e "\e[32mOpening port $1...\e[0m"
  sudo firewall-cmd --add-port=$1/tcp --permanent
  sudo firewall-cmd --reload
}

# Function to close a port
close_port() {
  echo -e "\e[32mClosing port $1...\e[0m"
  sudo firewall-cmd --remove-port=$1/tcp --permanent
  sudo firewall-cmd --reload
}

# Function to check if the user wants the port open temporarily
open_temporary() {
  read -p "Do you want to open the port temporarily for a period of time (yes/no)? " temp_answer
  if [[ "$temp_answer" == "yes" ]]; then
    read -p "Enter the time period (e.g., 30m for 30 minutes): " time_period
    period=$(convert_time_to_seconds $time_period)
    echo -e "\e[32mOpening port $1 for $time_period...\e[0m"
    sudo firewall-cmd --add-port=$1/tcp
    sleep $period
    echo -e "\e[32mTime period expired. Closing port $1...\e[0m"
    sudo firewall-cmd --remove-port=$1/tcp
    sudo firewall-cmd --reload
    exit 0
  else
    open_port $1
  fi
}

# Main script logic
if [ $# -lt 2 ]; then
  echo -e "\e[31mUsage: $0 <open|close> <port_number>\e[0m"
  exit 1
fi

ACTION=$1
PORT=$2

validate_port $PORT

case $ACTION in
open)
  open_temporary $PORT
  ;;
close)
  close_port $PORT
  ;;
*)
  echo -e "\e[31mInvalid action! Use 'open' or 'close'.\e[0m"
  exit 1
  ;;
esac
