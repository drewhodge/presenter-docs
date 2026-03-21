;; -------------------------------------------------------------------------- ;;
;; File name: presenter-publish.el                                            ;;
;; -------------------------------------------------------------------------- ;;
;; Description:                                                               ;;
;; Configuration for Emacs org-mode publishing system; creates PDF output     ;;
;; from a collection of files written in org-mode.                            ;;
;; -------------------------------------------------------------------------- ;;

;; Set the package installation directory so that packages aren't stored in the
;; ~/.emacs.d/elpa path.
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)

;; Load the publishing system.
(require 'ox-publish)

;; Define the publishing project.
(setq org-publish-project-alist
      `(("master"
         :base-directory "./docs/"
         :base-extension "org"
         :recursive t
         :publishing-directory "./pdf-out/"
         :publishing-function org-latex-publish-to-pdf)

        ("pages"
         :base-directory "./docs/"
         :base-extension "org"
         :recursive t
         :body-only t
         :with-author nil           ;; Don't include author name
         :with-creator t            ;; Include Emacs and Org versions in footer
         :with-toc t                ;; Include a table of contents
         :section-numbers t         ;; Don't include section numbers
         :time-stamp-file nil       ;; Don't include time stamp in file
         :publishing-directory "./pdf-out/"
         :publishing-function org-latex-publish-to-pdf)

        ("assets"
         :base-directory "./docs/"
         :base-extension "css\\|txt\\|jpg\\|gif\\|png"
         :recursive t
         :publishing-directory  "./pdf-out/"
         :publishing-function org-latex-publish-to-pdf)

        ("presenter-guide-pdf" :components ("master"))))

;; Generate the site output.
(org-publish "presenter-guide-pdf" t)

(message "Publish complete!")
