#!/bin/bash

# Vibe Coding - Manual Skill Installer (Zip Mode)
# Downloads zip archives to bypass git/ssl issues.

TARGET_DIR="/Users/cayce/cy/study/ai-playground/vibe-coding-skill/complete/skills/external"
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR" || exit 1

echo "🚀 Starting Installation (Zip Mode)..."

install_repo_skill() {
    REPO_URL=$1  # e.g., https://github.com/user/repo
    REMOTE_PATH=$2
    LOCAL_NAME=$3
    
    # Construct Zip URL (Try main first, then master)
    ZIP_URL="${REPO_URL}/archive/refs/heads/main.zip"
    TEMP_DIR="temp_${LOCAL_NAME}_$(date +%s)"
    ZIP_FILE="${TEMP_DIR}.zip"

    echo "------------------------------------------------"
    echo "📦 Installing [$LOCAL_NAME]..."
    echo "   ⬇️  Downloading $ZIP_URL..."
    
    # Download with curl (follow redirects, silence progress, insecure SSL)
    curl -L -k -s -o "$ZIP_FILE" "$ZIP_URL"
    
    # Check if zip is valid (sometimes we get 404 text)
    if ! unzip -t "$ZIP_FILE" >/dev/null 2>&1; then
        echo "   ⚠️  'main' branch failed, trying 'master'..."
        ZIP_URL="${REPO_URL}/archive/refs/heads/master.zip"
        curl -L -k -s -o "$ZIP_FILE" "$ZIP_URL"
    fi

    if ! unzip -t "$ZIP_FILE" >/dev/null 2>&1; then
        echo "   ❌ Download failed (Network or 404). Skipping."
        rm -f "$ZIP_FILE"
        return
    fi

    # Unzip
    unzip -q "$ZIP_FILE" -d "$TEMP_DIR"
    
    # Find the extracted root folder (e.g., repo-main)
    EXTRACTED_ROOT=$(ls "$TEMP_DIR" | head -n 1)
    REPO_ROOT="$TEMP_DIR/$EXTRACTED_ROOT"

    # Prepare Local Directory
    mkdir -p "$LOCAL_NAME"

    # Search for SKILL.md
    FOUND=false
    POSSIBLE_PATHS=(
        "$REPO_ROOT/$REMOTE_PATH/SKILL.md"
        "$REPO_ROOT/$REMOTE_PATH/CLAUDE.md"
        "$REPO_ROOT/SKILL.md"
        "$REPO_ROOT/CLAUDE.md"
        "$REPO_ROOT/src/$REMOTE_PATH/SKILL.md"
        "$REPO_ROOT/skills/$REMOTE_PATH/SKILL.md"
    )

    for FILE_PATH in "${POSSIBLE_PATHS[@]}"; do
        if [ -f "$FILE_PATH" ]; then
            echo "   ✅ Found skill file."
            cp "$FILE_PATH" "$LOCAL_NAME/SKILL.md"
            FOUND=true
            break
        fi
    done

    if [ "$FOUND" = false ]; then
        echo "   ⚠️  Could not find SKILL.md inside zip."
    else
        echo "   🎉 Installed to $LOCAL_NAME/SKILL.md"
    fi

    # Cleanup
    rm -rf "$TEMP_DIR" "$ZIP_FILE"
}

# --- Installation List ---

install_repo_skill "https://github.com/anthropics/skills" "frontend-design" "frontend-design"
install_repo_skill "https://github.com/anthropics/skills" "pdf" "pdf"
install_repo_skill "https://github.com/vercel-labs/agent-skills" "web-design-guidelines" "web-design-guidelines"
install_repo_skill "https://github.com/vercel-labs/agent-skills" "vercel-react-best-practices" "vercel-react-best-practices"
install_repo_skill "https://github.com/vercel-labs/skills" "find-skills" "find-skills"
install_repo_skill "https://github.com/expo/skills" "building-native-ui" "building-native-ui"
install_repo_skill "https://github.com/better-auth/skills" "better-auth-best-practices" "better-auth-best-practices"
install_repo_skill "https://github.com/nextlevelbuilder/ui-ux-pro-max-skill" "ui-ux-pro-max" "ui-ux-pro-max"
install_repo_skill "https://github.com/obra/superpowers" "skills/brainstorming" "brainstorming"

echo "------------------------------------------------"
echo "✅ Zip Installation Completed."
