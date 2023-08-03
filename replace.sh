#!/bin/bash

CSV="$1"
TRADS="$2"

if [ -z "$2" ]; then
	TRADS=$(find . -type f -name '*.vtt')
fi

for TRAD in $TRADS; do
	echo -n "Processing $TRAD ..."
	cp "$TRAD" "$TRAD".tmp
	while read LINE; do
		SRC=$(echo $LINE | cut -d';' -f 2)
		TARGET=$(echo $LINE | cut -d';' -f 3)
	  	NEW=$(sed -e "s/$SRC/$TARGET/g" "$TRAD".tmp)
	  	echo -e "$NEW" > "$TRAD".tmp
	done < "$CSV"
	echo " OK"
done

