library(ggplot2)

# Define shades of purple for each cut
cut_colors <- c("Fair" = "#8b5a83", "Good" = "#a05195", 
                "Very Good" = "#d45087", "Premium" = "#f95d6a", 
                "Ideal" = "#ff7c43")

# Create boxplot with faceting by clarity
p <- ggplot(diamonds, aes(x = clarity, y = carat, fill = cut)) +
  geom_boxplot() +
  
  # Add a layer of linear fitting for each cut with different colors
  geom_smooth(method = "lm", se = FALSE, aes(group = cut, color = cut)) +
  
  # Set the y-axis range from 0 to 5
  scale_y_continuous(limits = c(0.3, 3.0)) +
  scale_y_continuous(trans ='log10', ylab("log10(Carat)")) +

  
  # Add a title
  labs(title = "Boxplot of Carat Faceted by Clarity and Cut with Different Colored Linear Fits", x = "Clarity", y = "Carat") +
  
  # Set fill colors for different cuts
  scale_fill_manual(values = cut_colors) +
  
  # Set color scale for different linear fits
  scale_color_manual(values = cut_colors)

# Print the plot
print(p)

