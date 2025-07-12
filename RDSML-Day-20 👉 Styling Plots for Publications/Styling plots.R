# Styling plots for publications
# Library required: 
# Additional resourcs for "Publication-ready scatter plots in R". Search it.

library(ggplot2)
install.packages("ggthemes")
library(ggthemes)
install.packages("viridis")
library(viridis)

df = mtcars

df$cyl = as.factor(df$cyl)

# Styling the plots
ggplot(df,aes(x = wt, y = mpg, color = cyl)) +
  geom_point(size = 3)

# Want to write 'cylinder' instead of 'cyl'
ggplot(df,aes(x = wt, y = mpg, color = cyl)) +
  geom_point(size = 3) +
  scale_color_viridis_d(name = "Cylinders") +
  labs(
    title = "Fuel Efficiency by Car weight",
    x = "Weight (1000 lbs)",
    y = "Miles per Gallon"
  ) + 
  theme_classic()

# Controlling the size of font, use different fonts, alignment of title, 
p = ggplot(df,aes(x = wt, y = mpg, color = cyl)) +
  geom_point(size = 3) +
  scale_color_viridis_d(name = "Cylinders") +
  labs(
    title = "Fuel Efficiency by Car weight",
    x = "Weight (1000 lbs)",
    y = "Miles per Gallon"
  ) + 
  theme_classic(base_size = 12, base_family = "serif") +
  theme(plot.title = element_text(face = "bold", size = 16, hjust = 0.5),
        axis.title = element_text(face = "bold", size = 11), # bold, italic, bold.italic
        legend.position = "right", # right, left, top, bottom
        legend.title = element_text(face = "bold.italic"), # bold, italic, bold.italic
        legend.text = element_text(size = 12)
        )

# Saving the plot for publication
ggsave("publication_ggplot.jpeg", p, width = 6, height = 4, dpi = 600) 
# image format (.png, .jpeg, .tiff), the plot name,  desired width, desired height, desired dot per inch
