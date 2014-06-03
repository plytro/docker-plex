docker plex
===========

This is a Dockerfile to set up (https://plex.tv/ "Plex Media Server")

### Build from docker file

```
git clone git@github.com:plytro/docker-plex.git
cd docker-plex
docker build -t plex . 
```

### Run

`docker run -d -h ${hostname} -v ${plex_config_dir}:/config -v ${plex_data_dir}:/data -p 32400:32400  plex`

On the initial run, you will not be able to connect to plex without authenticating. You need to edit `${plex_config_dir}/Library/Application\ Support/Plex\ Media\ Server/Preferences.xml` and modify the Preference element to include `allowedNetworks`.

```
<Preferences .... allowedNetworks="127.0.0.1,{your_subnet}/255.255.255.0" ... />
```
Then restart the existing container created with the run command.
