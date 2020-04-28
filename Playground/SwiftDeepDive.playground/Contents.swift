/*Given the array of numbers. Create another array called computedNumbers. computedNumbers should multiply each element in the numbers array by the next element. The last element should be multiplied by the first.

e.g. If numbers was equal to:
[3, 1, 4, 2]

computedNumbers should equal [3 x 1, 1 x 4, 4 x 2, 2 x 3] which is:
[3, 4, 8, 6]

Replace the comments with your code.

HINT: In Swift, multiplication is done with the asterisk symbol. e.g. 3 x 4 would be:
3 * 4

IMPORTANT:
1. You should not have to do the calculations yourself, it should be done by the code.
2. You are not allowed to type the numbers 45, 73, 195 or 53 in your solution code.
3. computedNumbers should be created as a variable named exactly as you see in the print statement. Do not change the rest of the code.
 */


var numbers = [45, 73, 195, 53]
var j = 0
//Write your code here
var computedNumbers = Array<Int>()
for i in  0...numbers.count - 1 {
    if j < numbers.count - 1 {
       j += 1
    } else {
       j = 0
    }
    let item =  numbers[i] * numbers[j]
    computedNumbers.append(item)
       
}
print(computedNumbers)



/* Without touching any of the existing code, can you write 3 lines of code to switch around the values held inside the two variables a and b?

Important: You cannot use any numbers in your code. e.g. You can't just write
a = 8
b = 5

Press Run to see the output in the console. If you have written the code correctly, it should print:

a: 8
b: 5
 */

var a = 5
var b = 8
var c = a
a = b
b = c


//Replace this line with your code.

print("a: \(a)")
print("b: \(b)")


let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

//The number of letters in alphabet equals 26

var password = alphabet[Int.random(in: 0...25)] + alphabet[Int.random(in: 0...25)] + alphabet[Int.random(in: 0...25)] + alphabet[Int.random(in: 0...25)] + alphabet[Int.random(in: 0...25)] + alphabet[Int.random(in: 0...25)]

print(password)
