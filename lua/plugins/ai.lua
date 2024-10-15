return {
  {
    "robitx/gp.nvim",
    lazy = true,
    config = function()
      local conf = {
        -- For customization, refer to Install > Configuration in the Documentation/Readme
        openai_api_key = { "gpg", "--decrypt", vim.fn.stdpath("data") .. "/openai.txt.gpg" },

        hooks = {
          ProofRead = function(gp, params)
            local template = [[
              I want you act as a proofreader.
              I will provide you a text and I would like you to review it for
              any spelling, grammar, or punctuation errors.
              Once you have finished reviewing the text, provide me with any necessary
              corrections or suggestions for improve the text.

              Here's the text:

              ```{{selection}}```
              ]]
            local agent = gp.get_chat_agent()
            gp.Prompt(params, gp.Target.vnew, agent, template)
          end,
        },
      }
      require("gp").setup(conf)
      -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
    end,
  },
}
