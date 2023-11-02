# Install the following packages if you have not already:
install.packages('ggplot2')
install.packages('RColorBrewer')
install.packages('viridis')

# Once or if the packages are installed, then load them into R:
library(ggplot2)
library(RColorBrewer)
library(viridis )

# Set your working directory:
setwd('C:/Directory')

# Read in a CSV file containing your model predictions. The file should have headings:
Predictions <- read.csv(file = 'C:/Directory/Predictions.csv', header = TRUE)

# View your data. In this example, there are 2 columns, 1 for the true depth value, and the second the modelled/predicted value:
print(Data)

# Create variables from your data:
y <- Predictions$ALT
xr <- Predictions$Modelled

# In this example, the viridis pallete is used:
dfr <- data.frame(x = xr, y = y, d = densCols(xr, y, colramp = colorRampPalette(rev(viridis (30)))))

# In this alternativel example, the rainbow pallete is used:
dfr <- data.frame(x = xr, y = y, d = densCols(xr, y, colramp = colorRampPalette(rev(rainbow (30)))))

# Create a customized scatterplot for your truth and modelled depth predictions:
p <- ggplot(dfr) + 
  geom_point(aes(xr, y, col = d), size = 0.001, shape =20) + 
  scale_color_identity() + 
  theme_bw() + 
  xlim(0, 1.5) +
  ylim(0, 1.5) + 
  geom_abline(linewidth = 0.5, linetype = 2) +
  ylab("Airborne Measured ALT (m)")  +
  xlab("GEE Modelled ALT (m)") +
  xlab("GEE Modelled ALT (m)")  + 
  theme(axis.text.x = element_text(color = "black", size = 11)) +
  theme(axis.text.y = element_text(color = "black", size = 11)) +
  theme(axis.title.x = element_text(color = "black", size = 14)) +
  theme(axis.title.y = element_text(color = "black", size = 14))

# View your scatterplot:
p

# Save your scatterplot as a jpg file:
ggsave("ALT_Scatterplot.jpg", p, width=8, height=8, units="cm", dpi=600)