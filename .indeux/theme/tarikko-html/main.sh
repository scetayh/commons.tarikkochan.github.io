#!/bin/bash

source .indeux/theme/tarikko-html/theme.conf

for ((j = 1; j <= $(wc -l <.indeux/directories.txt); j++)); do {
    echo $j;
}
done | parallel -I% --max-args 1 'export k=% && bash .indeux/theme/tarikko-html/generate.sh';