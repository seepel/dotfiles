(print (+ 1 1))

(fn move-win-left []
  (let [win (hs.window.focusedWindow)
        frame (win:frame)
        screen (win:screen)
        max (screen:frame)]
    (set frame.x max.x)
    (set frame.x max.x)
    (set frame.y max.y)
    (set frame.w (/ max.w 2))
    (set frame.h max.h)
    (win:setFrame frame)))

(fn move-win-right []
  (let [win (hs.window.focusedWindow)
        frame (win:frame)
        screen (win:screen)
        max (screen:frame)]
    (set frame.x (/ max.w 2))
    (set frame.y max.y)
    (set frame.w (/ max.w 2))
    (set frame.h max.h)
    (win:setFrame frame)))

(fn maximize []
  (let [win (hs.window.focusedWindow)
        frame (win:frame)
        screen (win:screen)
        max (screen:frame)]
    (set frame.x max.x)
    (set frame.y max.y)
    (set frame.w max.w)
    (set frame.h max.h)
    (win:setFrame frame)))

(hs.hotkey.bind ["cmd" "shift"] "Left" move-win-left)
(hs.hotkey.bind ["cmd" "shift"] "Right" move-win-right)
(hs.hotkey.bind ["cmd" "shift"] "Up" maximize)
(hs.hotkey.bind ["cmd" "alt" "ctrl"] "R" hs.reload)
