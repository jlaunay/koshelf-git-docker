#!/bin/sh
set -e

CMD="/koshelf --books-path /books --statistics-db /settings/statistics.sqlite3 --port 3000"

[ -n "$DOCSETTINGS" ] && CMD="$CMD --docsettings-path $DOCSETTINGS"
[ -n "$HASHDOCSETTINGS" ] && CMD="$CMD --hashdocsettings-path $HASHDOCSETTINGS"
[ -n "$TITLE" ] && CMD="$CMD --title \"$TITLE\""

eval exec $CMD
