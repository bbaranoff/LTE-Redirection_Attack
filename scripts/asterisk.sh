#!/bin/bash
docker run -it --net host -v /dev/snd:/dev/snd --privileged asterisk-app bash ./run.sh
