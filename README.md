# EPGS-to-Slack

## Setup
run.shを開いてSlack Bot Tokenを書き込みEPGStation のconfigへコピーしchmod +x

config.ymlに下記コマンドを追加
```
reserveNewAddtionCommand: '/bin/sh %ROOT%/config/run.sh reserve'
reserveUpdateCommand: '/bin/sh %ROOT%/config/run.sh update'
reservedeletedCommand: '/bin/sh %ROOT%/config/run.sh delete'
recordingPreStartCommand: '/bin/sh %ROOT%/config/run.sh pre_start'
recordingPrepRecFailedCommand: '/bin/sh %ROOT%/config/run.sh prep_failed'
recordingStartCommand: '/bin/sh %ROOT%/config/run.sh start'
recordingFinishCommand: '/bin/sh %ROOT%/config/run.sh end'
recordingFailedCommand: '/bin/sh %ROOT%/config/run.sh rec_failed'
encodingFinishCommand: '/bin/sh %ROOT%/config/run.sh encode_end'
```

## License
This repository is provided under the MIT License.
