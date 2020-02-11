# Correlations
# Exploration of Clinical Data

# Please have your data and code in the same folder
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

install.packages(ggplot2)
install.packages(corrplot)
install.packages(GGally)
install.packages(ggpubr)


library(ggplot2)
library(corrplot)
library(GGally)
library(ggpubr)



clinical_data <- read.csv(file = "ClinicalData.csv", header = TRUE)

data <- clinical_data[-1]

# bring up the correlation matrix between quantitative variables
cor(data)


# One option for Heatmap of correlations
corrplot(cor(data, method = "pearson"),
         method="square",
         order="hclust", tl.cex=0.7, cl.cex=0.5, tl.col="black", addrect=2)


ggplot(data = clinical_data, aes(x=physical_1, y = physical_3)) +
  geom_point() +
  theme_bw() +
  stat_smooth(method="lm", se=FALSE)

# These traits describe exatly the same thing or are confounded by a third (obvious) variable
ggplot(data = clinical_data, aes(x=physical_4, y = physical_5)) +
  geom_point() +
  theme_bw() +
  stat_smooth(method="lm", se=FALSE)


ggplot(data = clinical_data, aes(x=physical_3, y = age)) +
  geom_point() +
  theme_bw() +
  stat_smooth(method="lm", se=FALSE)

ggplot(data = clinical_data, aes(x=physical_3, y = score_2)) +
  geom_point() +
  theme_bw() +
  stat_smooth(method="lm", se=FALSE)







# Pairs is a powerful but time consuming function that builds all scatterplots between variables

# GGally::ggpairs(clinical_data, columns = c(2, 3, 4, 5, 10, 11),
#   aes(colour=Group, alpha=0.4),
#   title="Scatterplot Matrix",
#   upper=list(continuous="density", combo="box"),
#   lower=list(continuous="smooth", combo="dot")) +
#   theme_light() +
#   theme(plot.title=element_text(size=10))

# For those who want to view the Simson's paradox of hidden groups

# ggplot(data = clinical_data, aes(x=physical_3, y = score_2, color = Group)) +
#   geom_point() +
#   theme_bw() +
#   stat_smooth(method="lm", se=FALSE)


# ---------
# Gene Data
# ---------


gene_data <- read.csv(file = "geneData.csv", header = TRUE, row.names = 1)

data <- gene_data

# bring up the correlation matrix between quantitative variables
cor(data, method = "spearman")


# One option for Heatmap of correlations
corrplot(cor(data, method = "spearman"),
         method="square",
         order="hclust", tl.cex=0.7, cl.cex=0.5, tl.col="black", addrect=2)


ggplot(data = gene_data, aes(x=gene_1, y = gene_2)) +
  geom_point() +
  theme_bw() +
  stat_smooth(method="lm", se=FALSE) +
  stat_cor(method="pearson", show.legend = TRUE)
  # stat_cor(method="spearman", show.legend = TRUE)

# These traits describe exatly the same thing or are confounded by a third (obvious) variable
ggplot(data = gene_data, aes(x=gene_6, y = gene_5)) +
  geom_point() +
  theme_bw() +
  stat_smooth(method="lm", se=FALSE) +
  # stat_cor(method="pearson", show.legend = TRUE)
  stat_cor(method="spearman", show.legend = TRUE)

ggplot(data = gene_data, aes(x=gene_3, y = gene_4)) +
  geom_point() +
  theme_bw() +
  stat_smooth(method="lm", se=FALSE) +
  # stat_cor(method="pearson", show.legend = TRUE)
  stat_cor(method="spearman", show.legend = TRUE)










