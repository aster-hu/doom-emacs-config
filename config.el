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

(setq doom-font (font-spec :family "Hack" :size 20 :weight 'semi-light)
     doom-variable-pitch-font (font-spec :family "DejaVu Sans Mono" :size 20 :weight 'normal :width 'normal))

;; ;; ;;Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset
(font-spec :family "Pingfang SC")))

;; Set line spacing globally
(setq-default line-spacing 10)

;; Hide emphasis markers
(setq org-hide-emphasis-markers t)

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
(setq display-line-numbers-type 'relative)
(setq org-roam-ui-mode nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/org/")
(setq org-directory "~/Library/CloudStorage/Dropbox/Code/000_Org-mode")

(setq org-agenda-files (list "gtd.org"
			                        "journal.org"))

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

(setq org-todo-keyword-faces
      (quote (;; 
	      ("NEXT" :foreground "#E8A0BF" :weight bold)
        ("GOAL" :foreground "#2aa198" :weight bold)
              ("LATER" :foreground "#B59FDA" :weight bold)
              ("WAIT" :foreground "#76b1d1" :weight bold)
              ("DONE" :foreground "#97dc97" :weight bold)
              ("ACHIEVE" :foreground "#97dc97" :weight bold)    
              ("MISS" :foreground "#ffe599" :weight bold)
              ("CANCEL" :foreground "#7C9D96" :weight bold)
              )))

;; ;; Alternative highlight TODO keywords style for both dark and light themes
;; (setq org-todo-keyword-faces
;;       (quote (;; 
;; 	      ("NEXT" :foreground "#d66a6a" :weight bold)
;;         ("GOAL" :foreground "#2aa198" :weight bold)
;;               ("LATER" :foreground "#5c778d" :weight bold)
;;               ("WAIT" :foreground "#948f85" :weight bold)
;;               ("DONE" :foreground "#859900" :weight bold)
;;               ("ACHIEVE" :foreground "#859900" :weight bold)    
;;               ("MISS" :foreground "#c29747" :weight bold)
;;               ("CANCEL" :foreground "#948f85" :weight bold))))

;; Define bullets style
(use-package! org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  ;; (org-bullets-bullet-list '("◉" "☷" "○" "◆" "▲" "▶")))
  (org-bullets-bullet-list '("✦" "◉" "⁖" "◆" "▲" "▶")))

;; Define ellipsis
;; (setq org-ellipsis " ⏷ ")
;; (setq org-ellipsis "⤵")
(setq org-ellipsis " [+]")

;; Change priority style via org-fancy-priorities
(use-package! org-fancy-priorities
  :ensure t
  :config
  (setq org-fancy-priorities-list '("⬆" "⬌" "⬇" "☕"))
  (add-hook 'org-mode-hook 'org-fancy-priorities-mode))

(map! "C-u C-u TAB" #'org-set-startup-visibility)

;; Strikethrough the DONE items and set fonts
;;(setq org-fontify-done-headline t)

;; when marking a todo as done, at the time
;; log into drawers right underneath the heading
(setq org-log-done 'time  
      org-log-into-drawer t)

;; Restore original tab behaviour to prevent accident space input
;; https://www.reddit.com/r/DoomEmacs/comments/l0bkx6/restore_default_tab_indentation_behaviour/
(setq-default tab-always-indent t)

;; Set the tags location
(setq org-tags-column -72)
      ;; org-agenda-tags-column -102)

;; Enable electric pair mode and 
(electric-pair-mode 1)
;; Add auto complete for ~tilde~ and {bracket}
(setq electric-pair-pairs
      '((?\~ . ?\~)
        (?\{ . ?\})))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  CAPTURE TEMPLATE KEYS BINDING
;;  GOAL SETTING REVIEW
;;  WEEKLY REVIEW AND MORE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package! org-capture
  :ensure t
  :bind (("C-c c" . org-capture))
  :config
  (setq org-capture-templates
       '(("c" "Capture" entry
	  (file "capture.org")
          "* %?\n"
          :empty-lines-after 1)
          ("d" "Daily" entry
                          (file+olp+datetree "journal.org")
                          "**** [ ] %U %?" :prepend t :kill-buffer t)
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
	 )))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;  ORG-AGENDA
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package! org-super-agenda
:after org-agenda
:init
(setq org-super-agenda-mode t)
;; :commands org-super-agenda-mode
:bind
("C-c a" . 'org-agenda)
:config
(setq org-agenda-skip-deadline-if-done nil
      org-agenda-skip-scheduled-if-done nil
      org-agenda-include-deadlines t
      org-agenda-skip-additional-timestamps-same-entry t
      org-agenda-start-with-log-mode t
      org-agenda-start-day nil ; start from today
      org-agenda-format-date "%F %A"
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
   :hook (org-agenda-mode-hook . org-super-agenda-mode)
      )

;; SHOW AGENDA AT STARTUP SCREEN

;; Open org-agenda at startup
;; (add-hook 'emacs-startup-hook (lambda () (org-agenda nil "z")))

(after! org-agenda
  (let ((inhibit-message t))
    (org-super-agenda-mode)))
    
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;  SET REFILE TARGET LOCATION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-refile-targets '((nil :maxlevel . 9)
                           ("gtd.org" :maxlevel . 9)))

;; Show outline path when refiling
(setq org-outline-path-complete-in-steps nil
      org-refile-use-outline-path t
      org-refile-allow-creating-parent-nodes (quote confirm))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;  ORG-ROAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package! org-roam
  :ensure t
  :custom
  (org-roam-directory (concat org-directory "/roam"))
  (org-roam-dailies-directory "journal/")
  (org-roam-completion-everywhere t)
  ;; (org-roam-capture-templates
  (org-roam-dailies-capture-templates
    '(
      ("d" "default" plain "- %<%H:%M> %?"
      :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d %a>\n#+category: journal\n\n")
       :unnarrowed t)
      ))
    ;;  '(("d" "default" entry
    ;;      "* %<%H:%M>\n %?"
    ;;      :target (file+datetree "journal_2023.org" week))) 
    ;;      ;; refile to a datetree, source: https://org-roam.discourse.group/t/how-to-put-all-the-org-roam-dailies-in-one-file-with-a-date-tree-structure/1561/4
    ;;   ) The con is it cannot be loaded in calendar mode
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-ui-mode)
         ("C-c n c" . org-roam-capture)
         ("C-c n r" . org-roam-refile)
         ("C-c n i" . my-org-roam-node-insert)
	       ("C-c n t a" . org-roam-tag-add)
	       ("C-c n t r" . org-roam-ref-add)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today)
         ("C-c n d d" . org-roam-dailies-goto-today)
         ("C-c n d y" . org-roam-dailies-goto-yesterday)
         ("C-c n d t" . org-roam-dailies-goto-tomorrow)
        ;;  :map org-mode-map
         ("C-M-i" . completion-at-point)
         )
  :config
  (setq org-roam-node-display-template (concat "${type:14} ${title:*}" (propertize "${tags:10}" 'face 'org-tag)))
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  ORG-ROAM CAPTURE TEMPLATES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq org-roam-capture-templates
      '(
        ("i" "Inbox" plain "* %?"
        :target (file "inbox.org")
        :unnarrowed t
          :empty-lines-after 1)
        ("m" "Main" plain
         "\n*Metadata*\n- Link: %?\n- Resource: \n\n"
         :if-new (file+head "1-main/${slug}.org" "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t
         :empty-lines-after 1)
        ("r" "Resource" plain
        "\n*Metadata*\n- Link: %?\n- Resource: \n\n"
         :if-new
         (file+head "2-resource/${slug}.org" "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t
         :empty-lines-after 1)
        ("a" "Article" plain
        "\n*Metadata*\n- Link: %?\n- Resource: \n\n"
         :if-new
         (file+head "3-article/${slug}.org" "#+title: ${title}\n#+filetags: :article:\n")
         :immediate-finish t
         :unnarrowed t
         :empty-lines-after 1)
         ("e" "Review" plain "%?"
         :if-new
         (file+head "4-review/${slug}.org" "#+title: ${title}\n#+filetags: :review:\n\n\n")
         :immediate-finish t
         :unnarrowed t
         :empty-lines-after 1)
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ORG-JOURNAL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (use-package! org-journal
;;   :ensure t
;;   :defer t
;;   :init
;;   ;; Change default prefix key; needs to be set before loading org-journal
;;   (setq org-journal-prefix-key "C-c j "
;;         org-journal-date-prefix "** "
;;         org-journal-time-prefix ""
;;         org-journal-time-format "%R  ")
;;   :bind (("C-c j j" . org-journal-new-entry))
;;   :config
;;   (setq org-journal-dir (concat org-directory "/journal")
;;         org-journal-file-type 'weekly
;;         org-journal-file-format "%Y-W%V.org"
;;         ;; org-journal-file-header "#+TITLE: %B, %Y\n#+category: journal\n\n" ;; Don't use header, it will break the date property
;;         org-journal-date-format "%Y-%m-%d %A")
;;         )

;; ;; Kill journal buffer after saving buffer (By @dhruvparamhans)
;; (defun org-journal-save-entry-and-exit()
;;   "Simple convenience function.
;;   Saves the buffer of the current day's entry and kills the window
;;   Similar to org-capture like behavior"
;;   (interactive)
;;   (save-buffer)
;;   (kill-buffer-and-window))
;; (define-key org-journal-mode-map (kbd "C-x C-s") 'org-journal-save-entry-and-exit)

  ;; :config
  ;; (setq org-journal-dir (concat org-directory "/journal")
	;; org-journal-file-type 'weekly
	;; org-journal-date-prefix "* "
	;; org-journal-time-prefix "** "
	;; org-journal-date-format "%Y-%m-%d %A"
	;; org-journal-created-property-timestamp-format "%Y%m%d"
	;; org-journal-file-header "#+TITLE: Week %W, %Y\n#+category: journal\n\n"
	;; org-journal-file-format "%Y-W%V.org"
	;; org-journal-carryover-items "TODO=\"NEXT\""
	;; org-journal-enable-agenda-integration t
  ;; )




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


;; (setq org-support-shift-select t)


;; Zen mode
;; Decrease text scale from 2
(setq +zen-text-scale 1.2
      writeroom-extra-line-spacing 10)

;; Do not move one space left after leaving insert
(setq evil-move-cursor-back nil)

