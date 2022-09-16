set -x

cd linux-sgx && make preparation

docker-compose build

docker-compose up -d aesm

#docker ps
docker logs custom_aesm_aesm_1

SGX_SPID=$SGX_SPID IAS_PRIMARY_KEY=$IAS_PRIMARY_KEY docker-compose run --rm genquote

docker logs custom_aesm_aesm_1

docker-compose stop aesm

docker-compose down
