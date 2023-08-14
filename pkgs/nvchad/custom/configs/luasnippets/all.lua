local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

local date_input = function (args, snip, old_state, fmt)
  local fmt = fmt or "%d/%m/%Y"
  return sn(nil, i(1, os.date(fmt)))
end

ls.add_snippets("all", {
  s("dn4",
    fmt(
      [[
        Questionnaire DN4

  Compter 1 pour chaque item où la réponse est OUI (✅). Si le score total est ≥ 4, le test est positif (sensibilité à 82,9 % ; spécificité à 89,9 %) et la douleur neuropathique probable.

  QUESTION 1 – La douleur présente-t-elle une ou plusieurs des caractéristiques suivantes ?

      1. Brûlure ? {}
      2. Sensation de froid douloureux ? {}
      3. Décharges éléctriques ? {}

  QUESTION 2 – La douleur est-elle associée dans la même région à un ou plusieurs des symptômes suivants ?

      4. Fourmillements ? {}
      5. Picotements ? {}
      6. Engourdissements ? {}
      7. Démangeaisons ? {}

  QUESTION 3 – La douleur est­‐elle localisée dans un territoire où l’examen met en évidence :

      8. Hypoesthésie au tact ? {}
      9. Hypoesthésie à la piqûre ? {}

  QUESTION 4 : la douleur est­‐elle provoquée ou augmentée par :

      10. Le frottement ? {}
      ]],
      {
        c(1, { t("❌"), t("✅")  }),
        c(2, { t("❌"), t("✅")  }),
        c(3, { t("❌"), t("✅")  }),
        c(4, { t("❌"), t("✅")  }),
        c(5, { t("❌"), t("✅")  }),
        c(6, { t("❌"), t("✅")  }),
        c(7, { t("❌"), t("✅")  }),
        c(8, { t("❌"), t("✅")  }),
        c(9, { t("❌"), t("✅")  }),
        c(10, { t("❌"), t("✅") }),
      }
    )
  ),
  s("plan_adulte",
    fmt(
      [[
          Présence d'une {}
          La douleur est survenue {}
          La douleur semble majorée {}
          La douleur semble soulagée {}

          L'intensité de la douleur {}

          Thérapeuthes vu pour cette douleur : {}

          Attentes : {}

          {}
        ]],
      {
        i(1, "LOCALISATION ET DESCRIPTION"),
        i(2, "RAISON"),
        i(3, "MAJORATION"),
        i(4, "MINORATION"),
        i(5, "EVOLUTION"),
        i(6, "aucun."),
        i(7, "rien à signaler."),
        i(8, "Aucune irradiation n'est décrite."),
      }
    )
  ),
  s("examen_clinique_lombalgie",
    fmt(
      [[
              Examen clinique

              Palpation de la zone : {}
              Mouvement(s) douloureux : {}

              Slump test : {}
              ROT : {}
              Force musculaire : {}
              Test de FABER : {}
              Test de FADIR : {}
              PKB/SKB/Test de Léri : {}
              Lasègue/SLR : {}
              Cluster sacroiliaque de Laslett : {}
              Test de flexion lombaire : {}
          ]],
      {
        i(1, "pas de sensibilité."),
        i(2, "aucun."),
        i(3, "non effectué."),
        i(4, "non effectué."),
        i(5, "non effectué."),
        i(6, "non effectué."),
        i(7, "non effectué."),
        i(8, "non effectué."),
        i(8, "non effectué."),
        i(9, "non effectué."),
        i(10, "non effectué."),
      }
    )
  ),
  s("examen_clinique_cervicalgie",
    fmt(
      [[
                    Examen clinique

                    Palpation de la zone : {}
                    Mouvement(s) douloureux : {}

                    ROT : {}
                    Force musculaire : {}
                    Prise de tension artérielle : {}
                    Palpation des artères carotides : {}
                    Ausculation des artères carotides : {}
                ]],
      {
        i(1, "pas de sensibilité."),
        i(2, "aucun."),
        i(3, "non effectué."),
        i(4, "non effectué."),
        i(5, "non effectué."),
        i(6, "non effectué."),
        i(7, "non effectué"),
      }
    )
  ),
  s("nerfs_craniens",
    fmt(
      [[
                    Examen des nerfs craniens : 

                    I (Olfactif) : {}
                    II (Optique) : {}
                    III (Oculomoteur), IV (Trochléaire), VI (Abducteur) : {}
                    V (Trijumeau) : {}
                    VIII (Cochléovestibulaire) : {}
                    IX (Glossopharyngien), X (Vague) : {}
                    XI : (Accessoire) : {}
                    XII (Hypoglosse) : {}
                ]],
      {
        i(1, "FAIRE SENTIR DES ODEURS"),
        i(2, "ACUITÉ"),
        i(3, "MOUVEMENTS OCULAIRE : SUIVRE UN STYLO DES YEUX (PTOSIS, NYSTAGMUS?)"),
        i(4, "TERRITOIRE SENSITIF DE LA FACE, PALPATION DES MASSETERS CONTRACTÉS"),
        i(5, "FROTTER LES DOIGTS CONTRE UNE OREILLE EN BOUCHANT L'AUTRE"),
        i(6, "LE PATIENT FAIT 'HAAA' (VÉRIFIER LA SYMÉTRIE DU VOILE DU PALAIS)"),
        i(7, "TEST MOTEUR DU SCOM CONTRE RESISTANCE"),
        i(8, "TIRER LA LANGUE (DÉVIATION, ATROPHIE, FASCICULATIONS?)"),
      }
    )
  ),
  s("actup",
    fmt(
      [[
    Activity "comment cela impacte votre quotidien?" :

    {}

    Coping "qu'est ce que vous avez mis en place pour vous soulager?" :

    {}

    Think "Qu'est ce que vous imaginez qu'il se passe dans votre corps?" :

    {}

    Upset "A quel points cela vous affecte?" :

    {}

    People "Comment votre entourage réagit il?" :

    {}

    Attentes "Qu'attendez vous de moi?" :

    {}
          ]],
      {
        i(1, ""),
        i(2, ""),
        i(3, ""),
        i(4, ""),
        i(5, ""),
        i(6, ""),
      }
    )
  ),
  s("ledger_entry",
    fmt(
      [[
          20{}-{}-{} {}
              Revenu:{}:Cabinet {}:Consultation {}    -{}€ ; Payee: {}
              Actifs:CMB:Professionnel:Courant
        ]],
      {
        i(1, "YY"),
        i(2, "MM"),
        i(3, "DD"),
        i(4, "N° FACTURE"),
        i(5, "MOYEN DE PAIEMENT"),
        i(6, "CABINET"),
        i(7, "ADULTE/ENFANT"),
        i(8, "PRIX"),
        i(9, "NOM Prénom"),
      }
    )
  ),
  s("template_mail",
    fmt(
      [[ 
      Bonjour,

      Vous trouverez ci-joint votre facture concernant la consultation du {}.

      Bonne journée.
      ]],
      {
    d(1, date_input, {}),
      }
    )
  ),
  s("courrier_reorientation",
    fmt(
      [[
        M. {} {}

        Ostéopathe D.O. 
        {}

        {}, {}

        {}

        {}

          Cher Docteur,

        Merci de bien vouloir recevoir en consultation {} né(e) le {}. 
        Motif(s) de consultation : {}

        Examen clinique : 

        {}

        Antécédent(s) notable(s) : {}
        
        Face à ce tableau clinique, je préfère me remettre à votre expertise pour d'éventuels examens complémentaires. 

        Je reste à votre disposition pour tout renseignement complémentaire. 

        Je vous prie de croire, Madame, Monsieur, en l'expression de mes sentiments les meilleurs. 

        {}
        Ostéopathe D.O.
      ]],
      {
        i(1, "NOM"),
        i(2, "PRÉNOM"),
        i(3, "ADRESSE"),
        i(4, "CODE POSTAL"),
        i(5, "VILLE"),
        i(6, "TÉLÉPHONE"),
        i(7, "MAIL"),
        i(8, "NOM / PRÉNOM PATIENT"),
        i(9, "DATE NAISSANCE PATIENT"),
        i(10, "MOTIF DE CONSULTATION"),
        i(11, "EXAMEN CLINIQUE"),
        i(12, "ANTÉCÉDENTS"),
        i(13, "NOM PRENOM")
      }
    )
  )
})
