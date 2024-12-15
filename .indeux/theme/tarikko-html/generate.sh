{
    echo "<html lang=\"${tarikkoHtml_htmlLang}\">";
    echo "    <head>";
    echo "        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">";
    echo "<link rel=\"apple-touch-icon\" sizes=\"180x180\" href=\"${tarikkoHtml_appleTouchIcon}\">";
    echo "<link rel=\"icon\" type=\"image/ico\" sizes=\"32x32\" href=\"${tarikkoHtml_icon}\">";
    echo "        <title>${tarikkoHtml_titlePrefix}$(declare currentDirectory=$(sed -n ${k}p .indeux/directories.txt); echo ${currentDirectory:1})</title>";
    echo "    </head>";
    echo "    <body style=\"background-color: ${tarikkoHtml_backgroundColor}\">";
    echo "        <style type=\"text/css\">";
    echo "        body{";
    echo "            background: url("${tarikkoHtml_background}") no-repeat center center fixed;";
    echo "            -webkit-background-size: cover;";
    echo "            -o-background-size: cover;  ";
    echo "            background-size: cover;";
    echo "        }";
    echo "        </style>";
    echo "        <h1><font color="#af7ac5">☆</font> Index of $(declare currentDirectory=$(sed -n ${k}p .indeux/directories.txt); echo ${currentDirectory:1})</h1>";
    echo "        <HR style=\"FILTER: alpha(opacity=100,finishopacity=0,style=1)\" width="100%" color=#987cb9 SIZE=3>";
    echo "        <pre>";
    echo "<a href=\"../\">../</a>";
} >> "$(eval sed -n '${k}p' .indeux/directories.txt)/index.html";

#echo k=$k;

declare indeux_currentDirectory="$(eval sed -n '${k}p' .indeux/directories.txt)"
declare indeux_currentDirectoryRecord="$indeux_currentDirectory/.indeux.items.txt"

if [ $(wc -l <"$indeux_currentDirectoryRecord") -gt 0 ]; then {
    for ((l = 1; l <= $(wc -l <"$indeux_currentDirectoryRecord"); l++)); do {
        declare indeux_currentFile="$(sed -n ${l}p "$indeux_currentDirectoryRecord")"
        {
            echo -n "<a href=\"";
            echo -n "$indeux_currentFile";
            echo -n "\">";
            echo -n "$indeux_currentFile";
            echo "</a>";
        } >> "$indeux_currentDirectory/index.html";
    }
    done;
}
fi;

{
    echo "        </pre>";
    echo "    </body>";
    echo "</html>";
} >> "$(eval sed -n '${k}p' .indeux/directories.txt)/index.html";

printf "$(eval sed -n '${k}p' .indeux/directories.txt)index.html"\\n;