-- Command to create database
-- sqlite3 testing.db < createDatabase.sql

-- Create Customer table
create table "Customer" (
	"CustomerId" integer not null primary key autoincrement,
	"FirstName" string not null,
	"LastName" string not null,
	"Status" string not null default "Active",
	"AccountCreationDate" string not null,
	"LastActivityDate" string not null
);

-- Create Payment Type table
create table "PaymentType" (
	"PaymentId" integer not null primary key autoincrement,
	"TypeName" string not null,
	"AccountNumber" string not null,
	"Status" string not null default "Active",
	"AccountCreationDate" string not null,
	"CustomerId" integer not null,
	foreign key ("CustomerId")
	References "Customer" ("CustomerId")
	On delete cascade
);

-- Create Product Type table
create table "ProductType" (
	"ProductTypeId" integer not null primary key autoincrement,
	"Category" string not null
);

-- Create Product table
create table "Product" (
	"ProductId" integer not null primary key autoincrement,
	"Price" string not null,
	"Title" string not null,
	"Description" string not null,
	"ProductTypeId" integer not null,
	"AddedById" integer not null,
	foreign key ("ProductTypeId")
	References "ProductType" ("ProductTypeId")
	foreign key ("AddedById")
	References "Customer" ("CustomerId")
	On delete cascade
);

-- Create Order table
create table "Order" (
	"OrderId" integer not null primary key autoincrement,
	"PaymentTypeId" integer not null,
	"CustomerId" integer not null,
	foreign key ("PaymentTypeId")
	References "PaymentType" ("PaymentTypeId")
	foreign key ("CustomerId")
	References "Customer" ("CustomerId")
	On delete cascade
);

-- Create OrderItem table
create table "OrderItem" (
	"OrderItemId" integer not null primary key autoincrement,
	"ProductId" integer not null,
	"OrderId" integer not null,
	foreign key ("ProductId")
	References "Product" ("ProductId")
	foreign key ("OrderId")
	References "Order" ("OrderId")
	On delete cascade
);

-- Create Employee table
create table "Employee" (
	"EmployeeId" integer not null primary key autoincrement,
	"DepartmentId" integer not null,
	"EmployeeTypeId" integer not null,
	foreign key ("DepartmentId")
	References "Department" ("DepartmentId")
	foreign key ("EmployeeTypeId")
	References "EmployeeType" ("EmployeeTypeId")
	On delete cascade
);

-- Create Department table
create table "Department" (
	"DepartmentId" integer not null primary key autoincrement,
	"EmployeeId" integer not null,
	"Budget" string not null,
	foreign key ("EmployeeId")
	References "Employee" ("EmployeeId")
	On delete cascade
);

-- Create Employee Type table
create table "EmployeeType" (
	"EmployeeTypeId" integer not null primary key autoincrement,
	"TypeName" string not null
);

-- Create Computer table
create table "Computer" (
	"ComputerId" integer not null primary key autoincrement,
	"AssigneeId" integer not null,
	"PurchaseDate" string not null,
	"DecommissionedDate" string not null default "In Use"
);

-- Create Training Enrollment table
create table "TrainingEnrollment" (
	"TrainingEnrollmentId" integer not null primary key autoincrement,
	"EmployeeId" integer not null,
	"TrainingCourseId" integer not null,
	foreign key ("EmployeeId")
	References "Employee" ("EmployeeId")
	foreign key ("TrainingCourseId")
	References "TrainingCourse" ("TrainingCourseId")
	On delete cascade
);

-- Create Training Course table
create table "TrainingCourse" (
	"TrainingCourseId" integer not null primary key autoincrement,
	"ProgramName" string not null,
	"StartDate" string not null,
	"EndDate" string not null,
	"MaxEnrollment" string not null,
	"CurrentEnrollment" string not null
);