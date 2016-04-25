import numpy as np
import matplotlib.pyplot as plt

A = np.random.normal(40, 3, 1000)
B = np.random.normal(10, 3, 1000)
plt.hist(A, bins=10)
plt.hist(B, bins=10)
plt.show()

results = []

for _ in range(50):
differences = []
    for run in range(100):
        A = np.random.normal(40, 3, 1000)
        B = np.random.normal(10, 5, 1000)

        hist_A = plt.hist(A, bins=10)
        hist_B = plt.hist(B, bins=10)

        differences.append(hist_A[0][-1] - hist_B[0][-1])
        # print("difference between A and B")
        # print(hist_A[0][-1] - hist_B[0][-1])

# plt.show()
print("-----")
print(np.mean(differences))
results.append(np.mean(differences))

print("-----")
print(np.mean(results))

plt.hist(results)
plt.show()
