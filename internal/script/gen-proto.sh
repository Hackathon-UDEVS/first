#!/bin/zsh

CURRENT_DIR=$1

rm -rf ${CURRENT_DIR}/internal/genproto
for x in $(find ${CURRENT_DIR}/protos/first -type d); do
  protoc -I=${x} -I=${CURRENT_DIR}/protos -I /usr/local/go --go_out=${CURRENT_DIR} \
   --go-grpc_out=${CURRENT_DIR} ${x}/*.proto
done