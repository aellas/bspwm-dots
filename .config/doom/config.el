;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Zac Pizzey"
      user-mail-address "zacpi@pm.me")

;; Font settings
(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 20))
(setq doom-theme 'doom-tokyo-night)
;;(load-theme 'noctalia t)
;; Line numbers
(setq display-line-numbers-type t)

;; Mouse support in terminal
(xterm-mouse-mode 1)

;; Dired settings
(setq dired-listing-switches "-alh --group-directories-first")

;; Treemacs
(setq treemacs-show-hidden-files t)

;; Image file handling
(add-to-list 'auto-mode-alist '("\\.png\\'"  . image-mode))
(add-to-list 'auto-mode-alist '("\\.jpe?g\\'" . image-mode))
(add-to-list 'auto-mode-alist '("\\.gif\\'"  . image-mode))

;; Use multi-vterm after vterm is loaded
(use-package! multi-vterm
  :after vterm)

(setq confirm-kill-emacs nil)
(setq auto-save-default t
      make-backup-files t)
(add-hook 'prog-mode-hook #'rainbow-mode)

(setq doom-modeline-enable-word-count t)
(setq org-directory "~/org/")
(after! org (setq org-hide-emphasis-markers t))
(defun my-weebery-is-always-greater ()
  (let* ((banner '(
                   "        ⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣠⣶⠚⠛⠿⠷⠶⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     "
                   "        ⠀⠀⠀⠀⠀⢀⣴⠟⠉⠀⠀⢠⡄⠀⠀⠀⠀⠀⠉⠙⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀     "
                   "        ⠀⠀⠀⢀⡴⠛⠁⠀⠀⠀⠀⠘⣷⣴⠏⠀⠀⣠⡄⠀⠀⢨⡇⠀⠀⠀⠀⠀⠀⠀     "
                   "        ⠀⠀⠀⠺⣇⠀⠀⠀⠀⠀⠀⠀⠘⣿⠀⠀⠘⣻⣻⡆⠀⠀⠙⠦⣄⣀⠀⠀⠀      "
                   "        ⠀⠀⠀⢰⡟⢷⡄⠀⠀⠀⠀⠀⠀⢸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢻⠶⢤⡀     "
                   "        ⠀⠀⠀⣾⣇⠀⠻⣄⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣀⣴⣿     "
                   "        ⠀⠀⢸⡟⠻⣆⠀⠈⠳⢄⡀⠀⠀⡼⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠶⠶⢤⣬⡿⠁     "
                   "        ⠀⢀⣿⠃⠀⠹⣆⠀⠀⠀⠙⠓⠿⢧⡀⠀⢠⡴⣶⣶⣒⣋⣀⣀⣤⣶⣶⠟⠁⠀     "
                   "        ⠀⣼⡏⠀⠀⠀⠙⠀⠀⠀⠀⠀⠀⠀⠙⠳⠶⠤⠵⣶⠒⠚⠻⠿⠋⠁⠀⠀⠀⠀     "
                   "        ⢰⣿⡇⠀⠀⠀⠀⠀⠀⠀⣆⠀⠀⠀⠀⠀⠀⠀⢠⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     "
                   "        ⢿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠘⣦⡀⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀     ⠀"
                   "        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣷⡄⠀⠀⠀⠀⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀     ⠀"
                   "        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⡀⠀⠀⠀⢸⣿⡄⠀⠀⠀⠀⠀⠀⠀     ⠀"
                   "          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀     "
                   "                                           "
                   ))
         (longest-line (apply #'max (mapcar #'length banner)))
         (start (point)))
    (dolist (line banner)
      (insert (+doom-dashboard--center
               +doom-dashboard--width
               (concat line (make-string (max 0 (- longest-line (length line))) 32)))
              "\n"))
    (put-text-property start (point) 'face 'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn #'my-weebery-is-always-greater)
;; Remove default dashboard widgets
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-footer)
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-loaded)

(use-package nerd-icons-ibuffer
  :ensure t
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

(add-hook 'emacs-startup-hook
          (lambda ()
            (let ( (mgs-list '("Welcome to emacs, the thermonuclear editor."
                               "You enter to Out Space. Emacs on."
                               "Nice day for Emacsing!")) )
              (message (nth (random (length mgs-list)) mgs-list)))))
(add-to-list 'auto-mode-alist '("\\.jsonc\\'" . json-mode))
(add-to-list 'auto-mode-alist '("waybar/config\\'" . json-mode))
