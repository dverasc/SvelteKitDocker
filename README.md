# SvelteKitDocker

Commands to build and run:

Build

sudo docker build --no-cache -t nameofthing .

or

sudo docker build --platform linux/amd64 --no-cache -t nameofthing .



I included the platform in the second build command because I started using an M1 laptop and ran into issues when building images and then pushing those images to third party cloud platforms like AWS

Run 

sudo docker run --restart=always --publish 3000:3000 --name=nameofthing -d nameofthing
