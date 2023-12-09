;;; jiroscope.el --- Core Jiroscope APIs -*- lexical-binding: t; coding: utf-8 -*-

(unless (functionp 'module-load)
  (error "Dynamic module feature not available, please compile Emacs --with-modules option turned on"))

;; Load the dynamic module at compile time as well, to satisfy the byte compiler.
(eval-and-compile
  (defconst jiroscope--dyn-version "0.1.0"
    "Required version of the dynamic module `jiroscope-dyn'.")
  (require 'jiroscope-dyn-get)
  (jiroscope-dyn-get-ensure jiroscope--dyn-version))

(require 'jiroscope-dyn)

(defun jiroscope-setup (url login api_token)
  "Setup Jiroscope with the given cloud URL, login and API token."
  (jiroscope-dyn-setup url login api_token))

;; add bindings for interactive use
(defun jiroscope-issue-create ()
  "Create a new issue."
  (interactive)
  (jiroscope-dyn-issue-create-interactive))

(defun jiroscope-issue-display ()
  "Display an issue."
  (interactive)
  (jiroscope-dyn-issue-display-interactive))

(defun jiroscope-issue-edit ()
  "Edit an issue via prompts."
  (interactive)
  (jiroscope-dyn-issue-edit-interactive))

(defun jiroscope-issue-edit-graphical ()
  "Edit an issue in a buffer."
  (interactive)
  (jiroscope-dyn-issue-edit-graphical-interactive))

(defun jiroscope-issue-edit-finish ()
  "Finish editing an issue in a buffer and send it to the server."
  (interactive)
  (jiroscope-dyn-issue-edit-graphical-finish))

(defun jiroscope-issue-delete ()
  "Delete an issue."
  (interactive)
  (jiroscope-dyn-issue-delete-interactive))

(defun jiroscope-issue-transition ()
  "Transition an issue."
  (interactive)
  (jiroscope-dyn-issue-transition-interactive))

(defun jiroscope-project-create ()
  (interactive)
  (jiroscope-dyn-project-create-interactive))

(defun jiroscope-project-edit ()
  "Edit a project via prompts."
  (interactive)
  (jiroscope-dyn-project-edit-interactive))

(defun jiroscope-project-edit-graphical ()
  "Edit a project in a buffer."
  (interactive)
  (jiroscope-dyn-project-edit-graphical-interactive))

(defun jiroscope-project-edit-finish ()
  "Finish editing a project in a buffer and send it to the server."
  (interactive)
  (jiroscope-dyn-project-edit-graphical-finish))

(defun jiroscope-project-delete ()
  "Delete a project."
  (interactive)
  (jiroscope-dyn-project-delete-interactive))

(defun jiroscope-tree-open()
  "Open the project tree buffer."
  (interactive)
  (jiroscope-dyn-state-open))

(defface jiroscope-issue-key
  '((t (:inherit info-title-1)))
  "Face used for issue key headers."
  :group 'jiroscope)

(defface jiroscope-project-key
  '((t (:inherit info-title-1)))
  "Face used for project key headers."
  :group 'jiroscope)

(defface jiroscope-diff-alert
    '((t (:inherit font-lock-warning-face)))
    "Face used for issue diff alerts."
    :group 'jiroscope)

(defface jiroscope-diff-new
    '((t (:inherit font-lock-string-face)))
    "Face used for issue new diff."
    :group 'jiroscope)

(defface jiroscope-diff-old
    '((t (:inherit font-lock-doc-markup-face)))
    "Face used for issue old diff."
    :group 'jiroscope)

(define-button-type 'jiroscope-issue-button
    'follow-link t
    'action 'jiroscope-dyn-issue-button-action)

(define-button-type 'jiroscope-project-button
    'follow-link t
    'action 'jiroscope-dyn-project-button-action)

(defun jiroscope-insert-button (text ty)
  (insert-button text
    :type ty))

(provide 'jiroscope)
