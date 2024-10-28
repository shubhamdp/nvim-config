local M = {}

M.ui = {
  theme = "github_dark",

  statusline = {
    theme = "vscode",
    order = { "mode", "file", "git", "%=", "cursor", "cwd" }
  },
}

return M
