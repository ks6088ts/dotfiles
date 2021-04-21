#!/bin/sh

# gRPC
go install \
    github.com/x-motemen/ghq@latest \
    golang.org/x/tools/gopls@latest \
    google.golang.org/protobuf/cmd/protoc-gen-go@latest \
    google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest \
    github.com/mikefarah/yq/v4@latest
