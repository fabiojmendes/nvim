local M = {}

local function parse_response(json)
  local text = ""
  if json.title and json.message then
    text = json.title .. "\n" .. json.message
  else
    for _, res in ipairs(json) do
      text = text .. res.word
      if res.phonetic then
        text = text .. " " .. res.phonetic
      end
      for _, meaning in ipairs(res.meanings) do
        text = text .. string.format("\n<<%s>>", meaning.partOfSpeech)
        for _, def in ipairs(meaning.definitions) do
          text = text .. "\n" .. def.definition
          if def.example then
            text = text .. "\nEXAMPLE: " .. def.example
          end
        end
      end
    end
  end

  -- Split text as a table
  local lines = {}
  for l in text:gmatch("[^\r\n]*") do
    table.insert(lines, l)
  end

  return lines
end

local function create_popup()
  local Popup = require("nui.popup")
  local event = require("nui.utils.autocmd").event

  local popup = Popup({
    enter = true,
    focusable = true,
    border = {
      style = "rounded",
    },
    position = {
      row = 1,
      col = 0,
    },
    relative = "cursor",
    size = {
      width = 80,
      height = 10,
    },
    win_options = {
      wrap = true,
    },
  })

  -- mount/open the component
  popup:mount()

  local unmount_popup = function()
    popup:unmount()
  end

  -- unmount component when cursor leaves buffer
  popup:on(event.BufLeave, unmount_popup)
  popup:map("n", "<esc>", unmount_popup)
  popup:map("n", "q", unmount_popup)

  return popup
end

M.word_under_cursor = function()
  local curl = require("plenary.curl")

  local word = vim.fn.expand("<cword>")
  local response = curl.get("https://api.dictionaryapi.dev/api/v2/entries/en/" .. word:lower())
  local json = vim.fn.json_decode(response.body)
  local lines = parse_response(json)

  local popup = create_popup()
  -- set content
  vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, lines)
end

return M
