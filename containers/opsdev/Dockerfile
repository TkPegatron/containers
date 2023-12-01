FROM ghcr.io/tkpegatron/alpine:rolling@sha256:f35a60c42f2270f831593771aabfcfa3311b4f13d8c2355276ef1423fae78dfc

# -{ MOD: Add repositories }
RUN /bin/true \
    && echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories \
    && echo "https://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories

# -{ MOD: Add ops packages}
RUN apk add --upgrade --no-cache \
      # Shell environment
      zsh bat exa git direnv stow file \
      skim neovim gpg gpg-agent openssh-client \
      sshpass rsync envsubst starship tzdata \
      age sops jq yq ipcalc yamllint openssl \
      # Development libraries
      python3 py3-pip libcrypto3 pcre \
      # Development Tools
      kubectl kustomize helm flux \
      ansible ansible-lint \
      # Troubleshooting tools
      dog

# -{ MOD: Install go-task manually }
RUN sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin
