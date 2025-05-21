
// Title: HackMD Excercise #22

// Purpose: Implement a function that takes as input three variables, 
// and returns the largest of the three. Do this without using the Dart max() function!

// Author: Mahmoud Khaled 

int maxInthree(int a, int b, int c) {
  
  int temp_max = 0;

  if(a > b) {
    temp_max = a;

  } else {
    temp_max = b;

  }

  if(c > temp_max) {
    return c;

  } else {
    return temp_max;

  }

}

void main() {

  try {

    print(maxInthree(200, 34, 43));

  }  catch(e) {
    print("Please enter a decimal number...");

  }
}