require(tm)
require(SnowballC)

create.corpus <- function(source) {
    c <- Corpus(VectorSource(source)) %>% 
    tm_map(content_transformer(tolower)) %>% 
    tm_map(PlainTextDocument) %>% 
    tm_map(removePunctuation) %>% 
    tm_map(removeWords, stopwords()) %>% 
    tm_map(stemDocument)
}

create.nice.document.term.matrix <- function(corpus, sparseness = 0.95) {
    DocumentTermMatrix(corpus) %>% 
        removeSparseTerms(sparseness) %>% 
        as.matrix %>% as.data.frame
}
