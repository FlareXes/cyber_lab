# Offensive Lab
This project provides a simple script to manage Docker Compose setups for cybersecurity practice lab environment. It includes configurations for running various services like DVWA (Damn Vulnerable Web Application) and Caddy.

## Requirements

- Docker
- Docker Compose

## Usage

1. Clone this repository:

    ```bash
    git clone https://github.com/FlareXes/offensive_lab.git
    cd offensive_lab
    ```

2. Run the setup script with `sudo` to start or stop the services:

    ```bash
    sudo ./setup.sh up
    ```

    ```bash
    sudo ./setup.sh down
    ```

    The script starts or stops the Docker Compose services defined in the `docker-compose.yml` files found in the project directories. It also performs additional configurations specific to the services.

## Directory Structure

- `dvwa`: Contains the Docker Compose configuration for DVWA.
- `caddy`: Contains the Docker Compose configuration for Caddy.
- `setup.sh`: Bash script to manage Docker Compose setups.

## Notes

- Ensure Docker and Docker Compose are installed on your system before running the setup script.
- The script requires superuser permissions to modify system files and manage Docker services.

# License
This work by [FlareXes](https://github.com/FlareXes) is Licensed under the terms of [CC0v1.0 Universal](LICENSE).
