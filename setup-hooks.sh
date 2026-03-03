#!/usr/bin/env bash
# setup-hooks.sh — installs project git hooks
# Run once after cloning: bash setup-hooks.sh

set -euo pipefail

echo "🔧 Installing git hooks from .githooks/..."
git config core.hooksPath .githooks
chmod +x .githooks/pre-commit
chmod +x .githooks/commit-msg
chmod +x .githooks/post-commit
chmod +x .githooks/pre-push
echo "✅ Done. Hooks installed:"
echo "   • pre-commit  — secret scanner (staged files)"
echo "   • commit-msg  — conventional commits enforcer"
echo "   • post-commit — AI audit logger"
echo "   • pre-push    — secret scanner (full history)"
