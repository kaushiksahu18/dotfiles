#!/bin/bash

# Function to validate port number
validate_port() {
  if ! [[ $1 =~ ^[0-9]+$ ]] || [ $1 -lt 1 ] || [ $1 -gt 65535 ]; then
    echo -e "\e[31mError: Invalid port number '$1'. Must be between 1 and 65535.\e[0m"
    exit 1
  fi
}

# Function to open a port
open_port() {
  sudo firewall-cmd --add-port=$1/tcp --zone=public --permanent
  echo -e "\e[32mPort $1 opened successfully.\e[0m"
}

# Function to close a port
close_port() {
  sudo firewall-cmd --remove-port=$1/tcp --zone=public --permanent
  echo -e "\e[32mPort $1 closed successfully.\e[0m"
}

# Function to reload the firewall
reload_firewall() {
  sudo firewall-cmd --reload
  echo -e "\e[32mFirewall reloaded successfully.\e[0m"
}

# Main script logic
if [ $# -ne 2 ]; then
  echo -e "\e[33mUsage: $0 <o|1|c|0> <port_number>\e[0m"
  exit 1
fi

ACTION=$1
PORT=$2

validate_port $PORT

case $ACTION in
  o|1)
    open_port $PORT
    ;;
  c|0)
    close_port $PORT
    ;;
  *)
    echo -e "\e[31mInvalid action! Use 'o' or '1' for open and 'c' or '0' for close.\e[0m"
    exit 1
    ;;
esac

reload_firewall
