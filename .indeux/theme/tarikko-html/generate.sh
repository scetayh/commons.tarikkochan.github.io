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

if [ $(wc -l <"$(eval sed -n '${k}p' .indeux/directories.txt)/.indeux.items.txt") -gt 0 ]; then {
    for ((l = 1; l <= $(wc -l <"$(eval sed -n '${k}p' .indeux/directories.txt)/.indeux.items.txt"); l++)); do {
        {
            echo -n "<a href=\"";
            echo -n $(eval sed -n '${l}p' "$(eval sed -n '${k}p' .indeux/directories.txt)/.indeux.items.txt");
            echo -n "\">";
            echo -n $(eval sed -n '${l}p' "$(eval sed -n '${k}p' .indeux/directories.txt)/.indeux.items.txt");
            echo "</a>";
        } >> "$(eval sed -n '${k}p' .indeux/directories.txt)/index.html";
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