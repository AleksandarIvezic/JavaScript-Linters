//var, let, const

let age =30;
age = 31;
const score =10;

//Strings, Numbers, Boolean, null, undefined


const name = "John";
const age = 30;
const rating = 4.5;
const isCool = true;
const x = null;
const Y = undefined;
let z;

//Object literals

const person = {
    firstName: "john",
    lastName: "doe",
    age: 30,
    hobbies: ["music", "movies", "sports"],
    address: {
        street: "50 main st",
        city: "boston",
        state: "ma"
    }
}

//Arrays - variables that hold multipe values

const numbers = new Array(1, 2, 3, 4, 5);

// Ternary operator
const x = 10;
let color = x > 10 ? "red" : "blue";
console.log(color);

//Switch
color = "green";
switch (color) 
    case "red":
        console.log('color is red');
        break;
    case "blue":
        console.log("color is blue");
        break;
    default:
        console.log("color is not red or blue");
        break;
}

//functions

function addNums (num1 =1, num2 =1) {
    // console.log(num1 + num2);
    return (num1 + num2);
}
addNums(5,5);

// Class
class Person {
    constructor(firstName, lastName, dob) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.dob = new Date(dob);
    }
    getBirthYear() {
        return this.dob.getFullYear();
    }
    getFullName() {
        return `${this.firstName} ${this.lastName}`;
    }

}