return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  cmd = { "Copilot", "CopilotAuth", "CopilotEnable", "CopilotDisable" },
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = "<C-l>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = false,
      ["."] = false,
    },
  },
  config = function(_, opts)
    require("copilot").setup(opts)
    vim.api.nvim_set_hl(0, "CopilotSuggestion", { link = "Comment", default = true })
  end,
}




