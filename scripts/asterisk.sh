#!/bin/bash
docker run -it -v /dev/snd:/dev/snd --privileged --net host asterisk-example bash ./run.sh
