(add-to-list 'load-path "~/.emacs.d/scripts/")
(require 'org-install)
(require 'w3m-load)
(require 'w3m-e21)
(provide 'w3m-e23)
(require 'emms-setup)
(require 'emms-player-mpd)
(require 'emms-volume)
(require 'git-emacs)
(require 'semantic-ia)
(require 'semantic-gcc)
;;CEDET
(load-file "/usr/share/emacs/site-lisp/cedet/common/cedet.el")
(semantic-load-enable-excessive-code-helpers)
(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)
;; *-mode hooks
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "#00ff00" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "xos4" :family "Terminus")))))
;;etc.
(setq display-battery-mode t)
(setq scroll-bar-mode nil)
(setq doc-view-continuous t)
(setq blink-cursor-mode 1)
;;w3m
 (setq browse-url-browser-function 'w3m-browse-url)
 (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
 (global-set-key "\C-xm" 'browse-url-at-point)
 (global-set-key "\C-xg" 'w3m-goto-url)
(setq w3m-use-cookies t)
;;org-mode
(setq ispell-program-name "aspell")
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)
(setq org-agenda-files (list "~/.org/work.org"
      		       	     "~/.org/school.org"
						 "~/.org/home.org"))
(setq calendar-week-start-day 1)
;; emms (music client)
(emms-standard)
(setq emms-player-mpd-server-name "localhost")
(setq emms-player-mpd-server-port "6600")
(add-to-list 'emms-info-functions 'emms-info-mpd)
(add-to-list 'emms-player-list 'emms-player-mpd)
(setq emms-volume-change-function 'emms-colume-mpd-change)
;; ssh protocol for tramp
(setq tramp-default-method "ssh")
;; Set Tabs
(setq-default tab-width 4)
;; Dictionary
(load "dictionary-init")
(global-set-key [(?\C-c) (s)] 'dictionary-search)
(global-set-key [(?\C-c) (m)] 'dictionary-match-words)
(global-linum-mode 1)
;;gnus
(setq gnus-agent-directory "~/news/agent/")
(setq gnus-article-save-directory "~/news/")
(setq gnus-cache-directory "~/news/cache/")
(setq gnus-directory "~/news/")
(setq gnus-kill-files-directory "~/news/")
(setq mail-source-directory "~/mail/")
(setq nntp-marks-directory "~/news/marks/")
(setq mail-archive-file-name "~/mail/archive")
(setq gnus-message-archive-method '(nnfolder "archive"
	  							   (nnfolder-directory "~/mail/archive")
								   (nnfolder-active-file "~/mail/archive/active")
								   (nnfolder-get-new-mail nil)
								   (nnfolder-inhibit-expiry t)))
(setq user-mail-address "heimdal@athetius.com")
;;server
;;(server-start)
