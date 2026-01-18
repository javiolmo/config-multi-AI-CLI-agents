# 🔌 Guía de Extensión: Model Context Protocol (MCP)

Este documento explica cómo añadir nuevas herramientas (servidores MCP) a tus agentes (**Claude**, **Gemini** y **OpenCode**) de forma manual y modular.

## 🛠️ Plantilla Base de Configuración
Cualquier servidor MCP sigue esta estructura. Copia este bloque JSON y adáptalo según necesites:

\`\`\`json
"nombre-del-servidor": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-nombre-del-paquete"],
  "env": {
    "API_KEY": "TU_VALOR_AQUI"
  }
}
\`\`\`

---

## 📥 Dónde Inyectar el Código

### 1. Para Gemini CLI
Edita el archivo `.gemini/settings.json`. Añade el nuevo servidor dentro del objeto `"mcpServers"`.
> **Ruta:** `tu-proyecto/.gemini/settings.json`

### 2. Para Claude Code
Claude lee la configuración del archivo `.mcp.json` en la raíz. Si no existe, puedes crearlo con la estructura JSON completa.
> **Ruta:** `tu-proyecto/.mcp.json`

### 3. Para OpenCode
Añade la configuración en el archivo `opencode.json`. Asegúrate de que la propiedad `"mcp_enabled"` sea `true`.
> **Ruta:** `tu-proyecto/opencode.json`

---

## 🚀 Servidores Populares para Probar
Aquí tienes comandos listos para usar en tus configuraciones:

| Herramienta | Paquete NPM (args) | Utilidad |
| :--- | :--- | :--- |
| **Google Search** | `@modelcontextprotocol/server-google-search` | Búsquedas en tiempo real. |
| **GitHub** | `@modelcontextprotocol/server-github` | Gestionar issues y PRs. |
| **PostgreSQL** | `@modelcontextprotocol/server-postgres` | Consultar tu base de datos. |
| **Fetch** | `@modelcontextprotocol/server-fetch` | Extraer contenido de URLs. |

---

## 🔍 Verificación
Una vez añadido, pregunta a cualquiera de tus agentes:
> *"Lista tus herramientas disponibles y dime qué hace la herramienta [nombre]."*