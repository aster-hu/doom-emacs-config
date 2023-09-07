;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Hack" :size 19 :weight 'semi-light)
     doom-variable-pitch-font (font-spec :family "Hack" :size 20))

;; Set line spacing globally
(setq-default line-spacing 10)

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-vibrant)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/org/")
(setq
      org-directory "~/Library/CloudStorage/Dropbox/Code/000_Org-mode"
      org-agenda-files '("~/Library/CloudStorage/Dropbox/Code/000_Org-mode/gtd.org")
      )


(setq projectile-project-search-path '("~/Library/CloudStorage/Dropbox/Code/"))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Set font
;; (setq doom-font (font-spec :family "Hack" :size 20))


;; Turn off evil mode binding
;; Takes a feature symbol or a library name (string)
;; (after! evil
;;  (setq evil-magic nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  STYLE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Alternative highlight TODO keywords style for both dark and light themes
(setq org-todo-keyword-faces
      (quote (;; 
	      ("NEXT" :foreground "#d66a6a" :weight bold)
        ("GOAL" :foreground "#2aa198" :weight bold)
              ("LATER" :foreground "#5c778d" :weight bold)
              ("WAIT" :foreground "#948f85" :weight bold)
              ("DONE" :foreground "#859900" :weight bold)
              ("ACHIEVE" :foreground "#859900" :weight bold)    
              ("MISS" :foreground "#c29747" :weight bold)
              ("CANCEL" :foreground "#948f85" :weight bold))))

;; Define bullets style
(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "☷" "○" "◆" "▲" "▶")))

;; Define ellipsis
;; (setq org-ellipsis " ⏷ ")
;; (setq org-ellipsis "⤵")
(setq org-ellipsis " [+]")

;; Change priority style via org-fancy-priorities
(use-package org-fancy-priorities
  :ensure t
  :config
  (setq org-fancy-priorities-list '("⬆" "⬌" "⬇" "☕"))
  (add-hook 'org-mode-hook 'org-fancy-priorities-mode))


;; Strikethrough the DONE items and set fonts
;;(setq org-fontify-done-headline t)

;; (set-face-attribute
;; 'default nil :font "Hack" :height 201)
;; Chinese Font
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;; (set-fontset-font (frame-parameter nil 'font)
;; charset
;; (font-spec :family "WenQuanYi Micro Hei Mono" :size 24)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;  ORG-AGENDA
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(after! org
  (define-key global-map (kbd "C-c a") 'org-agenda))
  
;; (add-hook 'after-init-hook '(lambda () (org-agenda nil "z")))


(use-package! org-super-agenda
  :commands org-super-agenda-mode)

(after! org-agenda
  (let ((inhibit-message t))
    (org-super-agenda-mode)))

;; (use-package! org-super-agenda
;; :after org-agenda
;; :init
;; (setq org-super-agenda-mode t)
;; :config
(setq org-agenda-skip-deadline-if-done t
      org-agenda-skip-scheduled-if-done t
      org-agenda-include-deadlines t
      org-agenda-skip-additional-timestamps-same-entry t
      org-agenda-start-with-log-mode t
      org-agenda-format-date "%F %a"
      org-agenda-remove-tags nil ;; don't hide all tags
      org-agenda-dim-blocked-tasks 'invisible ;; Make blocked tasks invisible
      org-agenda-current-time-string "ᐊ┈┈┈┈┈┈┈┈┈┈┈ Now"
      org-agenda-prefix-format
      '((agenda . " %i %-12:c%?-12t% s")
        (timeline . "  % s")
	;; Use the OR condition to check if either (not (car (last (org-get-outline-path))))
	;; - meaning the last element is nil) or
	;; (string-blank-p (car (last (org-get-outline-path))))
	;; - meaning the last element is a blank string
	;; evaluates to true. In either of these cases, "gtd" will be displayed. Otherwise, it will truncate the last element of the outline path
	;; This displays the TODO keyword, left-aligned in a 30-character wide column.
	;; It takes the last element of the outline path (the current headline) and truncates it to a maximum of 25 characters
	(todo . " %-30 (if (or (not (car (last (org-get-outline-path)))) (string-blank-p (car (last (org-get-outline-path))))) \"\" (truncate-string-to-width (car (last (org-get-outline-path))) 25 nil nil t))")
        (tags . " %i %-12:c")
        (search . " %i %-12:c"))
      )
      (setq org-agenda-custom-commands
      '(
        ("z" "Super view"
         ((agenda "" ((org-agenda-span 'day)
		      (org-super-agenda-groups
                       '((:name "====================================================================================="
                          :time-grid t
                          :date today
                          :todo "NEXT"
                          :scheduled today
                          :order 1)
			 (:name "Meeting"
				:todo "MEETING")
			 ))))
	  (alltodo "" ((org-agenda-overriding-header "")
		       (org-super-agenda-groups
                        ;; Each group has an implicit boolean OR operator between its selectors.
			'((:name "🔥 Due Today"
                           :deadline today
                           :face (:foreground "#FF80ED"))
                          (:name "☠️ Passed deadline"
				 :and (
				 :deadline past
				 :todo ("NEXT" "LATER"))
                           :face (:foreground "#FF7980"))
			  (:name "🛁 Reschedule"
				 :scheduled past)
			   ;; Ignore items that are already scheduled
			  (:discard (:scheduled t))			  
			  (:name "🌸 Important"
				 :and (
				 :priority>= "B"
					     :todo ("NEXT")))			 
			  (:name "⏳ Do it later"
				 :and (
				       :priority>= "B"
						   :todo ("LATER")
						   ))
                          (:name "🧺 Fill-ins"
				 ;; Show this section after "Today" and "Important", because their order is unspecified, defaulting to 0. Sections are displayed lowest-number-first.
				 :priority< "B"
                                 :order 1)
                          (:name "✈️ Waiting"
				 :todo "WAIT"
				 :order 9)
			  ))))))
  ;;       ("g" "Goal review panel"
	;;  ((tags "Goal=\"Epic\""
	;; 	((org-agenda-overriding-header "Epic goals (evergreen)")))
	;;   (tags "Goal=\"Long\""
	;; 	((org-agenda-overriding-header "Long term goals (2-5 years)")))
	;;   (tags "Goal=\"Medium\""
	;; 	((org-agenda-overriding-header "Medium term goals (half year to 2 years)")))
	;;   (tags "Goal=\"Short\""
	;; 	((org-agenda-overriding-header "Short term goals (within 6 months)")))
	;;   (tags-todo "Goal=\"\""
	;; 	     ((org-agenda-overriding-header "Dormant goal / non-goal"))))
	;;  ((org-agenda-files (list "goal.org"))))
   ))
;;    :hook (org-agenda-mode-hook . org-super-agenda-mode)
      ;; )

;; SHOW AGENDA AT STARTUP SCREEN

;; Open org-agenda at startup
;; (add-hook 'emacs-startup-hook (lambda () (org-agenda nil "z")))

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq initial-buffer-choice (concat org-directory "/gtd.org"))  

(defun my-init-hook ()
  (split-window-right)
  (let ((org-agenda-window-setup 'other-window))
    (org-agenda nil "z")))

(add-hook 'emacs-startup-hook #'my-init-hook)

;; (defun emacs-startup-screen ()
;;   "Display the weekly org-agenda and all todos."
;;   (org-agenda nil "z"))
;; (add-hook 'emacs-startup-hook #'emacs-startup-screen)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;  SET REFILE TARGET LOCATION
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-refile-targets '((nil :maxlevel . 9)
                           ("gtd.org" :maxlevel . 9)))

;; Show outline path when refiling
(setq org-outline-path-complete-in-steps nil
      org-refile-use-outline-path t
      org-refile-allow-creating-parent-nodes (quote confirm))



;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;  ORG-ROAM
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package! org-roam
  :ensure t
  :custom
  (org-roam-directory (concat org-directory "/roam"))
  (org-roam-dailies-directory "journals/")
  (org-roam-completion-everywhere t)
  (org-roam-dailies-capture-templates
    ;; '(
    ;;   ("d" "default" entry "* %<%H:%M>\n  %?"
    ;;    :if-new (file+head "%<%Y-%m-%d %a>.org" "#+title: %<%Y-%m-%d %a>\n\n")
    ;;    :unnarrowed t)
    ;;   )
     '(("d" "default" entry
         "* %?"
         :target (file+datetree "journal.org" week)))
      )
      
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-ui-mode)
         ("C-c n c" . org-roam-capture)
         ("C-c n i" . my-org-roam-node-insert)
	 ("C-c n t a" . org-roam-tag-add)
	 ("C-c n t r" . org-roam-ref-add)
         ;; Dailies
         :map org-roam-dailies-map
         ("j" . org-roam-dailies-capture-today)
         ("d" . org-roam-dailies-goto-today)
         ("y" . org-roam-dailies-goto-yesterday)
         ("t" . org-roam-dailies-goto-tomorrow)
         :map org-mode-map
         ("C-M-i" . completion-at-point))
         :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (org-roam-setup)
  (setq org-roam-node-display-template (concat "${title:*}" (propertize "${type:15} ${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  )


(with-eval-after-load 'org-roam
        (cl-defmethod org-roam-node-type ((node org-roam-node))
           "Return the TYPE of NODE."
           (condition-case nil
               (file-name-nondirectory
                (directory-file-name
                 (file-name-directory
                  (file-relative-name (org-roam-node-file node) org-roam-directory))))
             (error ""))
           ))


;; preview link at the mouse 
(defun my/link-preview ()
  (interactive)
  (let ((display-buffer-alist
         '(;; Bottom side window
           (".*"
            (display-buffer-in-side-window)
            (window-height . 0.25)
            (side . bottom)
            (slot . 0)))))
    (org-open-at-point)))


;; Function to show all backlinks
;; https://emacs-china.org/t/org-roam-v2-backlinks-buffer-headlines/23368/2
;; https://github.com/czqhurricnae/spacemacs-private/blob/master/layers/hurricane-org/local/org-roam-backlink-collections/org-roam-backlink-collections.el
;; (add-to-list 'load-path "~/.emacs.d/plugins")
;; (load "org-roam-backlink-collections.el")

;; Define function to exclude files in archive nodes
;; https://www.reddit.com/r/emacs/comments/veesun/orgroam_is_absolutely_fantastic/
(defun my-org-roam-node-exclude-archive (node)
    (and
   ;; no journal files
   ;; (not (string-match my-date-regexp (org-roam-node-title node)))
   ;; not tagged `archive'
   (not (member "archive" (org-roam-node-tags node)))
   ;; not in any folder named `archive'
   (not (string-match-p "archive/" (org-roam-node-file node)))))

;;;;; Define custom `org-roam-node-insert' functions with filters.
(defun my-org-roam-node-insert nil
 ;; Refined search for org-roam nodes to exclude elements tagged `archive'
  (interactive)
  ;; nb: can add initial search string like "^"
;;  (org-roam-node-find :other-window nil #'my-org-roam-node-exclude-archive)
  (org-roam-node-insert #'my-org-roam-node-exclude-archive)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  ORG-ROAM CAPTURE TEMPLATES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq org-roam-capture-templates
      '(
        ("m" "main" plain
         "\n*Metadata*\nArea: %?\nResource: \nLink: \n\n"
         :if-new (file+head "1-main/${slug}.org"
                            "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t
         :empty-lines-after 1)
        ("r" "resource" plain
        "\n*Metadata*\nArea: %?\nResource: \nLink: \n\n"
         :if-new
         (file+head "2-resource/${slug}.org" "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t
         :empty-lines-after 1)
        ("a" "article" plain
        "\n*Metadata*\nArea: %?\nResource: \nLink: \n\n"
         :if-new
         (file+head "3-article/${slug}.org" "#+title: ${title}\n#+filetags: :article:\n")
         :immediate-finish t
         :unnarrowed t
         :empty-lines-after 1)
         ("e" "review" plain "%?"
         :if-new
         (file+head "4-review/${slug}.org" "#+title: ${title}\n#+filetags: :review:\n\n\n")
         :immediate-finish t
         :unnarrowed t
         :empty-lines-after 1)
               ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  CAPTURE TEMPLATE KEYS BINDING
;;  GOAL SETTING REVIEW
;;  WEEKLY REVIEW AND MORE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(after! org
  (define-key global-map (kbd "C-c c") 'org-capture))

 (setq org-capture-templates
       '(("c" "capture" entry
	  (file "capture.org")
          "* %?\n"
          :empty-lines-after 1)
	 ("t" "Org-todo" entry
	  (file "gtd.org")
	  (file "templates/tpl-todo.org")
	  :empty-lines-after 0)
	 ("g" "Goals") 
	 ("ge" "Epic goals" entry (file+headline "goal.org" 
						 "Epic goals") (file "templates/tpl-goal.org") :empty-lines-after 1) 
	 ("gl" "Long term goal (2-5 years from now)" entry (file+headline "goal.org" 
									  "Long term goals") (file "templates/tpl-goal.org") :empty-lines-after 1) 
	 ("gm" "Medium term goal (6 months up to 2 years)" entry (file+headline "goal.org" 
										"Medium term goals") (file "templates/tpl-goal.org") :empty-lines-after 1) 
	 ("gs" "Short term goals (next 6 months)" entry (file+headline "goal.org" 
								       "Short term goals") (file "templates/tpl-goal.org") :empty-lines-after 1)
	 ("r" "Review") 
	 ("rw" "Weekly review" entry 
          (file buffer-name)
          (file "templates/tpl-w-review.org")) 
	 ("rm" "Monthly review" entry 
          (file buffer-name)
          (file "templates/tpl-m-review.org"))
	 ("rq" "Quarterly review" entry 
          (file buffer-name)
          (file "templates/tpl-q-review.org")) 
	 ("ra" "Annual review" entry 
          (file buffer-name)
          (file "templates/tpl-a-review.org"))            
	 ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  QUERY SEARCH FOR BACKLOG ITEMS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Search items that are not have TODO keywords,
;; no children headlines, and
;; no timestamp

(defun my/view-backlog ()
  (interactive)
  (require 'org-ql)
  (org-ql-search
    (org-agenda-files)
    '(and (not (todo))
          (not (done))
          (not (ts))
          (not (children))
    )
    :sort nil
    :super-groups '((:auto-outline-path t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  WINDOW BUFFER MANAGEMENT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (after! org
;;   (define-key global-map (kbd "SPC b k") 'kill-this-buffer))

;; Auto revert after file changed in the background
(global-auto-revert-mode t)

;; Save previous session
;; If we've saved the positions of our windows and so forth for this project once manually, continue to save them.  Otherwise, do not do so
;; https://www.reddit.com/r/emacs/comments/171me2/auto_save_and_restore_sessions/
(setq desktop-save 'if-exists)
(desktop-save-mode t)

;; https://tecosaur.github.io/emacs-config/config.html#windows
(setq evil-vsplit-window-right t
      evil-split-window-below t)

(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (consult-buffer))

(map! :map evil-window-map
      "SPC" #'rotate-layout
      ;; Navigation
      "<left>"     #'evil-window-left
      "<down>"     #'evil-window-down
      "<up>"       #'evil-window-up
      "<right>"    #'evil-window-right
      ;; Swapping windows
      "C-<left>"       #'+evil/window-move-left
      "C-<down>"       #'+evil/window-move-down
      "C-<up>"         #'+evil/window-move-up
      "C-<right>"      #'+evil/window-move-right)  


(setq org-support-shift-select t)
