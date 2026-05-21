alias mt="docker"

# stop containers, rm (stopped containers, unused volumes, dangling images), rm unused images
alias mtp="docker ps -qa | xargs docker stop; docker system prune --volumes -f; docker image prune -af; mtl"
alias mtpc="docker ps -qa | xargs docker stop; docker system prune --volumes -f"
alias dstop="docker ps -qa | xargs docker stop"

# https://docs.docker.com/engine/reference/commandline/ps/#formatting
alias docker_stat="docker ps --format 'table {{.Names}}\t{{.State}}\t{{.Status}}'"
function mtl(){  # list all
    echo -e "\n";

    echo "🚢 containers";
    printf %"$COLUMNS"s | tr " " "-"
    echo -e "\n";
    docker ps -a;
    echo -e "\n";

    echo "💾 images";
    printf %"$COLUMNS"s | tr " " "-"
    echo -e "\n";
    docker images;
    echo -e "\n";

    echo "🗄  volumes";
    printf %"$COLUMNS"s | tr " " "-"
    echo -e "\n";
    docker volume ls;
    echo -e "\n";
}
