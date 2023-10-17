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

(fn cmd+ctrl [key]
  (hs.eventtap.keyStroke ["cmd" "ctrl"] key))

(fn ctrl+shift [key]
  (hs.eventtap.keyStroke ["ctrl" "shift"] key))

(fn bundle-id []
  (let [win (hs.window.focusedWindow)
        app (win:application)]
    (app:bundleID)))
 
(fn bind-hyper [mods key f bundle-id-handlers]
  (hyper-mod:bind mods key nil
                  (fn []
                    (match (?. bundle-id-handlers (bundle-id))
                      handler (handler)
                      _ (f)))))

(hs.hotkey.bind ["ctrl" "cmd"] "left" move-win-left)
(hs.hotkey.bind ["ctrl" "cmd"] "right" move-win-right)
(hs.hotkey.bind ["ctrl" "cmd"] "up" maximize)

(local slack "com.tinyspeck.slackmacgap")
(local mail "com.apple.mail")

(bind-hyper [] "left" move-win-left)
(bind-hyper [] "right" move-win-right)
(bind-hyper [] "up" maximize)


(bind-hyper [] "a" #(ctrl "a")
            {mail #(cmd+ctrl "a")})
(bind-hyper [] "b" #(ctrl "b"))
(bind-hyper [] "c" #(ctrl "c"))
(bind-hyper [] "d" #(ctrl "d"))
(bind-hyper [] "e" #(ctrl "e"))
(bind-hyper [] "f" #(ctrl "f"))
(bind-hyper [] "g" #(ctrl "g"))
(bind-hyper [] "h" #(ctrl "h"))
(bind-hyper [] "i" #(ctrl "i"))
(bind-hyper [] "j" #(ctrl "j"))
(bind-hyper [] "k" #(ctrl "k"))
(bind-hyper [] "l" #(ctrl "l"))
(bind-hyper [] "m" #(ctrl "m"))
(bind-hyper [] "n" #(ctrl "n"))
(bind-hyper [] "o" #(ctrl "o"))
(bind-hyper [] "p" #(ctrl "p")
            {slack #(cmd "k")})
(bind-hyper [] "q" #(ctrl "q"))
(bind-hyper [] "r" #(ctrl "r"))
(bind-hyper ["cmd"] "r" hs.reload)
(bind-hyper [] "s" #(ctrl "s"))
(bind-hyper [] "t" #(ctrl "t"))
(bind-hyper [] "u" #(ctrl "u"))
(bind-hyper [] "v" #(ctrl "v"))
(bind-hyper [] "w" #(ctrl "w"))
(bind-hyper [] "x" #(ctrl "x"))
(bind-hyper [] "y" #(ctrl "y"))
(bind-hyper [] "z" #(ctrl "z"))
(bind-hyper [] "tab" #(ctrl "tab"))
(bind-hyper ["shift"] "tab" #(ctrl+shift "tab"))

