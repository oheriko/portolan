#!/usr/bin/env sh

# Portolan - Installation Script
# Documentation templates that chart your codebase for AI coding assistants
# https://github.com/oheriko/portolan

set -e

REPO_URL="https://raw.githubusercontent.com/oheriko/portolan/main"

echo ""
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║                                                           ║"
echo "║   🗺️  PORTOLAN                                            ║"
echo "║   Chart your codebase for AI coding assistants           ║"
echo "║                                                           ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""

# Check for required commands
if ! command -v curl >/dev/null 2>&1; then
  echo "❌ Error: curl is required but not installed."
  exit 1
fi

# Create directories
echo "📁 Creating directories..."
mkdir -p docs

# Download root files
echo "📥 Downloading project files..."

curl -fsSL "${REPO_URL}/templates/README.md" -o README.md
echo "  ✓ README.md"

curl -fsSL "${REPO_URL}/templates/CHANGELOG.md" -o CHANGELOG.md
echo "  ✓ CHANGELOG.md"

# Download docs
echo ""
echo "📥 Downloading documentation..."

curl -fsSL "${REPO_URL}/templates/docs/llm.md" -o docs/llm.md
echo "  ✓ docs/llm.md"

curl -fsSL "${REPO_URL}/templates/docs/requirements.md" -o docs/requirements.md
echo "  ✓ docs/requirements.md"

curl -fsSL "${REPO_URL}/templates/docs/architecture.md" -o docs/architecture.md
echo "  ✓ docs/architecture.md"

curl -fsSL "${REPO_URL}/templates/docs/constraints.md" -o docs/constraints.md
echo "  ✓ docs/constraints.md"

curl -fsSL "${REPO_URL}/templates/docs/decisions.md" -o docs/decisions.md
echo "  ✓ docs/decisions.md"

curl -fsSL "${REPO_URL}/templates/docs/testing.md" -o docs/testing.md
echo "  ✓ docs/testing.md"

curl -fsSL "${REPO_URL}/templates/docs/deployment.md" -o docs/deployment.md
echo "  ✓ docs/deployment.md"

# Download MCP configuration
echo ""
echo "📥 Downloading MCP server configuration..."

curl -fsSL "${REPO_URL}/.mcp.json" -o .mcp.json
echo "  ✓ .mcp.json"

# Create symlinks for AI tools
echo ""
echo "🔗 Creating symlinks for AI tools..."

ln -sf docs/llm.md CLAUDE.md
echo "  ✓ CLAUDE.md -> docs/llm.md"

ln -sf docs/llm.md AGENTS.md
echo "  ✓ AGENTS.md -> docs/llm.md"

mkdir -p .cursor
ln -sf ../docs/llm.md .cursor/rules
echo "  ✓ .cursor/rules -> docs/llm.md"

ln -sf docs/llm.md .cursorrules
echo "  ✓ .cursorrules -> docs/llm.md"

# Create symlinks for MCP config
echo ""
echo "🔗 Creating MCP config symlinks..."

# For Claude Desktop (user needs to move to correct location)
mkdir -p .config/claude
ln -sf ../../.mcp.json .config/claude/mcp_config.json
echo "  ✓ .config/claude/mcp_config.json -> .mcp.json (template)"

# For Cursor
ln -sf ../.mcp.json .cursor/mcp.json
echo "  ✓ .cursor/mcp.json -> .mcp.json"

echo ""
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║  ✅ Portolan installed successfully!                      ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""
echo "📋 Next steps:"
echo ""
echo "  1. Configure MCP servers (optional but powerful!):"
echo ""
echo "     ✓ Project config ready: .mcp.json"
echo "     ✓ Symlinks created for Cursor and local testing"
echo ""
echo "     For Claude Code:"
echo "     - Edit .mcp.json and add your API keys"
echo "     - Restart Claude Code (config loads automatically)"
echo ""
echo "     For Claude Desktop:"
echo "     - Copy .mcp.json contents to your global config:"
echo "       Mac: ~/Library/Application Support/Claude/claude_desktop_config.json"
echo "       Win: %APPDATA%\\Claude\\claude_desktop_config.json"
echo "     - Restart Claude Desktop"
echo ""
echo "     📊 Atlassian MCP: Pull requirements from Jira/Confluence"
echo "     🎥 Fathom AI MCP: Search meeting transcripts and action items"
echo ""
echo "  2. Fill in the [TODO] sections:"
echo "     - README.md, CHANGELOG.md"
echo "     - docs/*.md (or use MCP to auto-populate!)"
echo ""
echo "  3. Start coding with AI assistance!"
echo ""
echo "💡 Pro tip: Use MCP queries like:"
echo "   'Pull our Jira epics and format them for docs/requirements.md'"
echo "   'Find meetings about [feature] and add decisions to docs/decisions.md'"
echo ""
echo "📖 Documentation: https://github.com/oheriko/portolan"
echo ""
