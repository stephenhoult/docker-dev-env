# docker-dev-env

A php, mysql, nginx and mailcatcher enabled local dev environment using docker.

## Usage
Create a .env file from the .env.example file and adjust the values as needed.

### First time usage
Enter the root directory of the project and run the following commands:
- `make network` to create the network.
- `make start` to build and stand up the containers.

### Subsequent usage
- `make start` to stand up the containers.
- `make stop` to stop the containers.

### Changing Environment Variables
When changing an environment variable you must rebuild the containers. To do this, run the following command:
- `make refresh`.

## Now what?
Add your project files to the `src` directory and build something awesome!

### Notes
See the makefile for more commands.

The nginx.conf is set to listen to any server:

`server_name _;`

If you'd like to listen to a specific server name, adjust the `server_name` directive in the `nginx.conf` file.

e.g. `server_name .testing.local`