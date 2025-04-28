return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',

  ---@module 'blink-cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'enter',
      ['<C-j>'] = { 'select_next' },
      ['<C-k>'] = { 'select_prev' },
    },
    signature = {
      enabled = true,
    }
  }
}
