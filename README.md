# Simple Load Balancer (Educational Project)

This project aims to create a simple load balancer using HAProxy, Docker, and Certbot for SSL certificate management (with Let's Encrypt).

The load balancer distributes network or application traffic across a number of servers to increase the application's availability and reliability.

## Project Structure

The project is divided into two main parts:

1. **Demo**: This is a simple HTTP server built using Apache HTTP Server. It serves a static HTML page.

2. **LoadBalancer**: This is the load balancer built using HAProxy. It can balance the load between two backend servers. It also has the capability to renew SSL certificates using Certbot.

## How it Works

The load balancer is built as a Docker image and is configured using environment variables. These variables include the domain name, email address, backend URLs, and a flag to enable HTTPS.

The [`Makefile`](command:_github.copilot.openRelativePath?%5B%22Makefile%22%5D "Makefile") provides commands to build and push the Docker images for the load balancer and the demo server. It also provides commands to run the demo locally and to stop it.

The [`compose.yml`](command:_github.copilot.openRelativePath?%5B%22compose.yml%22%5D "compose.yml") file is used to define the services for the load balancer and the backend servers. It also defines the network that these services will use.

The load balancer uses two configuration templates for HAProxy: one for HTTP and one for HTTPS. The appropriate template is chosen based on the `ENABLE_HTTPS` environment variable. The chosen template is then filled in with the backend URLs and (in the case of HTTPS) the path to the SSL certificate.

The SSL certificate is renewed using a script that is run by a cron job. The script uses Certbot to renew the certificate and then reloads HAProxy.

## How to Use

To use this project, you need to have Docker installed on your machine. You can then use the commands in the [`Makefile`](Makefile) to build and run the project. You will need to provide your own values for the environment variables in the [`compose.yml`](command:_github.copilot.openRelativePath?%5B%22compose.yml%22%5D "compose.yml") file and the [`Dockerfile`](Demo/Dockerfile) for the load balancer.

Please note that this project is intended for demonstration purposes and may not be suitable for production use without further modifications.