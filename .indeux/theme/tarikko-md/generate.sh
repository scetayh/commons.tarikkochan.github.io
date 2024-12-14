{
    echo "# ${tarikkoHtml_titlePrefix}$(declare currentDirectory=$(sed -n ${k}p .indeux/directories.txt); echo ${currentDirectory:1})" 
    echo;
} >> "$(eval sed -n '${k}p' .indeux/directories.txt)/index.md";

if [ $(wc -l <"$(eval sed -n '${k}p' .indeux/directories.txt)/.indeux.items.txt") -gt 0 ]; then {
    for ((l = 1; l <= $(wc -l <"$(eval sed -n '${k}p' .indeux/directories.txt)/.indeux.items.txt"); l++)); do {
        {
            echo -n "[";
            echo -n $(eval sed -n '${l}p' "$(eval sed -n '${k}p' .indeux/directories.txt)/.indeux.items.txt");
            echo "]";
        } >> "$(eval sed -n '${k}p' .indeux/directories.txt)/index.md";
    }
    done;
}
fi;

printf "$(eval sed -n '${k}p' .indeux/directories.txt)index.md"\\n;