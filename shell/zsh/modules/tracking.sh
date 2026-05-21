function timer(){
    year_past="$(python -c 'from datetime import datetime as dt; days_past = float(abs((dt.strptime("2025-01-01", "%Y-%m-%d") - dt.today()).days)); year_past = round(days_past / 365 * 100, 2); print(year_past)')"
    target_hours="$(python -c 'from datetime import datetime as dt; days_past = float(abs((dt.strptime("2025-01-01", "%Y-%m-%d") - dt.today()).days)); target_hours = round((days_past / 365) * 100, 1); print(target_hours)')"
    days_left="$(python -c 'from datetime import datetime as dt; days_past = float(abs((dt.strptime("2025-01-01", "%Y-%m-%d") - dt.today()).days)); days_left = int(365 - days_past); print(days_left)')"
    label "red" "YEAR PAST: ${year_past}% ||| TARGET HOURS: ${target_hours} ||| DAYS LEFT: ${days_left}"
}

function label(){
    update_bg="$1"
    update_fg="$(pastel textcolor "$update_bg")"
    echo -en "\n"
    pastel paint "$update_fg" --on "$update_bg" "$2"
}

function agg(){
    # prefer this approach: partitions arts, one file instead of three
    timer;
    YEAR=${1:-25}
    DANCE="$(cat $TRACK_DIR/$YEAR/dance.dat | awk 'NF>1{print $NF}' | awk '{sum+=$1;}END{print sum/4;}')"
    SKATE="$(cat $TRACK_DIR/$YEAR/skate.dat | awk 'NF>1{print $NF}' | awk '{sum+=$1;}END{print sum/4;}')"
    GUITAR="$(cat $TRACK_DIR/$YEAR/guitar.dat | awk 'NF>1{print $NF}' | awk '{sum+=$1;}END{print sum/4;}')"
    PIANO="$(cat $TRACK_DIR/$YEAR/piano.dat | awk 'NF>1{print $NF}' | awk '{sum+=$1;}END{print sum/4;}')"
    TRAIN="$(cat $TRACK_DIR/$YEAR/train.dat | awk 'NF>1{print $NF}' | awk '{sum+=$1;}END{print sum;}')"
    DRAW="$(cat $TRACK_DIR/$YEAR/draw.dat | awk 'NF>1{print $NF}' | awk '{sum+=$1;}END{print sum/4;}')"
    echo "jeeta,${GUITAR},100" | termgraph --color {green,blue}
    echo "piano,${PIANO},100" | termgraph --color {green,blue}
    echo "dance,${DANCE},100" | termgraph --color {green,blue}
    echo "skate,${SKATE},100" | termgraph --color {green,blue}
    echo "train,${TRAIN},100" | termgraph --color {green,blue}
    echo "draw,${DRAW},100" | termgraph --color {green,blue}
}

function hm(){
    # TODO: branch on arg (two-digit int, string)
    # replace with python + bullet: subprocess.run("termgraph --calendar --start-dt 2024-01-01 ~/Documents/zv/personal/tracking/24/guitar.dat", shell=True, check=True)
    if [ $# -eq 0 ]; then
        label "deeppink" "GUITAR"
        termgraph --calendar --start-dt 2025-01-01 $TRACK_DIR/25/guitar.dat
        label "darkmagenta" "PIANO"
        termgraph --calendar --start-dt 2025-01-01 $TRACK_DIR/25/piano.dat
        label "gold" "DANCE"
        termgraph --calendar --start-dt 2025-01-01 $TRACK_DIR/25/dance.dat
        label "darkorange" "SKATE"
        termgraph --calendar --start-dt 2025-01-01 $TRACK_DIR/25/skate.dat
        label "peru" "TRAIN"
        termgraph --calendar --start-dt 2025-01-01 $TRACK_DIR/25/train.dat
        label "saddlebrown" "DRAW"
        termgraph --calendar --start-dt 2025-01-01 $TRACK_DIR/25/draw.dat
    else
        fname="$1.dat";
        vim '+normal G$' $PER_DIR/tracking/25/"$fname";
        \cd $PER_DIR/tracking;
        git add -A;
        cd -;
    fi
}
