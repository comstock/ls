#!/bin/bash
# When to wake lobbydisplay computer from sleep state.
HONGYA=`date -d "now + 14 hour + 0 min + 0 sec" +%s`
#rtcwake -lv -m mem -t $HONGYA
#rtcwake -lv -m mem -s 30
rtcwake -uv -m mem -t $HONGYA
exit
