(fn pprint [x] (print (.. "\n" (fennel.view x) "\n")))
(local hyper-key "f19")
(local hyper-mod (hs.hotkey.modal.new [] nil))
(set hyper-mod.pressed #(hyper-mod:enter))
(set hyper-mod.released  #(hyper-mod:exit))
(hs.hotkey.bind [] hyper-key hyper-mod.pressed hyper-mod.released)
(hs.hotkey.bind ["shift"] hyper-key hyper-mod.pressed hyper-mod.released)

(hs.console.darkMode false)
(when (not (hs.console.darkMode))
  (hs.console.outputBackgroundColor {:white 1})
  (hs.console.consoleCommandColor {:white 0})
  (hs.console.consolePrintColor {:white 0})
  (hs.console.alpha 1))

(when (hs.console.darkMode)
  (hs.console.outputBackgroundColor {:white 0})
  (hs.console.consoleCommandColor {:white 1})
  (hs.console.consolePrintColor {:white 1})
  (hs.console.alpha 1))

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

(fn cmd [key]
  (hs.eventtap.keyStroke ["cmd"] key))

(fn ctrl [key]
  (hs.eventtap.keyStroke ["ctrl"] key))

(fn ctrl+shift [key]
  (hs.eventtap.keyStroke ["ctrl" "shift"] key))

(fn apply [f args]
  (f (table.unpack args)))

(fn bind-hyper [mods key f]
  (hyper-mod:bind mods key nil f))

(bind-hyper [] "left" move-win-left)
(bind-hyper [] "right" move-win-right)
(bind-hyper [] "up" maximize)

(bind-hyper [] "i" #(cmd "right"))
(bind-hyper [] "o" #(cmd "left"))
(bind-hyper [] "p" #(cmd "p"))
(bind-hyper [] "r" hs.reload)
(bind-hyper [] "t" #(cmd "t"))
(bind-hyper [] "w" #(cmd "w"))
(bind-hyper [] "tab" #(ctrl "tab"))
(bind-hyper ["shift"] "tab" #(ctrl+shift "tab"))

