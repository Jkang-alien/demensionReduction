library(plotly) 
library(stats) 
data(iris) 
X <- subset(iris, select = -c(Species)) 
axis = list(showline=FALSE, 
            zeroline=FALSE, 
            gridcolor='#ffff', 
            ticklen=4)
fig <- iris %>%  
  plot_ly()  %>%  
  add_trace(  
    type = 'splom',  
    dimensions = list( 
      list(label = 'sepal_width',values=~Sepal.Width),  
      list(label = 'sepal_length',values=~Sepal.Length),  
      list(label ='petal_width',values=~Petal.Width),  
      list(label = 'petal_length',values=~Petal.Length)),  
    color = ~Species, colors = c('#636EFA','#EF553B','#00CC96') 
  ) 
figRaw <- fig %>% 
  layout( 
    legend=list(title=list(text='species')), 
    hovermode='closest', 
    dragmode= 'select', 
    plot_bgcolor='rgba(240,240,240,0.95)', 
    xaxis=list(domain=NULL, showline=F, zeroline=F, gridcolor='#ffff', ticklen=4), 
    yaxis=list(domain=NULL, showline=F, zeroline=F, gridcolor='#ffff', ticklen=4), 
    xaxis2=axis, 
    xaxis3=axis, 
    xaxis4=axis, 
    yaxis2=axis, 
    yaxis3=axis, 
    yaxis4=axis 
  ) 
figRaw

library(tsne)

features <- subset(iris, select = -c(Species)) 

set.seed(0)
tsne <- tsne(features, initial_dims = 2)
tsne <- data.frame(tsne)
pdb <- cbind(tsne,iris$Species)
options(warn = -1)
figTsne <-  plot_ly(data = pdb ,x =  ~X1, y = ~X2, type = 'scatter', mode = 'markers', split = ~iris$Species)

figTsne <- figTsne %>%
  layout(
    plot_bgcolor = "#e5ecf6"
  )


library(umap) 
iris.data = iris[, grep("Sepal|Petal", colnames(iris))] 
iris.labels = iris[, "Species"] 
iris.umap = umap(iris.data, n_components = 2, random_state = 15) 
layout <- iris.umap[["layout"]] 
layout <- data.frame(layout) 
final <- cbind(layout, iris$Species) 

figUmap <- plot_ly(final, x = ~X1, y = ~X2, color = ~iris$Species, colors = c('#636EFA','#EF553B','#00CC96'), type = 'scatter', mode = 'markers')%>%  
  layout(
    plot_bgcolor = "#e5ecf6",
    legend=list(title=list(text='species')), 
    xaxis = list( 
      title = "0"),  
    yaxis = list( 
      title = "1")) 


