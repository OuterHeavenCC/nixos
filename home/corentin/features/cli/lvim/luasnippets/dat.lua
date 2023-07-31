return {
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
}
