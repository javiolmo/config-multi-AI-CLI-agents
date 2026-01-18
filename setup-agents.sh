#!/bin/bash

# =================================================================
# Setup Agents Workspace - Por Dev y Sys
# Automatización de entorno para Claude, Gemini y OpenCode
# =================================================================

# Colores para la terminal
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Iniciando configuración de entorno multi-agente...${NC}\n"

# 1. Crear el archivo maestro AGENTS.md si no existe
if [ ! -f AGENTS.md ]; then
    echo -e "${YELLOW}Creating AGENTS.md...${NC}"
    cat <<EOF > AGENTS.md
# 🤖 Project Context & Agent Rules

## Project Overview
- **Name:** ${PWD##*/}
- **Stack:** [Define tu stack aquí]
- **Vibe:** Efficient, clean code, minimal explanations unless requested.

## Common Instructions
- Use TypeScript for all logic.
- Follow Clean Code principles.
- Use 'AGENTS.md' as the source of truth for project rules.

## Tooling
- Build: \`npm run build\`
- Test: \`npm run test\`
EOF
else
    echo -e "${GREEN}✔ AGENTS.md ya existe.${NC}"
fi

# 2. Configuración para Gemini CLI
echo -e "${YELLOW}Configurando Gemini CLI...${NC}"
mkdir -p .gemini
cat <<EOF > .gemini/settings.json
{
  "contextFileName": "AGENTS.md",
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "."]
    }
  }
}
EOF

# 3. Configuración para OpenCode
echo -e "${YELLOW}Configurando OpenCode...${NC}"
cat <<EOF > opencode.json
{
  "agent_file": "AGENTS.md",
  "auto_execute": false,
  "mcp_enabled": true
}
EOF

# 4. Crear Symlink para Claude CLI
echo -e "${YELLOW}Creando enlace simbólico para Claude Code...${NC}"
# Usamos -sf para forzar la creación si ya existe el link o archivo
ln -sf AGENTS.md CLAUDE.md

# 5. Resumen final
echo -e "\n${GREEN}✅ ¡Configuración completada con éxito!${NC}"
echo -e "----------------------------------------------------"
echo -e "1. ${BLUE}AGENTS.md${NC} es ahora tu fuente de verdad."
echo -e "2. ${BLUE}CLAUDE.md${NC} apunta a AGENTS.md."
echo -e "3. ${BLUE}.gemini/settings.json${NC} está listo con un servidor MCP de archivos."
echo -e "4. ${BLUE}opencode.json${NC} configurado para leer AGENTS.md."
echo -e "----------------------------------------------------"
echo -e "Prueba ejecutando: ${YELLOW}claude \"¿Cuál es el stack de este proyecto?\"${NC}"
