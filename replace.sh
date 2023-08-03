#!/bin/bash

CSV="$1"
TRAD="$2"

cp "$TRAD" "$TRAD".tmp
while read LINE; do
	SRC=$(echo $LINE | cut -d';' -f 2)
	TARGET=$(echo $LINE | cut -d';' -f 3)
  	NEW=$(sed -e "s/$SRC/$TARGET/g" "$TRAD".tmp)
  	echo -e "$NEW" > "$TRAD".tmp
done < "$CSV"
