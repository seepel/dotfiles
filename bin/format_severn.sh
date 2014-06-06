#!/bin/bash
file="$0"
perl -0777 -pe 's/(?s:.)\n[ \t]*/ /g' "$file" | perl -pe 's/<td.*?>/<td>/g' | perl -pe 's/<tr.*?>/\n<tr>/g' | perl -pe 's/<img.*?>//g' | perl -pe 's/<.?font.*?>//g' | perl -pe 's/<.?p.*?>//g' | perl -pe 's/<.?a.*?>//g' | perl -pe 's/MainPropulsion/Main Propulsion/g' | perl -pe 's/<td>([0-9][0-9])<\/td> <td>([0-9][0-9])<\/td> <\/tr>/<td>\1-\2<\/td> <td><\/td> <\/tr>/g'
