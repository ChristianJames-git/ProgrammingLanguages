#include "intArray.h"
#include <iostream>

using namespace std;

IntArray::IntArray() : IntArray::IntArray(10) {}

IntArray::IntArray(int s) {
    size = s;
    pA = new int[size];
    hi = size-1;
    lo = 0;
}

IntArray::IntArray(int a, int b) {
    size = b - a + 1;
    if (size < 0) {
        //error
    }
    pA = new int[size];
    hi = b;
    lo = a;
}

IntArray::IntArray(const IntArray &a) {
    size = a.size;
    name = a.name;
    hi = a.hi;
    lo = a.lo;
    pA = a.pA;
}

IntArray::~IntArray() {
    free(pA);
}

//Overload operators
int IntArray::operator==(const IntArray &beqIn) {
    if (this->size != beqIn.size) {
        return 0;
    }
    for (int i = 0; i <= beqIn.size; i++) {
        if (this->pA[this->lo + i] != beqIn.pA[beqIn.lo + i]) {
            return 0;
        }
    }
    return 1;
}

int IntArray::operator!=(const IntArray &bneIn) {
    if ((*this == bneIn) == 0)
        return 1;
    return 0;
}

int &IntArray::operator[](int index) {
    int shiftIndex = index;
    if(shiftIndex > this-> hi || shiftIndex < this->lo) {
        //error
    }
    return this->pA[shiftIndex];
}

IntArray &IntArray::operator=(const IntArray &setIn) {
    if (this->size != setIn.size) {
        //error
    }
    for (int i = 0; i <= setIn.size; i++) {
        this->pA[this->lo + i] = setIn.pA[setIn.lo + i];
    }
    return *this;
}

IntArray IntArray::operator+(const IntArray &add2) {
    return *this/*add1*/ += add2;
}

IntArray &IntArray::operator+=(const IntArray &toAdd) {
    if (this->size != toAdd.size) {
        //error
    }
    for (int i = 0; i <= toAdd.size; i++) {
        this->pA[this->lo + i] = this->pA[this->lo + i] + toAdd.pA[toAdd.lo + i];
    }
    return *this;
}

ostream &operator<<(ostream &b, const IntArray &a) {
    for (int i = a.lo; i <= a.hi; i++)
        cout << a.name << "[" << i << "] = " << a.pA[i] << " ";
    return b;
}

void IntArray::setName(const char *name) { //get rid of const
    this->name = name;
}

void IntArray::getName() {
    cout << name << endl;
}

int IntArray::high() {
    return this->hi;
}

int IntArray::low() {
    return this->lo;
}

//int main() {
//    IntArray a(10);
//    for(int i = a.low(); i <= a.high(); i++)
//        a[i] = i * 10;
//    a.setName("a");
//    cout << a << endl;
//    return 0;
//}