#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(dplyr)

# Define server logic required to draw a histogram
function(input, output, session) {
  
  tabtraits <- reactive({
    read.csv("doc/liste_traits.csv")
  })
  
  tabideaux <- reactive({
    read.csv("doc/liste_ideaux.csv")
  })
  
  tabliens <- reactive({
    read.csv("doc/liste_liens.csv")
  })
  
  tabdefauts <- reactive({
    read.csv("doc/liste_defauts.csv")
  })
  
  observeEvent(input$got, {
    output$traits <-renderText({
      paste0("« ",sample_n(tabtraits(), size=1)[1,1]," »")})
  })

  observeEvent(input$goi, {
    output$ideaux <-renderText({
      paste0("« ",sample_n(tabideaux(), size=1)[1,1]," »")})
  })
  
  observeEvent(input$gol, {
    output$liens <-renderText({
      paste0("« ",sample_n(tabliens(), size=1)[1,1]," »")})
  })
  
  observeEvent(input$god, {
    output$defauts <-renderText({
      paste0("« ",slice_sample(tabdefauts(), n=1)[1,1]," »")})
  })
  
  output$jets <- renderText({
    if (input$methodes=="jets de dés") {
      "Quatre dés 6 sont lancés, celui affichant le chiffre le plus bas est retiré, et on fait la somme des trois restants. On fait cette opération six fois pour obtenir les valeurs à répartir dans les caractéristiques."
    } else if (input$methodes=="achats de points") {
      "Vous avez 27 points. Ces points servent à acheter des valeurs que vous pouvez ensuite répartir parmi vos six caractéristiques."
    } else {
      "Vous avez la liste de valeur suivante. Vous pouvez assigner celles-ci entre vos six caractéristiques comme vous l'entendez."
    }
    })
  
  output$resultats <- renderUI({
    if (input$methodes=="série de valeurs") {
      output$resultats2 <- NULL
      HTML("<br> <strong>15, 14, 13, 12, 10, 8</strong>")
    } else if (input$methodes=="achats de points") {
      output$resultats2 <- NULL
      HTML('<table border=1>
<tr> <th > Coût </th> <td> 0 </td> <td> 1 </td> <td> 2 </td> <td> 3 </td> <td> 4 </td> <td> 5 </td> <td> 7 </td> <td> 9 </td>  </td>
  <tr> <th> Valeur </th> <td> 8 </td> <td> 9 </td> <td> 10 </td> <td> 11 </td> <td> 12 </td> <td> 13 </td> <td> 14 </td> <td> 15 </td> </tr>
  <tr> <th> Modificateur </th> <td> -1 </td> <td> -1 </td> <td> 0 </td> <td> 0 </td> <td> 1 </td> <td> 1 </td> <td> 2 </td> <td> 2 </td> </tr>
   </table>'
           )
    }
    
  })
  
  tablachat <- reactive({
    read.csv("doc/achat.csv")
  })
  

    output$relance <- renderUI({
      if (input$methodes=="jets de dés") {
      actionButton("relance", label = "(Re)lancer")}
    })
    
    observeEvent(input$relance, {
      output$resultats2 <-renderText({
        x1<-c(sample(1:6, 1),sample(1:6, 1),sample(1:6, 1),sample(1:6, 1))
        x2<-c(sample(1:6, 1),sample(1:6, 1),sample(1:6, 1),sample(1:6, 1))
        x3<-c(sample(1:6, 1),sample(1:6, 1),sample(1:6, 1),sample(1:6, 1))
        x4<-c(sample(1:6, 1),sample(1:6, 1),sample(1:6, 1),sample(1:6, 1))
        x5<-c(sample(1:6, 1),sample(1:6, 1),sample(1:6, 1),sample(1:6, 1))
        x6<-c(sample(1:6, 1),sample(1:6, 1),sample(1:6, 1),sample(1:6, 1))
        paste0("[",sum(x1)-min(x1),"] ","[",sum(x2)-min(x2),"] ","[",sum(x3)-min(x3),"] ","[",sum(x4)-min(x4),"] ","[",sum(x5)-min(x5),"] ","[",sum(x6)-min(x6),"]")
        })
    })
    
    
    
    observeEvent(input$export, {
      Nom_du_Personnage<-c(input$nom,"","Caractéristiques","FORCE","DEXTÉRITÉ", "CONSTITUTION","INTELLIGENCE","SAGESSE","CHARISME")
      Classe<-c(input$classes,"","Valeurs",input$force,input$dex,input$con,input$int,input$sag,input$cha)
      X<-c("","","","","","","","","")
      Âge<-c(input$age,"","Traits de personnalité",input$personnalite,"","Histoire du personnage",input$histoire,"","")
      Taille<-c(input$taille,"","Idéaux",input$ideaux,"","","","","")
      Poids<-c(input$poids,"","Liens",input$liens,"","Apparence du personnage",input$apparence,"","")
      Yeux<-c(input$yeux,"","Défauts",input$defauts,"","","","","")
      Peau<-c(input$peau,"","","","","Alliés et organisations",input$allies,"","")
      Cheveux<-c(input$cheveux,"","","","","","","","")
      res<-data.frame(Classe,X,Âge,Taille,Poids,Yeux,Peau,Cheveux)
      write.csv(res,file="Personnage.csv")
    })

}
