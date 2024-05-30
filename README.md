# Unofficial containerized Hiveon ASIC Hub

This repository contains a Dockerfile to create a Docker image for Hiveon ASIC Hub on an Ubuntu 24.04 base. The image includes essential dependencies and sets up Hiveon ASIC Hub service.

Built using official guide as reference point: https://hiveon.com/knowledge-base/ASIC-Hub/getting_started/installation-linux/

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Build Arguments](#build-arguments)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

Before building and running this Docker image, ensure you have the following installed:

- Docker: [Installation Guide](https://docs.docker.com/get-docker/)

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/soudasuwa/hiveon-asic-hub.git
    cd hiveon-asic-hub
    ```

2. Build the Docker image:

    ```bash
    docker build -t soudasuwa/hiveon-asic-hub:latest .
    ```

## Usage

To run a container from the built image, use the following command:

```bash
docker run -d -p 8800:8800 --name asic-hub soudasuwa/hiveon-asic-hub:latest
```

This will start a container named asic-hub using the `soudasuwa/hiveon-asic-hub:latest` image.  
Hiveon ASIC Hub is now accesible on port `8800`.

## Build Arguments

You can customize the build process using the following build arguments:

- `HUB_CHANNEL`: The build channel, default: `stable`.
- `HUB_BUILD`: The build version, default `latest`.
- `HUB_REPO_URL`: The repository URL binary downloads, default: `https://download.hiveos.farm/hub`.
- `FARM_HASH`: The HiveOS farm hash where to register deployed ASIC Hub.

Example usage of build arguments:

```bash
docker build --build-arg HUB_CHANNEL=stable --build-arg HUB_BUILD=latest --build-arg HUB_REPO_URL=https://download.hiveos.farm/hub --build-arg FARM_HASH=yourfarmhash40chars -t soudasuwa/hiveon-asic-hub:latest .
```

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Commit your changes (`git commit -am 'Add new feature'`).
5. Push to the branch (`git push origin feature-branch`).
6. Create a new pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

For any issues or questions, please open an issue in this repository.
