#!/bin/sh
# NOTE: this script should be run by the end user (i.e. NOT root)
su - {{username}} << 'EOF'
curl -LsSf https://astral.sh/uv/install.sh | sh
echo '# uv settings' >> ${HOME}/.bashrc
echo 'eval "$(uv generate-shell-completion bash)"' >> ${HOME}/.bashrc
echo 'eval "$(uvx --generate-shell-completion bash)"' >> ${HOME}/.bashrc
echo 'export UV_LINK_MODE=copy' >> ${HOME}/.bashrc
EOF
