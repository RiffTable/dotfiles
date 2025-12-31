return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- use a release tag to download pre-built binaries
  version = '1.*',

  opts = {
    -- Using 'default' keymap preset:
    -- C-y: accept
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    keymap = { preset = 'default' },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = true } },
    signature = { enabled = true },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
