;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

;NOTE: manual stuff
;M-xpackage-refresh-contents
;M-x package-install <RET> dracula-theme
; (load-theme 'dracula t)
(load-theme 'gruvbox t)

;(set-frame-font "Inconsolata 18" nil t)
; (set-frame-font "TerminessTTF Nerd Font 20" nil t)
(set-frame-font "xos4 terminus 18" nil t)


;(global-set-key '[8711] 'Control-X-prefix)
;(global-set-key (kbd "<f6> h") (lambda () (interactive) (find-file "~/.emacs.d/lisp/init_hooks.el")))
(global-set-key '[8711] (lambda () (interactive) (find-file "~/MY/org/time.org")))

(global-set-key (quote [f1]) (quote save-buffer))
(global-set-key (quote [f2]) (quote save-buffer))
(global-set-key (quote [f3]) (quote save-buffer))
(global-set-key (quote [f4]) (quote save-buffer))
(global-set-key (quote [f5]) (quote save-buffer))
(global-set-key (quote [f6]) (quote save-buffer))
(global-set-key (quote [f7]) (quote save-buffer))
(global-set-key (quote [f8]) (quote save-buffer))

(global-set-key (quote [f9]) (quote save-buffers-kill-terminal))
(global-set-key (quote [f10]) (quote save-buffers-kill-terminal))
(global-set-key (quote [f11]) (quote save-buffers-kill-terminal))
(global-set-key (quote [f12]) (quote save-buffers-kill-terminal))

; nice defaults and appearance
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(setq inhibit-startup-screen t)
(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-todo-keywords
      ; '((sequence "TODO" "|" "DONE(d)")
      '((sequence "|" "DONE(d)" "NOPE(n)")))
        ; (sequence "RECORD(r)" "|" "HAPPENED")
        ; (sequence "OPTIONAL(o)" "|" "DONE(d)")
        ; (sequence "|" "NOPE(n@)")))
(setq org-todo-keyword-faces
 '(
   ("RECORD" . (:foreground "gold" :weight bold))
   ("OPTIONAL" . (:foreground "aqua" :weight bold))
   )
 )

; awesome plugin
(require 'evil)
(evil-mode 1)

; backup in one place. flat, no tree structure
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

(setq org-archive-location "~/MY/org/finished/archive.org::* From %s")

(setq org-refile-targets '(("~/MY/org/future.org" :level . 2)
                           ("~/MY/org/wiki/all.org" :level . 1)
													 (org-agenda-files :maxlevel . 1)))
(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path t)                  ; Show full paths for refiling

(setq org-default-notes-file "~/MY/org/input.org")

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/MY/org/input.org" "Tasks")
         "* TODO %?\n%u\n%a")
        ("j" "Journal" entry (file+datetree "~/MY/org/journal.org")
         "* %?\nEntered on %U\n%a")))

;; recursively find .org files in provided directory
;; modified from an Emacs Lisp Intro example
(defun sa-find-org-file-recursively (&optional directory filext)
  "Return .org and .org_archive files recursively from DIRECTORY.
If FILEXT is provided, return files with extension FILEXT instead."
  (interactive "DDirectory: ")
  (let* (org-file-list
	 (case-fold-search t)	      ; filesystems are case sensitive
	 (file-name-regex "^[^.#].*") ; exclude dot, autosave, and backup files
	 (filext (or filext "org$\\\|org_archive"))
	 (fileregex (format "%s\\.\\(%s$\\)" file-name-regex filext))
	 (cur-dir-list (directory-files directory t file-name-regex)))
    ;; loop over directory listing
    (dolist (file-or-dir cur-dir-list org-file-list) ; returns org-file-list
      (cond
       ((file-regular-p file-or-dir) ; regular files
	(if (string-match fileregex file-or-dir) ; org files
	    (add-to-list 'org-file-list file-or-dir)))
       ((file-directory-p file-or-dir)
	(dolist (org-file (sa-find-org-file-recursively file-or-dir filext)
			  org-file-list) ; add files found to result
	  (add-to-list 'org-file-list org-file)))))))

(setq org-agenda-text-search-extra-files
      (append (sa-find-org-file-recursively "~/MY/org/wiki" "org")
              (sa-find-org-file-recursively "~/MY/org/wiki" "txt")))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/MY/org/current.org" "~/MY/org/input.org" "~/MY/org/context.org")))
 '(package-selected-packages (quote (gruvbox-theme dracula-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
