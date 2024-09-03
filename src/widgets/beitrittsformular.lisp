(in-package #:de.smartcityfarm.website)

(defwidget doc-header-w ()
    (tagged-lass
     `((.doc-header
        :display flex
        :justify-content space-between

        (.brand :font (var --font-title)
                :font-weight (var --weight-bold)
                :font-size (var --scale-4))

        (p :margin 0))))
  (:div.doc-header
   (:div.brand "SmartCityFarm")

   (:div.address
    (:p "SmartCityFarm e.V.")
    (:p "c/o David Zehnter")
    (:p "Reuterstr. 49")
    (:p "12047 Berlin"))))

(defwidget scf-form-w (title css-file-artifact)
    (tagged-lass
     (base-lass)

     `((body :color (var --color-grey-800))
       (.container :width (var --width-md)
                   :margin (var --scale-4) auto)

       (.title
        :font-size (var --scale-6)
        :margin (var --scale-4) 0)

       (.row
        :margin (var --scale-2) 0
        :width (var --size-full)
        :display flex)

       (.field
        :display flex
        :flex-grow 1
        :flex-direction column

        (input :border none
               :border 2px solid (var --color-grey-600)
               :border-top none)

        ("input[type=checkbox]" :margin-right (var --size-2)
                                :height (var --size-5)
                                :width (var --size-5)))

       ((:and .field .inline) :flex-direction row)

       (.smol :font-size (var --size-3)
              :color (var --color-grey-500))

       (.disclaimer :font-size (var --size-4)
                    :padding 0 1rem
                    :color (var --color-grey-600))))
  (:html
   (:head (:title title)
          (:meta :name "viewport" :content "width=device-width, initial-scale=1")
          (when css-file-artifact (:link :rel "stylesheet" :href (embed-artifact-as css-file-artifact 'link))))
   (:body
    (:div.container
     (render 'doc-header-w)
     (:section
      (:header (:h1.title title))
      (:main (:form
              (:p "Hiermit beantrage ich")
              (:div.row
               (:div.field
                (:input :name "name" :type "text")
                (:label :for "name" "Vorname, Name*")))

              (:div.row
               (:div.field (:input :name "strasse" :type "text")
                           (:label :for "strasse" "Strasse, Nummer"))
               (:div.field :style "flex-grow: 0;"
                           (:div
                            (:input :style "width: 2rem;" :name "day" :type "text")
                            (:input :style "width: 2rem;" :name "month" :type "text")
                            (:input :style "width: 4rem;" :name "year" :type "text"))
                           (:label "Geburtsdatum*")))

              (:div.row
               (:div.field :style "width: 5rem;"
                           (:input :name "plz" :type "text")
                           (:label "Plz*"))
               (:div.field :style "flex-grow: 1;"
                           (:input :name "ort" :type "text")
                           (:label "Ort*"))
               (:div.field :style "width: 8rem;"
                           (:input :name "land" :type "text")
                           (:label "Land*")))

              (:div.row
               (:div.field
                (:input :name "email" :type "text")
                (:label "Email*")))

              (:div.row
               (:div.field
                (:input :name "telefon" :type "text")
                (:label "Telefon*")))

              (:p "die Mitgliedschaft im SmartCityFarm e.V als")

              (:div.row
               (:div.field.inline (:input :type "checkbox")
                                  (:label "ordentliches Mitglied"))
               (:div.field.inline (:input :type "checkbox")
                                  (:label "Fördermitglied")))

              (:div.smol (:p "(entsprechendes ankreuzen)"))

              (:div.smol
               (:div "* Pflichtfelder : diese Felder müssen ausgefüllt werden!"))

              (:ul.disclaimer
               (:li "Ich habe die Satzung und Beitragsordnung des SmartCityFarm e.V. zur Kenntnis genommen und erkenne sie mit meiner
Unterschrift an.")
               (:li "Ich erkläre mich damit einverstanden, dass meine Daten gemäß
Datenschutz-Grundverordnung (DSGVO) für vereinsinterne Zwecke erfasst, elektronisch gespeichert und
verarbeitet werden.")
               (:li "Ich bin damit einverstanden, 10 EUR als Aufnahmegebühr und 5 EUR als monatliche
Gebühr zu zahlen.")
               (:li "Mir ist bekannt, dass ich die
Mitgliedschaft jederzeit durch eine SCHRIFTLICHE Mitteilung an den Vorstand beenden kann."))

              (:div "Ich bitte hiermit um entsprechende Veranlassung und schriftliche Bestätigung der Aufnahme in den Verein.")

              (:div.row
               (:div.field (:input :name "ort+datum" :type "text")
                           (:label "Ort + Datum*"))
               (:div.field (:input :name "unterschrift" :type "text")
                           (:label "Unterschrift*"))))))))))
