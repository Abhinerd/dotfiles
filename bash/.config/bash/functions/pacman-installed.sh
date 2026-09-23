pacman-installed() {
    pacman -Qei | grep -E '^(Name|Install Date)'
}
