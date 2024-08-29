(push :HUNCHENTOOT-NO-SSL *features*)

(defsystem "de.smartcityfarm.website"
  :author "bitspook"
  :license "AGPL-3.0-only"
  :depends-on (:in.bitspook.cl-ownpress
               :local-time :serapeum)
  :components ((:module "src"
                :components ((:file "package")

                             (:module "lass"
                              :components ((:file "modern-normalize")
                                           (:file "pollen")
                                           (:file "global-lass")))

                             (:module "widgets"
                              :components ((:file "beitrittsformular"))))))
  :description "Website for SmartCityFarm")
