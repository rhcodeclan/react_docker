#!/bin/bash
docker build -f Dockerfile.dev -t react_docker .
docker run -e CI=true react_docker npm run test -- --coverage