return {
  -- TODO: Fix the icons this shows from ?'s to something pretty
  { "nvim-neotest/neotest-plenary" },
  { "nvim-neotest/neotest-jest" },
  { "nvim-neotest/neotest-python" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        "neotest-plenary",
        "neotest-jest",
        "neotest-python",
      },
      icons = {
        -- expanded = "▶",
        -- child_prefix = "⧋",
        -- child_indent = "▸",
        -- final_child_prefix = "▹",
        -- non_collapsible = "◬",
        -- collapsed = "◂",
        -- unknown = "?",

        passed = "✓",
        running = "⋯",
        failed = "✗",
        skipped = "?",
        watching = "☉",
      },
    },
  },
}
