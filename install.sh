#!/bin/bash

# Prompt Coach - Installation Script
# Installs the Prompt Coach skill to ~/.claude/skills/

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SKILL_NAME="prompt-coach"
INSTALL_DIR="$HOME/.claude/skills/$SKILL_NAME"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  📚 Prompt Coach Skill Installer"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Check if ~/.claude/skills directory exists
if [ ! -d "$HOME/.claude/skills" ]; then
    echo -e "${YELLOW}⚠️  Creating ~/.claude/skills directory...${NC}"
    mkdir -p "$HOME/.claude/skills"
    echo -e "${GREEN}✓${NC} Directory created"
    echo ""
fi

# Check if skill is already installed
if [ -d "$INSTALL_DIR" ] || [ -L "$INSTALL_DIR" ]; then
    echo -e "${YELLOW}⚠️  Prompt Coach is already installed at:${NC}"
    echo "   $INSTALL_DIR"
    echo ""
    read -p "   Overwrite? (y/n) " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${RED}✗${NC} Installation cancelled"
        exit 1
    fi
    echo ""
    echo -e "${YELLOW}⚠️  Removing existing installation...${NC}"
    rm -rf "$INSTALL_DIR"
fi

# Copy the skill to ~/.claude/skills/
echo -e "${GREEN}➜${NC} Installing Prompt Coach skill..."
cp -r "$SCRIPT_DIR" "$INSTALL_DIR"

# Remove install.sh from the installed version (don't need it there)
if [ -f "$INSTALL_DIR/install.sh" ]; then
    rm "$INSTALL_DIR/install.sh"
fi

echo -e "${GREEN}✓${NC} Skill installed successfully!"
echo ""

# Show what was installed
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  📍 Installation Location:"
echo "     $INSTALL_DIR"
echo ""
echo "  📄 Installed Files:"
ls -1 "$INSTALL_DIR" | sed 's/^/     - /'
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Check if skill file exists
if [ -f "$INSTALL_DIR/Skill.md" ]; then
    echo -e "${GREEN}✓${NC} Skill.md found - installation looks good!"
else
    echo -e "${RED}✗${NC} Warning: Skill.md not found - installation may be incomplete"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  🎯 Next Steps:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  1. Restart Claude Code"
echo ""
echo "  2. Try these commands:"
echo "     • \"Analyze my prompt quality\""
echo "     • \"Show me my productivity patterns\""
echo "     • \"Which tools should I use more?\""
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo -e "${GREEN}✨ Installation complete! Happy prompting!${NC}"
echo ""
