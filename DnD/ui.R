#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(bslib)


# Define UI for application that draws a histogram


fluidPage(
  
  titlePanel("Aide à la création d'un personnages de Donjons et Dragons (5e Edition)"),

  navset_pill(
    nav_panel(title = "Présentation", 
              fluidRow(
                column(12,
                       p(strong("Bienvenue sur cette petite application destinée à accompagner les nouveaux joueurs, et donner un coup de pouce aux anciens, dans la création d'un personnage pour le jeu de rôle sur table Donjons et Dragons.")),
                       p(strong("Jeu de rôle sur table :"),em("Le jeu de rôle sur table, ou JDR, est une activité ludique réunissant autour d’une table de 2 à 5 participants, les joueurs. Chaque joueur incarne un personnage qu’il va interpréter, c’est-à-dire qu’il va parler et décrire ses actions comme s’il était dans la peau de ce personnage. A travers leur personnage, les joueurs vont interagir et évoluer dans un univers, lui aussi fictif, qui sera présenté et animé par une tierce personne : le Maître du Jeu (MJ), aussi appelé Conteur. Ce dernier a pour but d’immerger les joueurs dans une histoire. Il décrit le contexte, le décor, et interprète tous les personnages non joueurs. C’est le garant de l’univers, des règles du jeu et de la dynamique du groupe."),"- Définition extraite du site", a(href="https://lesclefsdureve.com/a-propos/jeu-de-role-definition/","Les Clefs du Rêve.")),
                       p(strong ("Univers de Donjons et Dragons :"),em("Le monde, ou les mondes, de Donjons et Dragons, sont peuplés de guerriers, de magiciens, de créatures fantastiques et d'aventures à suivre dans un univers de style médiéval fantastique. Vous êtes un aventurier, et vous et votre groupe partez à la conquête de votre destin !")),
                       p("Avant de pouvoir débuter votre aventure dans l'un des nombreux plans de Donjons et Dragons vous allez devoir créer un personnage, votre avatar dans cet univers, qui suivra (et subira) vos choix."),
                       p("Pour vous aider dans la création de celui-ci, vous pourrez utiliser cette application en en suivant les instructions pas à pas. Passez d'un onglet à l'autre pour remplir votre fiche que vous pourrez ensuite exporter."),
                       p(em("Application en cours d'amélioration : actuellement limitée à la gestion de l'apparence, l'histoire, le caractère, les caractéristiques et la classe du personnage.")),
                         
                       hr()
                )),
              
              fluidRow(
                column(3, align="center",
                       h4("Personnage")),
                column(3, align="center",
                       h4("Tirer ses dés...")
                ),
                column(3, align="center",
                       h4("... et choisir sa classe")
                ),
                column(3, align="center",
                       h4("Extraction")
                )
              ),
              
              fluidRow(
                column(3, style="border: groove",
                       p("Cet onglet est là pour vour permettre de décrire qui est votre personnage hors de ses caractéristiques mécaniques. C'est à dire son nom, son apparences physique, son histoire personnelle et son caractère."),
                       p('Tous les éléments qui sont plus liés à son roleplay, son "fluff" (ce qui est autour des règles et des mécaniques de jeu sans les influencer), et qui ne sont techniquement pas encadrées par les règles.'),
                       p("Dans cette section vous décrirez une apparence qui sera évidemment lié à votre race, et vous pourrez décrire comment vous en êtes arrivé à devenir un magicien, un roublard ou un guerrier ; mais c'est dans l'onglet Race et Classe que vous sélectionnerez ces caractéristiques précisement.")),
                column(6, style="border: groove",
                       p("Dans cet onglet vous pourrez jeter les dés vous permettant de déterminer vos caractéristiques, ou utiliser l'une des deux autres méthodes pour obtenir ces valeurs."),
                       p("Ces méthodes étant :"),
                       p("- Méthode aux dés, en lançant 4d6 et en faisant la somme des trois meilleurs dés à six reprises ;"),
                       p("- Méthode d'achat, avec un nombre de points à répartir vous permettant d'acheter des valeurs à répartir dans vos caractéristiques ;"),
                       p("- Méthode de la série, où vous avez de base six valeurs à répartir dans vos caractéristiques."),
                       p("Dans chaque cas, vous pourrez voir quelle classe serait conseillée pour votre personnage selon vos résultats, en vous aidant du descriptif de chacune d'entre elles.")
                       ),
                column(3, style="border: groove",
                       p("Ici vous n'aurez qu'un simple bouton, cliquez dessus pour obtenir votre Fiche de personnage, exportée sur csv.")
                )
              )),
    
    nav_panel(title = "Personnage",
              fluidRow(
                column(12,
                       p(strong("Qui est ton personnage ?"),
                       em("Son caractère, son apparence, son histoire.")),
                       h2("Pointeurs de personnalité")
                       )),
              

              fluidRow(style="background-color:lightblue",
                column(3, 
                       textAreaInput("personnalite","Traits de personnalité",placeholder = "Ce qui différencie votre personnage des autres, quelque chose qui lui est spécifique.", width=430),
                       
                       actionButton("got","exemple"),
                       helpText(textOutput("traits"))
                       ),
                column(3,
                       textAreaInput("ideaux","Idéaux",placeholder ="Un idéal qui anime votre personnage, auquel il croit fortement, ses principes moraux fondamentaux.", width=430),
                       
                       actionButton("goi","exemple"),
                       helpText(textOutput("ideaux"))
                ),
                column(3,
                       textAreaInput("liens","Liens",placeholder ="Un attachement de votre personnage qui pourrait le pousser à agir, parfois à l'encontre de ses principes.", width=430),
                      
                       actionButton("gol","exemple"),
                       helpText(textOutput("liens"))
                ),
                column(3,
                       textAreaInput("defauts","Défauts", placeholder="Une vice, une contrainte, une faiblesse de votre personnage. Quelque chose que l'on pourrait exploiter contre lui.", width=430),
                       
                       actionButton("god","exemple"),
                       helpText(textOutput("defauts"))
                )
              ),
              
              fluidRow(
                column(2, style="background-color:lightgray",
                       h2("Personnalisation"),
                       textInput("nom","Nom du personnage"),
                       textInput("age","Âge"),
                       textInput("taille", "Taille"),
                       textInput("poids", "Poids"),
                       textInput("yeux","Yeux"),
                       textInput("peau","Peau"),
                       textInput("cheveux","Cheveux"),
                       em("Ses caractéristiques physiques résumées en quelques valeurs")
                                 
              ),
              column(9,
                     h2("Détaillée"),
                     column(4,
                            textAreaInput("histoire","Histoire du personnage", width=430, height=420),
                            em("Quelle a été sa vie jusqu'ici, où a-t-il grandi, comment est-il devenu ce qu'il est ?")),
                     column(4,
                            textAreaInput("apparence","Apparence du personnage", width=430, height=420),
                            em("A quoi ressemble-t-il, quelle impression donne-t-il, comment s'habille-t-il dans telle situation ?")),
                     column(4,
                            textAreaInput("allies","Alliés et organisations", width=430, height=420),
                            em("Les liens qu'il entretient ou a entretenu avec des groupes relativement important. Cela peut simplement être son village de naissance, une guilde où il a travaillé ou travaille actuellement, ou un clan relativement renommé."))

                     
                     )
  )


),

      nav_panel(title="Tirer ses dés et choisir sa classe",
                fluidRow(
                  column(3, style="background-color:lightblue; border: solid gray",
                    selectInput("methodes", "Choix de la méthode", choices = c("jets de dés", "achats de points", "série de valeurs")),
                    textOutput("jets")
                  ),
                  column(9,
                         selectInput("classes", "Classe choisie :", choices = c("Barbare","Barde", "Clerc","Druide",
                           "Ensorceleur",
                           "Guerrier",
                           "Magicien",
                           "Moine",
                           "Occultiste",
                           "Paladin",
                           "Rôdeur",
                           "Roublard"
                         ))
                         )),
                  
                fluidRow(
                      column(3,
                    strong("Résultats :"),
                    uiOutput("relance", style="position:absolute;top:1.65em;left:19em"),
                    htmlOutput("resultats"),
                    verbatimTextOutput("resultats2"),
                    hr(),

                    tags$form(
                      class="form-horizontal",
                      tags$div(
                        class="form-group",
                        tags$label(class = "col-sm-3 control-label", `for` = "force", "FORCE"),
                        column(width = 2, textInput(inputId = "force", label = NULL, width = 45)),
                        column(width = 7, p("La puissance physique, l'aptitude athlétique naturelle. Influence les jets d'attaque, les dégats et la capacité de port.", strong("Athlétisme")))
                      ),
                      
                      tags$div(
                        class="form-group",
                        tags$label(class = "col-sm-3 control-label", `for` = "dex", "DEXTÉRITÉ"),
                        column(width = 2, textInput(inputId = "dex", label = NULL, width = 45)),
                        column(width = 7, p("L'agilité, les réflexes, l'équilibre. Influence les jets d'attaque, les dégats, la classe d'armure et l'initiative.", strong("Acrobaties, Discrétion, Escamotage")))
                      ),
                      tags$div(
                        class="form-group",
                        tags$label(class = "col-sm-3 control-label", `for` = "con", "CONSTITUTION"),
                        column(width = 2, textInput(inputId = "con", label = NULL, width = 45)),
                        column(width = 7, p("La santé, l'endurance, la force vitale. Influence les points de vie."))
                      ),
                      tags$div(
                        class="form-group",
                        tags$label(class = "col-sm-3 control-label", `for` = "int", "INTELLIGENCE"),
                        column(width = 2, textInput(inputId = "int", label = NULL, width = 45)),
                        column(width = 7, p("L'acuité mentale, le raisonnement, la mémoire. Influence la capacité de lancer des sorts.", strong("Arcanes, Investigation, Histoire, Nature, Religion")))
                      ),
                      tags$div(
                        class="form-group",
                        tags$label(class = "col-sm-3 control-label", `for` = "sag", "SAGESSE"),
                        column(width = 2, textInput(inputId = "sag", label = NULL, width = 45)),
                        column(width = 7, p("La perception, l'intuition, la perspicacité. Influence la capacité de lancer des sorts.", strong("Dressage, Intuition, Médecine, Perception, Survie")))
                      ),
                      tags$div(
                        class="form-group",
                        tags$label(class = "col-sm-3 control-label", `for` = "cha", "CHARISME"),
                        column(width = 2, textInput(inputId = "cha", label = NULL, width = 45)),
                        column(width = 7, p("La force de personnalité, l'éloquence, le leadership.Influence la capacité de lancer des sorts.", strong("Intimidation, Persuasion, Représentation, Tromperie")))
                      )
                      )  
                    ),
                  column(3, style="border: solid",
                         strong("BARBARE"),
                         p("Les barbares assument leurs instincts naturels, leur physique primitif et leur rage féroce. Ils peuvent entrer en rage et devenir fous furieux, ce qui leur donne une force et une résistance au-delà des limites humaines. Un barbare ne peut puiser dans cette réserve de furie que quelquefois avant de devoir se reposer, mais ces quelques rages sont généralement suffisantes pour annihiler toute menace."),
                         strong("Vos caractéristiques les plus élevées sont en premier lieu la Force, puis la Constitution.")),
                  column(3, style="border: solid",
                         strong("BARDE"),
                         p("La plus grande force du barde est son incontestable polyvalence. Ils préfèrent souvent demeurer en retrait lors d’un combat, utilisant plutôt la magie pour inspirer leurs alliés et gêner leurs ennemis. Mais ils sont tout aussi bien capables de se défendre au corps à corps, employant leur magie pour renforcer armes et armure. Leurs sorts tendent vers le charme et les illusions plutôt que la destruction brutale."),
                         strong("Vos caractéristiques les plus élevées sont en premier lieu le Charisme, puis la Dextérité")),
                  column(3, style="border: solid",
                         strong("CLERC"),
                         p("La capacité de lancer des sorts des clercs repose sur la dévotion et un sens intuitif de la volonté divine. Ils combinent la magie utile de guérison et d'inspiration de leurs alliés avec des sorts néfastes ou gênants pour les adversaires. Ils peuvent provoquer la crainte et l'effroi, invoquer les malédictions de peste ou de poison et même faire s'abattre des flammes célestes pour consumer leurs ennemis."),
                         strong("Vos caractéristiques les plus élevées sont en premier lieu la Sagesse, puis la Force ou la Constitution")),
                  column(3, style="border: solid",
                         strong("DRUIDE"),
                         p("Les druides vénèrent la nature plus que tout, obtenant leurs sorts et leurs autres pouvoirs magiques soit des forces de la nature elles-mêmes, soit d'une divinité de la nature. Les sorts de druide sont orientés vers la nature et les animaux - le pouvoir des crocs et des griffes, du soleil et de la lune, du feu et du tonnerre. Les druides gagnent également la capacité de prendre la forme d'un animal."),
                         strong("Vos caractéristiques les plus élevées sont en premier lieu la Sagesse, puis la Constitution")),
                  column(3, style="border: solid",
                         strong("ENSORCELEUR"),
                         p("La magie fait partie intégrante de tout ensorceleur. Elle insuffle au corps et à l’esprit une puissance latente qui n’attend que d’être éveillée. En apprenant à maîtriser et canaliser celle-ci, ils peuvent découvrir des manières nouvelles et stupéfiantes de libérer leur puissance. Certains ensorceleurs sont imprégné par la magie des dragons, d’autres portent une magie brute et incontrôlable."),
                         strong("Vos caractéristiques les plus élevées sont en premier lieu le Charisme, puis la Constitution")),
                  column(3, style="border: solid",
                         strong("GUERRIER"),
                         p("Les guerriers apprennent l'essentiel de tous les styles de combat. Chaque guerrier peut balancer un coup de hache, parer avec une rapière, manier une épée longue ou une épée à deux mains, utiliser un arc et même piéger des adversaires dans un filet avec un certain degré d'habileté. De même, un guerrier connaît le maniement des boucliers et l'utilisation de toutes les formes d'armure. "),
                         strong("Vos caractéristiques les plus élevées sont en premier lieu la Force ou la Dextérité, puis la Constitution")),
                  column(3, style="border: solid",
                         strong("MAGICIEN"),
                         p("Les magiciens sont des lanceurs de sorts qui  tirent leurs pouvoirs magiques de leurs études de la Magie. Ils se divisent entre différentes Traditions Arcaniques, qui représentent chacunes une forme spécifique de magie. Leurs plus puissants sorts peuvent changer une substance en une autre, faire tomber des météores du ciel ou bien encore ouvrir des portails sur d'autres mondes."),
                         strong("Vos caractéristiques les plus élevées sont en premier lieu l'Intelligence, puis la Dextérité ou la Constitution")),
                  column(3, style="border: solid",
                         strong("MOINE"),
                         p("Par la voie des poings, des armes ou du mysticisme, les moines sont unis par le suivi d'une discipline. Une vocation qui les mène au summum de leur art et imprègne leurs techniques de combat d'une énergie mystérieuse leur permettant d'accomplir des miracles. Ils apprennent à gérer cette ressource mystérieuse qu'est le Ki pour transformer leur corps en arme et leur esprit en sanctuaire."),
                         strong("Vos caractéristiques les plus élevées sont en premier lieu la Dextérité, puis la Sagesse")),
                  column(3, style="border: solid",
                         strong("OCCULTISTE"),
                         p("Certains se mettent au service d'entités magiques diverses et leur doivent obéissance. En retour, ces entités leur offrent un pouvoir magique immédiat pour ceux qui en serait dénués à la naissance. S'ils sont plus limités dans leurs capacités magiques que les autres lanceurs de sorts, ils n'ont en échange pas besoin d’autant de temps pour reconstituer leurs capacités."),
                         strong("Vos caractéristiques les plus élevées sont en premier lieu le Charisme, puis la Constitution")),
                  column(3, style="border: solid",
                         strong("PALADIN"),
                         p("Les paladins s'entraînent de nombreuses années afin d'acquérir des compétences au combat, de maîtriser une large gamme d'armes et d'armures. Cependant, leur compétences martiales sont secondaires par rapport à leurs pouvoirs magiques : celui de soigner les malades et les blessés, détruire les êtres malfaisants, protéger les innocents et tous ceux les rejoignant dans leur lutte pour la justice."),
                         strong("Vos caractéristiques les plus élevées sont en premier lieu la Force, puis le Charisme")),
                  column(3, style="border: solid",
                         strong("RÔDEUR"),
                         p("Guerriers des étendues sauvages, les rôdeurs sont spécialisés dans la traque des monstres qui menacent les remparts de la civilisation. Ils apprennent à traquer leurs proies comme le font les prédateurs, se déplaçant silencieusement à travers les fourrés en se cachant dans les buissons. Leurs sorts, comme leurs aptitudes de combat, améliorent leur vitesse, leur discrétion et leurs capacités de chasse."),
                         strong("Vos caractéristiques les plus élevées sont en premier lieu la Dextérité, puis la Sagesse")),
                  column(3, style="border: solid",
                         strong("ROUBLARD"),
                         p("Les roublards consacrent autant d'effort à la maîtrise d'une variété de compétences qu'au perfectionnement de leurs capacités de combat, ce qui leur donne une large expertise à laquelle peu d'autres personnages peuvent prétendre. Un roublard préférera donner un seul coup précis, le plaçant exactement à l'endroit qui blessera le plus la cible, plutôt qu'user son adversaire avec une série d'attaques."),
                         strong("Vos caractéristiques les plus élevées sont en premier lieu la Dextérité, puis l'Intelligence ou le Charisme"))
                    )
                  ),
    nav_panel(title="Extraction",
              actionButton("export","Exporter son personnage")
              )
))