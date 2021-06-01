# Tax Management System

### Description:
- There are 2 roles: User (Tax Payer) and Admin (Tax Inspector).
- User (Natural type or Legal type) must be authorised beforehand to submit their Tax Report to the Tax Office.
- User can edit Tax Reports
- Inspector may send a Report back to User for reconsideration if the Report is to be revised
- User may view all their Reports, sort them by Dates (Statement Period Date, Date of Report, Last Modified Date) 
and filter by Report statuses (pending, approved, regected).
- Report may be uploaded from the existing JSON file
- Inspector may approve or reject a Report indicating the reason of their decision in the Comment Section.
- Inspector reviews the submitted Reports from multiple Users
- Inspector filters the Reports by First or Last Name
- Inspector filters the Reports by Report type (Natural type or Legal type)

### Implementation:
- Front-End: Thymeleaf, Bootstrap, HTML, CSS, JavaScript
- Back-end: Java 8, SQL

### Tech:
- Spring Boot
- Spring Security
- MySQL
- Maven

### How To Install the App:
- Clone ```https://github.com/vadym-gonchar/tax-management-system.git```
- Install MySQL
- In your MySQLWorkbench create database ```tax_management```
- Insert the initial data to the tables using ```V01_02__final.sql```
ANY password is: ```123qwe```
- In ```application.properties``` use your OWN username and password
- Run the server and go to ```http://localhost:8080```

### View:
![1](https://user-images.githubusercontent.com/61626216/120349750-0c17b600-c307-11eb-8331-e6af0ba9773c.png)
![2](https://user-images.githubusercontent.com/61626216/120349843-1c2f9580-c307-11eb-9d80-d196de185058.png)
![3](https://user-images.githubusercontent.com/61626216/120349881-25206700-c307-11eb-9049-92c7e60ce9a0.png)
![4](https://user-images.githubusercontent.com/61626216/120350005-42edcc00-c307-11eb-87d4-5ff9955b05db.png)
![5](https://user-images.githubusercontent.com/61626216/120350045-4da86100-c307-11eb-81c9-6a59081d6fd2.png)
![6](https://user-images.githubusercontent.com/61626216/120350095-5731c900-c307-11eb-93b3-247e146ca946.png)
![7](https://user-images.githubusercontent.com/61626216/120350145-6153c780-c307-11eb-853b-0536a19e79ff.png)
![8](https://user-images.githubusercontent.com/61626216/120350190-703a7a00-c307-11eb-9d20-3fbab58c895f.png)
![9](https://user-images.githubusercontent.com/61626216/120350235-7892b500-c307-11eb-8415-37390ae7a5e2.png)
![10](https://user-images.githubusercontent.com/61626216/120350259-7fb9c300-c307-11eb-9a95-100eee7b73e1.png)
