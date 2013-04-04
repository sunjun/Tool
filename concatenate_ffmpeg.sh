ffmpeg -i 1.ts -y -qscale:v 1 intermediate1.mpg
ffmpeg -i 2.ts -y -qscale:v 1 intermediate2.mpg
ffmpeg -i 3.ts -y -qscale:v 1 intermediate3.mpg
ffmpeg -i 4.ts -y -qscale:v 1 intermediate4.mpg
ffmpeg -i 5.ts -y -qscale:v 1 intermediate5.mpg
ffmpeg -i 6.ts -y -qscale:v 1 intermediate6.mpg
ffmpeg -i 7.ts -y -qscale:v 1 intermediate7.mpg
ffmpeg -i 8.ts -y -qscale:v 1 intermediate8.mpg
ffmpeg -i 9.ts -y -qscale:v 1 intermediate9.mpg
ffmpeg -i 10.ts -y -qscale:v 1 intermediate10.mpg
ffmpeg -i 11.ts -y -qscale:v 1 intermediate11.mpg
ffmpeg -i 12.ts -y -qscale:v 1 intermediate12.mpg
ffmpeg -i 13.ts -y -qscale:v 1 intermediate13.mpg
ffmpeg -i 14.ts -y -qscale:v 1 intermediate14.mpg
ffmpeg -i 15.ts -y -qscale:v 1 intermediate15.mpg
ffmpeg -i 16.ts -y -qscale:v 1 intermediate16.mpg
ffmpeg -i 17.ts -y -qscale:v 1 intermediate17.mpg
ffmpeg -i 18.ts -y -qscale:v 1 intermediate18.mpg

ffmpeg -i concat:"intermediate1.mpg|intermediate2.mpg|intermediate3.mpg|intermediate4.mpg|intermediate5.mpg|intermediate6.mpg|intermediate7.mpg|intermediate8.mpg|intermediate9.mpg|intermediate10.mpg|intermediate11.mpg|intermediate12.mpg|intermediate13.mpg|intermediate14.mpg|intermediate15.mpg|intermediate16.mpg|intermediate17.mpg|intermediate18.mpg" -y -c copy intermediate_all.mpg


ffmpeg -i intermediate_all.mpg -qscale:v 2 -y -strict -2  output.mp4
ffmpeg -i output.mp4 -f mp3 -ab 192000 -y -vn output.mp3


ffmpeg -i output.mp3 -ss 00:00:38 -t 00:05:51 -acodec copy -y recreate_output.mp3
-ss 00:01:12 -t 00:01:42
