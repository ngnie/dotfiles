return {
  -- inspired by https://github.com/ibhagwan/fzf-lua
  "junegunn/fzf", 
  build = "./install --bin",
  dependencies = {
    -- this will make :Files etc. work
    "junegunn/fzf.vim",
  }
}
