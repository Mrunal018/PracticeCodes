# Use double backslashes or forward slashes in file path
mammalsize <- read.csv("mammalsize.csv")

# Check if the data was loaded correctly
print(mammalsize)

str(mammalsize)
colSums(is.na(mammalsize))

numerical_data <- mammalsize[,2:5]

head(numerical_data)
data_normalized <- scale(numerical_data)
print(data_normalized)
head(data_normalized)

corr_matrix <- cor(data_normalized)
# Install ggcorrplot package if not already installed
#install.packages("ggcorrplot")

# Load ggcorrplot package
library(ggcorrplot)
ggcorrplot(corr_matrix)

data.pca <- princomp(corr_matrix)
summary(data.pca)

data.pca$loadings[, 1:2]


# Install factoextra package if not already installed
#install.packages("factoextra")

# Load factoextra package
library(factoextra)

# Assuming data.pca is your PCA result
# Use fviz_eig function to visualize the eigenvalues
fviz_eig(data.pca, addlabels = TRUE)

# Graph of the variables
fviz_pca_var(data.pca, col.var = "black")

fviz_cos2(data.pca, choice = "var", axes = 1:2)

fviz_pca_var(data.pca, col.var = "cos2",
            gradient.cols = c("black", "orange", "green"),
            repel = TRUE)