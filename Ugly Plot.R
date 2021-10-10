library(ggplot2)

points <- 
  data.frame(
    x = rep(1:10,3), 
    y = rep(1:10,3), 
    z = sort(rep(letters[1:2], 15)),
    w = rep(letters[3:4], 15)
  )

ggplot(data = points, 
       mapping = aes(x = x, y = y, col = factor(x))) + 
  geom_point(size = 5) + 
  facet_grid(w ~ z, switch = "y") +
  theme(
    
    plot.background = element_rect(fill = "lightyellow"),
    plot.title = element_text(size = 30, hjust = 0.25),
    plot.subtitle = element_text(size = 30, hjust = 0.75, color = "mediumvioletred", family = "serif"),
    plot.caption = element_text(size = 20, face = "italic", angle = 25),
    
    panel.background = element_rect(fill = 'lightblue', colour = 'darkred', size = 4),
    panel.border = element_rect(fill = NA, color = "green", size = 2),
    panel.grid.major.x = element_line(color = "purple", linetype = 2),
    panel.grid.minor.x = element_line(color = "orange", linetype = 3),
    panel.grid.minor.y = element_blank(),
    
    
    strip.background = element_rect(fill = "blue"),
    strip.text.y = element_text(color = "white"),
    strip.placement = "outside",
    
    legend.background = element_rect(fill = "orangered4"),
    legend.key = element_rect(fill = "orange"),
    legend.direction = "horizontal",
    legend.position = "bottom",
    legend.justification = "center",
    legend.title = element_text(family = "serif", color = "white"),
    legend.text = element_text(family = "mono", face = "italic", color = "limegreen")
    
  ) +
  labs(title = "Music (When High)",
       x = "Measures",
       y = "Time",
       col = "Musical Notes") 

