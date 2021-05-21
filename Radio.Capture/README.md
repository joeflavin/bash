# Capture Web Radio Streams
Customisable script to capture web radio streams

__Requires__: ffmpeg, id3v2

__Helpful__: use ffprobe to ascertain format of web radio stream in advance, script currently assumes mp3 format.

#### Example use cases
- cron-job: `58 09 * * TUE /usr/local/bin/custom-version-of-radiocap.sh`
- cron-job:  `58 15 * * FRI /usr/local/bin/run-if-today 3 Fri && /usr/local/bin/another-version-of-radiocap.sh`

#### Another useful script
Run radiocap.sh as a cron-job in conjunction with [run-if-today](https://github.com/xr09/cron-last-sunday)

#### TODO: 
- Link up ffprobe to automatically ascertain stream format
- Take in command-line arguments
- Trigger Music Player DB Update?
