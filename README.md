![](https://img.shields.io/badge/Microverse-blueviolet)

# JavaScript Linters

> Goal of this project is creating linters that can check JavaScript files and provide feedback about errors. The project was built completely by using Ruby.

In this project we are looking for the follwing errors:

   - Wrong indentation
   - Trailing spaces   
   - New line errors
   - Missing tags - (), [], and {}
   - Multiple variable declaration

## Built With

- Ruby
- RSpec for Ruby Testing

## Getting Started

To get a local copy of the repository please run the following commands on your terminal:

     cd <folder>

     git clone https://github.com/ShinobiWarior/JavaScript-Linters.git

To check for errors on a file:

     bin/main js_test.rb

### Install RSpec
To instal RSpec for testing please run the following command on your terminal:
    
    gem install rspec

### Run tests

To test the code, run  `rspec`  from root of the folder using terminal.
- Please keep in mind that modifying the js_test.js file will affect the test results.

##  Good and bad code examples
    
### Wrong indentation
~~~javascript
//Good Code

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

//Bad code

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

~~~

### Trailing spaces (Pipe `|` stands instead of cursor)
~~~javascript
//Good Code

const score = 10;|

//Bad code

const score = 10; |

~~~

### New line errors
~~~javascript
//Good Code

const score = 10;

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

//Bad code

const score = 10;


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

~~~

### Missing tags - (), [], and {}
~~~javascript
//Good Code

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

//Bad code

const person = {
  firstName: "john",
  lastName: "doe",
  age: 30,
  hobbies: "music", "movies", "sports"],
  address: {
      street: "50 main st",
      city: "boston",
      state: "ma"
    
}

~~~

### Multiple variable declaration
~~~javascript
//Good Code

let age = 30;
const old = 31;
const score = 10; 

//Bad code

let age = 30;
const age = 31;
const score = 10; 
~~~

## Author

👤 **Aleksandar Ivezic**

- Twitter: [@AIvezic](https://twitter.com/AIvezic/)
- LinkedIn: [Aleksandar Ivezic](https://www.linkedin.com/in/aleksandar-ivezi%C4%87-1a6b0391/)
- GitHub: [@ShinobiWarior](https://github.com/ShinobiWarior/)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/ShinobiWarior/JavaScript-Linters/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Project is inspired by [Microverse](https://www.microverse.org/?grsf=w9rx3c)


