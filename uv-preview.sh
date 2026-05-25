#!/usr/bin/env bash

set -euo pipefail
set -x

uv sync
uv run nox --default-venv-backend=uv -s build

(sleep 6 && open "http://localhost:8000/$1") &
exec uv run nox --default-venv-backend=uv -s preview
