#!/bin/sh
set -e

COMMAND="serve"
CMD="/koshelf $COMMAND --books-path /books --statistics-db /settings/statistics.sqlite3 --port 3000"

[ -n "$DATAPATH" ] && CMD="$CMD --data-path $DATAPATH"
[ -n "$DOCSETTINGS" ] && CMD="$CMD --docsettings-path $DOCSETTINGS"
[ -n "$HASHDOCSETTINGS" ] && CMD="$CMD --hashdocsettings-path $HASHDOCSETTINGS"
[ -n "$TITLE" ] && CMD="$CMD --title \"$TITLE\""
[ -n "$LANG" ] && CMD="$CMD --language \"$LANG\""
[ -n "$TIMEZONE" ] && CMD="$CMD --timezone \"$TIMEZONE\""
[ "$INCLUDE_ALL_STATS" = "true" ] && CMD="$CMD --include-all-stats"
[ "$INCLUDE_UNREAD" = "true" ] && CMD="$CMD --include-unread"

eval exec "$CMD"
