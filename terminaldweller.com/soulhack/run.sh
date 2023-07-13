#!/bin/sh

docker run \
        --entrypoint /soulshack \
        -v ./AmQMzQGpzZQEJZG.yml:/personalities/AmQMzQGpzZQEJZG.yml \
        -it soulshack:dev \
        --nick botnick \
        --server irc.terminaldweller.com \
        --port 6697 \
        --ssl \
        --openaikey api_key \
        --channel '#mychannel' \
        --admins terminaldweller \
        --chunkmax 8192 \
        --chunkdelay 30s \
        --nickservnick botnick \
        --nickservpass \
        --become personality
