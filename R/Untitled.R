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
fig <- fig %>% 
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
fig

