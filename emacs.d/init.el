(add-to-list 'load-path "~/.emacs.d/scripts/")
;;(global-set-key [(control h)] 'delete-backward-char)
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-euphoria)))
(require 'org-install)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(canlock-password "a09aa1f7839142ba8e6a9d6f10aa77382ee469d8")
 '(display-battery-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "green" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 80 :width normal :foundry "xos4" :family "Terminus")))))
(require 'w3m-load)
(require 'w3m-e21)
(provide 'w3m-e23)
 (setq browse-url-browser-function 'w3m-browse-url)
 (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
 ;; optional keyboard short-cut
 (global-set-key "\C-xm" 'browse-url-at-point)
(setq w3m-use-cookies t)
(setq ispell-program-name "aspell")
(display-battery-mode 1)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)
(setq org-agenda-files (list "~/.org/work.org"
      		       	     "~/.org/school.org"
			     "~/.org/home.org"))
(require 'remember)
(setq calendar-week-start-day 1)
;; emms (music client)
(require 'emms-setup)
(emms-all)
(emms-default-players)
(setq emms-source-file-default-directory "~/Music/") ;; ~/Music Default dir
(add-hook 'emms-player-started-hook 'emms-show)
        (setq emms-show-format "NP: %s")
(setq emms-player-mpg321-parameters '("-o" "alsa"))
(require 'emms-streams)
(goto-char (match-beginning 0))
(require 'emms-player-mpd)
(setq emms-player-mpd-server-name "localhost")
(setq emms-player-mpd-server-port "6600")
(add-to-list 'emms-info-functions 'emms-info-mpd)
(add-to-list 'emms-player-list 'emms-player-mpd)
(require 'emms-volume)
(setq emms-volume-change-function 'emms-colume-mpd-change)
;; loading the erc nicklist module
(load "erc-nicklist.el")
;; ssh protocol for tramp
(setq tramp-default-method "ssh")
;; BBDB
(require 'bbdb)
(bbdb-initialize 'gnus 'message)
(bbdb-insinuate-gnus)
;; muse
(require 'muse-mode)
(require 'muse-html)
(require 'muse-latex)
(require 'muse-context)
(require 'muse-project)
(require 'planner)
(require 'remember)
(require 'git-emacs)
;; Set Tabs
(setq-default tab-width 4)
;; lockscreen
 (defun lock-screen ()
   "Lock screen using (zone) and xtrlock
 calls M-x zone on all frames and runs xtrlock"
   (interactive)
   (save-excursion
     ;(shell-command "xtrlock &")
     (set-process-sentinel
      (start-process "xtrlock" nil "xtrlock")
      '(lambda (process event)
         (zone-leave-me-alone)))
     (zone-when-idle 1)))
;; Dictionary
(load "dictionary-init")
(global-set-key [(?\C-c) (s)] 'dictionary-search)
;;(global-set-key [(?\C-c) (m)] 'dictionary-match-words)
(scroll-bar-mode -1)