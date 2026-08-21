hl.config({
    debug = {
        disable_logs = false,
    },
    general = {
        layout = "scrolling",
    },
    scrolling = {
        column_width = 1.0
    }
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "unset" })
hl.gesture({ fingers = 3, direction = "horizontal", action = "scroll_move" })
