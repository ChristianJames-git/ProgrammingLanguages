# Program #3
# The program reads in the dimensions of 2 arrays from a text file then reads in the arrays themselves.
# Then the program prints the matrices, multiplies the matrices together, and prints the result
# CS320
# 17 October 2020
# @author Christian James cssc2633

import sys


def main():
    if len(sys.argv) != 2:
        print("Usage: p3.py dataFileName")
        sys.exit()
    A = []
    B = []
    C = read_matrices(A, B)
    print("Program #3, cssc2633, Christian James")
    print("Matrix A contents:")
    print_matrix(A)
    print("Matrix B contents:")
    print_matrix(B)
    mult_matrices(A, B, C)
    print("Matrix A * B is:")
    print_matrix(C)


def read_matrices(a, b):
    with open(sys.argv[1]) as f:
        m = [int(x) for x in next(f).split()][0]  # A height & C height
        n = [int(x) for x in next(f).split()][0]  # A width & B height
        k = [int(x) for x in next(f).split()][0]  # B width & C width
        for i in range(m):
            a.append([int(x) for x in next(f).split()])
        for i in range(n):
            b.append([int(x) for x in next(f).split()])
        c = [[0 for i in range(k)] for j in range(m)]
        return c


def print_matrix(arr):
    for i in range(len(arr)):
        for j in range(len(arr[0])):
            sys.stdout.write("%5d" % (arr[i][j]))
        print("")
    print("")


def mult_matrices(a, b, c):
    for i in range(len(a)):
        for j in range(len(b[0])):
            for k in range(len(b)):
                c[i][j] += a[i][k] * b[k][j]


if __name__ == '__main__':
    main()
