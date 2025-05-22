#!/bin/bash
docker run -it -v /dev/snd:/dev/snd --privileged --net my-network asterisk-example bash ./run.sh
