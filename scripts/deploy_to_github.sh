#!/usr/bin/env bash
# ALBETH TRANSPORT - Quick GitHub Push & Vercel Auto-Deploy Script
#
# Usage:
#   ./scripts/deploy_to_github.sh <YOUR_GITHUB_PERSONAL_ACCESS_TOKEN>
#
# Or export GITHUB_TOKEN="ghp_xxx" and run:
#   ./scripts/deploy_to_github.sh

set -e

TOKEN="${1:-$GITHUB_TOKEN}"

if [ -z "$TOKEN" ]; then
  echo "======================================================================"
  echo "ALBETH TRANSPORT: Push to GitHub & Trigger Vercel Deployment"
  echo "======================================================================"
  echo "Please provide your GitHub Personal Access Token (PAT) with repo scope:"
  echo "  ./scripts/deploy_to_github.sh <YOUR_GITHUB_TOKEN>"
  echo ""
  echo "Or create a fine-grained or classic token with 'repo' scope at:"
  echo "  https://github.com/settings/tokens"
  echo "======================================================================"
  exit 1
fi

REPO_URL="https://${TOKEN}@github.com/squiddy2/albethtranspo_app.git"

echo "Configuring remote and pushing updates to GitHub..."
git remote set-url origin "$REPO_URL" 2>/dev/null || git remote add origin "$REPO_URL"

git push -u origin main --force

echo ""
echo "======================================================================"
echo "Successfully pushed to https://github.com/squiddy2/albethtranspo_app !"
echo "Vercel will now automatically detect the new commit and deploy to:"
echo "  https://albethtranspoapp.vercel.app/"
echo "======================================================================"
