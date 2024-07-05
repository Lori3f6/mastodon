Mastodon image build script for https://melon.blue  
Docker/nginx/postgres config are also availiable at [service-configs](https://github.com/Lori3f6/service-configs)

usage: 
```
sh ./setup.sh
```
then
```
cd mastodon_source
docker build . --tag tootsuite/mastodon:v4.2.10-yai
```
