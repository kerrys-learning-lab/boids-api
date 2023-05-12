#! /bin/bash


for lang in typescript-angular python-flask; do
    docker run  --rm                                                        \
                --volume "${PWD}:/local"                                    \
                --user 1000:1000                                            \
                openapitools/openapi-generator-cli:v6.6.0                   \
                    generate    --generator-name    ${lang}                 \
                                --output            /local/out/${lang}      \
                                --model-package     boids                   \
                                --package-name      boidsapi                \
                                --input-spec        /local/openapi.yaml
done
