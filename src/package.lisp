(defpackage de.smartcityfarm.website
  (:use #:cl #:serapeum/bundle)
  (:import-from #:spinneret :with-html)
  (:import-from #:in.bitspook.cl-ownpress
   :start-rpc-server :stop-rpc-server
   :artifact :css-file-artifact :html-page-artifact :artifact-deps
   :make-font-artifact :embed-artifact-as :link :tagged-lass
   :defwidget :render :make-html-page-artifact :publish-static
   :publish-artifact :font-face :*base-url* :skip-existing :file-already-exists
                     :*already-published-artifacts* :artifact-location
                     :artifact-id))

(in-package #:de.smartcityfarm.website)

(defparameter *fonts-dir*
  (asdf:system-relative-pathname "de.smartcityfarm.website" "src/fonts/"))

;; (defparameter *base-url* "/")
(defparameter *base-url* "https://solarpunk-berlin.github.io/smartcityfarm")

(defparameter *base-dir* (asdf:system-relative-pathname :de.smartcityfarm.website ""))

(defparameter *site-title* "Smart City Farm e.V.")
