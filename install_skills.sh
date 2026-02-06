#!/bin/bash

# Vibe Coding Skill Installer
# Installs third-party skills into the 'skills/external' directory.

# 1. Configuration
TARGET_DIR="/Users/cayce/cy/study/ai-playground/vibe-coding-skill/complete/skills/external"

# 2. Setup
echo "📂 Setting up installation directory: $TARGET_DIR"
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR" || { echo "❌ Failed to enter directory"; exit 1; }

# 3. Clean up manual placeholders (to prevent conflicts with npx)
echo "🧹 Cleaning up any manual placeholders..."
rm -rf web-design-guidelines vercel-react-best-practices find-skills brainstorming frontend-design ui-ux-pro-max better-auth-best-practices building-native-ui pdf

# 4. Installation Loop
# Note: Adding --yes to skip interactive prompts if supported, otherwise standard install.

install_skill() {
    REPO=$1
    SKILL=$2
    echo "⬇️  Installing $SKILL from $REPO..."
    npx skills add "$REPO" --skill "$SKILL"
}

# install_skill "https://github.com/vercel-labs/agent-skills" "web-design-guidelines"
# install_skill "https://github.com/anthropics/skills" "frontend-design"
# install_skill "https://github.com/vercel-labs/skills" "find-skills"
install_skill "https://github.com/nextlevelbuilder/ui-ux-pro-max-skill" "ui-ux-pro-max"
# install_skill "https://github.com/better-auth/skills" "better-auth-best-practices"
# install_skill "https://github.com/expo/skills" "building-native-ui"
# install_skill "https://github.com/vercel-labs/agent-skills" "vercel-react-best-practices"
# install_skill "https://github.com/anthropics/skills" "pdf"
# install_skill "https://github.com/obra/superpowers" "brainstorming"

echo "✅ Installation Complete! External skills are located in $TARGET_DIR"
