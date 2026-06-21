hl.bind("SUPER + Return", hl.dsp.exec_cmd("ghostty"))

-- Add workspace 10
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = "10" }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))
