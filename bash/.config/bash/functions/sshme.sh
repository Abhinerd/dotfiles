sshme() {
    local ip=""

    if command -v python3 >/dev/null 2>&1; then
        ip=$(python3 -c "import socket; s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM); s.connect(('8.8.8.8', 80)); print(s.getsockname()[0]); s.close()" 2>/dev/null)
    fi

    if [ -z "$ip" ]; then
        echo "Could not determine local IP address."
        return 1
    fi

    echo "ssh -p 8022 $(whoami)@$ip"
}
