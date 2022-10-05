require('nvim-navic').setup {
    highlight = false,
    separator = " > ",
    depth_limit = 0,
    depth_limit_indicator = "..", 
}


local get_filename = function()
  local filename = vim.fn.expand "%:t"
  local extension = vim.fn.expand "%:e"

  if not (filename == "" or filename == nil) then
    local file_icon, file_icon_color =
      require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })

    local hl_group = "FileIconColor" .. extension

    vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
    if file_icon == nil or file_icon == "" then
      file_icon = ""
    end

    local navic_text = vim.api.nvim_get_hl_by_name("Normal", true)
    vim.api.nvim_set_hl(0, "Winbar", { fg = navic_text.foreground })

    return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#Winbar#" .. filename .. "%*" .. ">" .. " "
  end
end

local get_winbar = function()
    local navic = require('nvim-navic')
    local get_gps = function()
        if not navic.is_available() then
            return ""
        end
        return navic.get_location()
    end

    return get_filename() .. " " .. get_gps()
end

local create_winbar = function()
  vim.api.nvim_create_augroup("_winbar", {})
  if vim.fn.has "nvim-0.8" == 1 then
    vim.api.nvim_create_autocmd(
      { "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
      {
        group = "_winbar",
        callback = function()
          local status_ok, _ = pcall(vim.api.nvim_buf_get_var, 0, "lsp_floating_window")
          if not status_ok then
            get_winbar()
          end
        end,
      }
    )
  end
end

create_winbar()
