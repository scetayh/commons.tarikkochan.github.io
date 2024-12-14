for i in 1 2 3 4 5 6 7 8 9; do \
    ffmpeg \
    -i \
        "【全英助眠】加拿大妹妹可爱萌音轻读《小王子》(已完结） p0$i Chapter $i [BV17a4y1Q73C_p$i].m4a" \
    -b:a \
        320k \
    -metadata \
        title="【全英助眠】加拿大妹妹可爱萌音轻读《小王子》(已完结） p0$i Chapter $i [BV17a4y1Q73C_p$i]" \
    -metadata \
        artist=MilkiBun \
    -metadata \
        album="【全英助眠】加拿大妹妹可爱萌音轻读《小王子》(已完结）" \
    "【全英助眠】加拿大妹妹可爱萌音轻读《小王子》(已完结） Chapter $i.mp3" ;\
done && \
\
for ((i=10; i<=27; i++)); do \
    ffmpeg \
    -i \
        "【全英助眠】加拿大妹妹可爱萌音轻读《小王子》(已完结） p$i Chapter $i [BV17a4y1Q73C_p$i].m4a" \
    -b:a \
        320k \
    -metadata \
        title="【全英助眠】加拿大妹妹可爱萌音轻读《小王子》(已完结） p$i Chapter $i [BV17a4y1Q73C_p$i]" \
    -metadata \
        artist=MilkiBun \
    -metadata \
        album="【全英助眠】加拿大妹妹可爱萌音轻读《小王子》(已完结）" \
    "【全英助眠】加拿大妹妹可爱萌音轻读《小王子》(已完结） Chapter $i.mp3" ;\
done
