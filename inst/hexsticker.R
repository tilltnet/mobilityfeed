library(hexSticker)
library(ggplot2)
library(emojifont)

d <- data.frame(
  x = 1:3,
  y = rep(1, 3),
  label = c(emoji('bus'), emoji('tram'), emoji("kick_scooter")),
  type = sample(LETTERS[1:3], 3, replace = TRUE)
)


p <- ggplot(d, aes(x, y, label = label), fill = "white") +
  geom_text(family = "EmojiOne",
            size = 26,
            color = "white") +
  theme_void() +
  guides(color = "none") +
  lims(x = c(0, 4.1))


sticker(
  p,
  package = "mobilityfeed",
  p_size = 20,
  s_x = 1,
  s_y = 1.4,
  s_width = 1.5,
  s_height = 1.7,
  h_fill = "#4444ff",
  h_color = "black",
  filename = "inst/figures/mobilityfeed.png"
)
