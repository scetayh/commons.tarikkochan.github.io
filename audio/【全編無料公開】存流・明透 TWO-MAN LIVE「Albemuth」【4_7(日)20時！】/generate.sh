for i in *; do \
    ffmpeg \
    -i \
        "$i" \
    -b:a \
        320k \
    -metadata \
        album="【全編無料公開】存流・明透 TWO-MAN LIVE「Albemuth」【4_7(日)20時！】" \
    "$i.mp3" ;\
done
