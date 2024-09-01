(ql:quickload '(:de.smartcityfarm.website))

(in-package #:de.smartcityfarm.website)

(toggle-pretty-print-hash-table)

(defun make-scf-form (title)
  (make-html-page-artifact
   :location "/index.html"
   :css-location "/css/form.css"
   :root-widget (make 'scf-form-w :title title)))

(defun build ()
  (let* ((www (path-join *base-dir* "docs/"))
         (static (path-join *base-dir* "src/static/"))
         (*print-pretty* nil))

    (uiop:delete-directory-tree www :validate t :if-does-not-exist :ignore)

    (publish-static :content static :dest-dir www)

    ;; Publish home-page and all its dependencies
    (let ((*already-published-artifacts* nil)
          (form (make-scf-form "Beitrittserklärung")))
      (handler-bind ((file-already-exists #'skip-existing))
        (publish-artifact form www)))

    t))

;; quick hack to auto-build
;; elisp
;; (defun build-website (successp notes buffer loadp)
;;   (sly-eval '(de.smartcityfarm.website::build)))
;; (add-hook 'sly-compilation-finished-hook #'build-website)
