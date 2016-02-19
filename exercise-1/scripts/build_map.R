#Needed libraries
library(plotly)
library(dplyr)

# Build a map
build_map <- function(data) {
   # Dealing with the `Shots Fired` column
   # Creating a new Numeric variable with no space in the name
   # Replacing NA values with the mean (that makes sense, right?)
   data$shots_fired <- as.numeric(data[, 'Shots Fired'])
   data <- data %>%
      mutate(shots_fired = ifelse(
         is.na(shots_fired),
         mean(shots_fired, na.rm = T),
         shots_fired
      ))
   
   #### From here down, you should make changes ####
   # Create a bubble map of the data
   g <- list(
      scope = 'usa',
      projection = list(type = 'albers usa'),
      showland = FALSE,
      landcolor = toRGB("gray85"),
      subunitwidth = 1,
      countrywidth = 0,
      subunitcolor = toRGB("gray85"),
      countrycolor = toRGB('gray85')
   )
   
   
   # Create graph
   map <- plot_ly(
      data,
      lon = lng,
      lat = lat,
      text = paste(
         '<b>Name:</b>',
         data[, "Victim Name"],
         '<br><b>Shots Fired:</b>',
         data$shots_fired
      ),
      hoverinfo = 'text',
      marker = list(
         size = 1 + shots_fired / 3,
         opacity = .4,
         color = 'red'
      ),
      type = 'scattergeo',
      locationmode = 'USA-states'
   ) %>%
      layout(title = 'Crowdsourced Police Shootings', geo = g)
   
   return(map)
}