# EPGS-to-Discord-v2

## Setup
1. Set your Webhook URL by setting value in `run.sh`.
2. Paste below to EPGStation's `config.yml` and edit path.

```
reserveNewAddtionCommand: '/bin/sh /path/to/EPGS-to-Discord-v2/run.sh reserve'
reserveUpdateCommand: '/bin/sh /path/to/EPGS-to-Discord-v2/run.sh update'
reservedeletedCommand: '/bin/sh /path/to/EPGS-to-Discord-v2/run.sh delete'
recordingPreStartCommand: '/bin/sh /path/to/EPGS-to-Discord-v2/run.sh prestart'
recordingPrepRecFailedCommand: '/bin/sh /path/to/EPGS-to-Discord-v2/run.sh prepfailed'
recordingStartCommand: '/bin/sh /path/to/EPGS-to-Discord-v2/run.sh start'
recordingFinishCommand: '/bin/sh /path/to/EPGS-to-Discord-v2/run.sh end'
recordingFailedCommand: '/bin/sh /path/to/EPGS-to-Discord-v2/run.sh recfailed'
```

## Trick
You may need to do some weird things in order to run this script. (e.g. inside Docker container. This is not recommended.)

### Install curl on Docker's container (Ubuntu / Debian)
`docker exec epgstation-v2 apt -y install curl`

## License
This repository is provided under the MIT License.
