#!/bin/sh
# NOTE: this script should be run by the end user (i.e. NOT root)
curl -LsSf https://astral.sh/uv/install.sh | sh
echo 'eval "$(uv generate-shell-completion bash)"' >> ${HOME}/.bashrc
echo 'eval "$(uvx --generate-shell-completion bash)"' >> ~/.bashrc
