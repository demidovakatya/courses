library(dplyr)
library(data.table)
library(ggplot2)
library(bit64)

dir()
# [1] "categories.csv"         "category-views.csv"     "item-views.csv"         "product-categories.csv"
# [5] "products.csv"           "purchases.csv"

categories <- fread('categories.csv', sep = ';')
head(categories)

# category.views <- fread('category-views.csv', sep = ';')
# head(category.views)

item.views <- fread('item-views.csv', sep = ';')
head(item.views)

product.categories <- fread('product-categories.csv', sep = ';')
head(product.categories)

# products <- fread('products.csv', sep = ';')
# head(products)

purchases <- fread('purchases.csv', sep = ';')
head(purchases)

purchases[product_id == 442]
purchases[eventdate > '2016-06-01', list(tc = sum(totalcents))]

purchases[, list(tc = sum(totalcents)), by = ordernumber] %>%
    .[order(-tc)] %>%
    .[tc > 1000]

purchases %>%
    .[, list(orders = uniqueN(ordernumber)), by = externalsessionid] %>%
    .[orders > 1]

purchases[item.views, roll = -Inf, on = c('externalsessionid', 'timestamp')]
