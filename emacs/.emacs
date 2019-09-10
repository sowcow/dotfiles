(set-frame-font "Inconsolata 18" nil t)

; nice defaults and appearance
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(setq inhibit-startup-screen t)
(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE(d!)")
        (sequence "RECORD(r)" "|" "HAPPENED")
        (sequence "OPTIONAL(o)" "|" "DONE(d!)")
        (sequence "|" "CANCELED(c@)")))
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
    ("~/MY/org/current.org" "~/MY/org/input.org" "~/MY/org/context.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
