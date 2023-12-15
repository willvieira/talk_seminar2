# code to demostrate Jensens' inequality

library(tidyverse)

Slope = 0.5
tibble(
  x = runif(1000, 0, 10),
  y = exp(x * Slope)
) ->
dt

dt |>
  ggplot() +
  aes(x, y) +
  geom_line(linewidth = 2) +
  theme_classic() +
  geom_segment(
    aes(x = 0, y = exp(5 * Slope), xend = 5, yend = exp(5 * Slope)),
    linetype = 2
  ) +
  geom_segment(
    aes(x = 5, y = 0, xend = 5, yend = exp(5 * Slope)),
    linetype = 2
  )

quartz()
x_sampled = rnorm(1000, 5, 0.8)
y_sampled = exp(x_sampled * Slope)
mean(y_sampled) - mean(exp(5 * Slope))
