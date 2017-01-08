import numpy as np

from keras.models import Sequential
from keras.layers import Dense, Activation, Embedding
from keras.layers import LSTM

from keras.preprocessing import sequence
from keras.datasets import imdb


max_features = 5000 # maximum number of words (screw less frequent ones)
(X, y), (X_test, y_test) = imdb.load_data(nb_words = max_features)

maxlen = 80 # maximum length of a review (in words)
# fill/truncate reviews
X = sequence.pad_sequences(X, maxlen = maxlen)
X_test = sequence.pad_sequences(X_test, maxlen = maxlen)

model = Sequential()
model.add( Embedding(max_features, 32, dropout = 0.2) )
model.add( LSTM(100, dropout_W = 0.2, dropout_U = 0.2) )
model.add( Dense(1, activation = 'softmax') )

model.compile(loss = 'binary_crossentropy', optimizer = 'adam', 
              metrics = ['accuracy'])

model.fit(X, y, verbose = True)

scores = model.evaluate(X_test, y_test)

print('accuracy: ', round(scores[1] * 100, 3))

