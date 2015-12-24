

## Question 1

A student wants to write into a file called myfile, without deleting its existing content. Which one of the following functions should he or she use?

* f = open('myfile', 'a') - to append to file
* f = open('myfile', 'rw')
* f = open('myfile', 'w+b')
* f = open('myfile', 'w') – truncates content


## Question 2

Which of the following statements are true? 

A) When you open a file for reading, if the file does not exist, an error occurs. 
B) When you open a file for writing, if the file does not exist, a new file is created. 
C) When you open a file for reading, if the file does not exist, the program will open an empty file. 
D) When you open a file for writing, if the file exists, the existing file is overwritten with the new file. 
E) When you open a file for writing, if the file does not exist, an error occurs.

* All of them are correct
* A, B, and D only
* A, B, and E
* B, and D only


## Question 3

Examine the following three functions that take as argument a file name and return the extension of that file. For instance, if the file name is 'myfile.tar.gz' the returned value of the function should be 'gz'. If the file name has no extention, i.e. when the file name is just 'myfile', the function should return an empty string.

```
def get_extension1(filename):
    return(filename.split(".")[-1])
```

```
def get_extension2(filename):
    import os.path
    return(os.path.splitext(filename)[1])
```

```
def get_extension3(filename):
    return filename[filename.rfind('.'):][1:]
```
Which of the these functions are doing exactly what they are supposed to do according to the description above?
* get_extension3 only
* None of them.
* get_extension1 and get_extension3
* get_extension2 an get_extension3


## Question 4

A student is running a Python program like this:
```
>>> python mergefasta.py myfile1.fa myfile2.fa
```
In the mergefasta.py program the following lines are present:
```
import sys
tocheck=sys.argv[1]
```
What is the value of the variable tocheck?
* mergefasta.py
* 'myfile1.fa'
* myfile2.fa
* python


## Question 5

A student launches the Python interpreter from his home directory. His home directory contains another directory called 'mydir'. What will happen when he write the following code at the Python prompt:
```
>>> import os
>>> filenames = os.listdir('mydir')
>>> f= open(filenames[0])
```

* An error will be produced stating that the file to be opened does not exist.
* A variable f representing a file object will be created, and the first file in the directory 'mydir' will be opened for reading in text mode.
* A variable f representing a file object will be created, and the first file in the directory 'mydir' will be opened.
* An error will be produced stating that filename is not subscriptable.
