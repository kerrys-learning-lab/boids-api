#! /bin/bash



for lang in typescript-angular python-aiohttp; do
    if [[ -d ${PWD}/out/${lang} ]]; then
        rm -rf ${PWD}/out/${lang}/*.*
    fi

    docker run  --rm                                                        \
                --volume "${PWD}:/local"                                    \
                --user 1000:1000                                            \
                "${@}"                                                      \
                openapitools/openapi-generator-cli:v7.0.1                   \
                    generate    --generator-name    ${lang}                 \
                                --output            /local/out/${lang}      \
                                --model-package     model                   \
                                --package-name      boidsapi                \
                                --input-spec        /local/openapi.yaml
    echo "Generated ${lang}"
done
