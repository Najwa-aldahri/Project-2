
![تنزيل](https://github.com/user-attachments/assets/63d4c1a0-3a5a-466e-a091-a6b7d53d40ec)

## Second Project On Tuwaiq Bootcamp 
### Library System Project 📚
In this project i worked on JSON Data Structure with Library system,keep Scroll and explore my project😁.


<p align="center">
  <a href="#key-features">Key Features</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#contributing">Contributing</a> •
  <a href="#output-screenshots">Output Screenshots</a> •
</p>


 
## Key Features
In the library system the goal is to manage the library system we have two main user flow admin and customer each have diffrent functionality 
### 1-Admin User Flow
#### Display the library information
   - In this function a list of the library data will be displayed to the admin
#### Add new book to the library
   - Only the admin can add new book to the data set by filling the required information (such as name, author, etc..)
#### Remove book from the library
   - Here also the admin will have the access to remove book from the library data set
#### View all receipt
   - When customer completes the purchase the admin can view the invoices in the system with detailed information (such as the customer’s name and order details).

  
### 1-Customer User Flow
#### Display the library information
  - In this function a list of the library data will be displayed to the customer
  
#### Buy book from the library
  - This function will allow the customer to buy from the library first a list ao the books will be displayed and then the user will select the book to buy

#### View the receipt for purchase
  - After the cusomer complete the purchase process can view the total amount in the view receipt function 


## How To Use
To clone and run this application, you'll need [Git](https://git-scm.com) and [Visual Studio Code] 

```bash
# Clone this repository
$ git clone https: url

# Go into the repository
$ cd repo-name

# Open project in vs
$ code .

# Run the project 
$ dart run
```

## Contributing
#### I would be happy to have your ideas to improving the project. Please feel free to do so.
```bash
# Fork the project

# Create your feature branch
$ git checkout -b branch-name

# Commit your changes
$ git commit -m 'Add some commit'

# Push to the branch
$ git push

# Open a Pull Request

```

## Output Screenshots



### Admin
- As you can see i started to welcome the user and asking him to enter if he is an admin or customer
  since he choose admin list of functions will be displayed
- **Display** the library information list of the library data will be displayed to the admin
  ![image](https://github.com/user-attachments/assets/9be553c2-6c48-48c5-a59f-75c4dc05aeb9)
  
- **Add new book** to the library since it's admin it will be availabel to add new book to the data set by filling the required information (such as name, author, etc..)
  ![image](https://github.com/user-attachments/assets/e2da6e79-4564-4594-b8f6-f6080f3500f7)
  

- **Remove** book from the library the admin will have the access to remove book from the library data set by choosing the book id and the data set will be updated
![image](https://github.com/user-attachments/assets/8fa049fc-d1d1-457a-b11f-f0460c2c8360)



- **View all receipt** when customers completes the purchase the admin can view the invoices in the system with detailed information (such as the customer’s name and order details).
- here we have two diffrent customers **najwa** with an id and **noor** with diffrent id and the processes they made
  ![image](https://github.com/user-attachments/assets/87370ca5-0ade-47eb-bdfe-b7d43173e344)

### Customer

- Again i started to welcome the user and asking him to enter if he is an admin or customer
  since he choose customer first i asked for the name to generate a uniqe id to prevent any conflect then a list of functions will be displayed
- **Display** the library information list of the library data will be displayed to the admin
![image](https://github.com/user-attachments/assets/ef583f21-a2e4-4c38-b4e1-ae032565947b)



- **Buy book** from the library
  - This function will allow the customer to buy from the library first a list ao the books will be displayed and then the user will select the book to buy
   1-if the user enterd a wrong id that dose not match any of the book a feedback message will displayed 
![image](https://github.com/user-attachments/assets/af6019b8-22e6-4a3b-8615-d3d794506a6b)


2-Once again the user chose another book but this time the book is out of stock so another message will apepars to inform the user
![image](https://github.com/user-attachments/assets/87336213-a336-457d-b90e-8f64e7031763)


3-Finally the user choose availabel book by entering the id later the purchase detail of this process will displayed to give feedback
![image](https://github.com/user-attachments/assets/e5a798db-a7dc-4052-ad8a-853cc6431e07)

- **View the receipt** after complete the purchase process can view the total amount in the view receipt function 
![image](https://github.com/user-attachments/assets/f09c53bd-ff2b-4364-9f89-7ee1b20c2c6d)


### check user input
Throughout the program's workflow any value entered by the user will be verified by using the **try,catch**, and a warning message will appear to the user to alert him.



Will you have reached the end of the project article.
Thank you for your reading ❤️
