#!/bin/bash
docker run -e CI=true react_docker npm run test -- --coverage