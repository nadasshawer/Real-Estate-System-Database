--DATABASE
CREATE DATABASE ParhelionRealEstateDatabase

--CUSTOMERS TABLE
CREATE TABLE Customers (
    Cust_ID VARCHAR(10),
    First_Name VARCHAR(100),
    Last_Name VARCHAR(100),
    Is_Eligible TINYINT,
    Cu_State VARCHAR(100),
    City VARCHAR(100),
    Street VARCHAR(100),
    Zip_Code VARCHAR(10),
    Cust_Type VARCHAR(100)

	--keys
    PRIMARY KEY (Cust_ID)
);

--CUSTOMER PHONE NUMBER ATTRIBUTE
CREATE TABLE Cust_Phone_Num(
	Cust_ID_1 VARCHAR(10),
	Cust_Phone_Num VARCHAR(15)

	--keys
	FOREIGN KEY (Cust_ID_1) REFERENCES Customers(Cust_ID)
);

--CUSTOMER EMAIL ATTRIBUTE
CREATE TABLE Cust_Email(
	Cust_ID_2 VARCHAR(10),
	Cust_Email VARCHAR(100)

	--keys
	FOREIGN KEY (Cust_ID_2) REFERENCES Customers(Cust_ID)
);

--CUSTOMER ADDRESS ATTRIBUTE 
CREATE TABLE Cust_Address(
	Cust_ID_3 VARCHAR(10),
	Cust_Address VARCHAR(100)

	--keys
	FOREIGN KEY (Cust_ID_3) REFERENCES Customers(Cust_ID)
);

--CONTRACT HISTORY TABLE
CREATE TABLE Contract_History(
	Contract_ID VARCHAR(10),
	Cust_ID_4 VARCHAR(10),
	Co_Start_Date DATE,
	Co_End_Date Date,
	Summary VARCHAR(200),
	Co_Type VARCHAR(100),
	Details VARCHAR(500)

	--keys
	PRIMARY KEY(Contract_ID),
	FOREIGN KEY (Cust_ID_4) REFERENCES Customers(Cust_ID)
);

--COMPLAINTS TABLE
CREATE TABLE Complaints(
	Complaint_ID VARCHAR(10),
	Co_Descrip VARCHAR(200),
	Co_Status VARCHAR(100),
	Resol_Date DATE,
	Request_Date DATE,
	Cost DECIMAL(10,2)

	--keys
	PRIMARY KEY(Complaint_ID)
);

--CUSTOMER FILES COMPLAINT RELATION
CREATE TABLE Cust_Files_Comp(
	Cust_ID_5 VARCHAR(10),
	Comp_ID VARCHAR(10),
	Cu_First_Name VARCHAR(100),
    Cu_Last_Name VARCHAR(100),
    Cu_Is_Eligible TINYINT,
    Cu_State VARCHAR(100),
    Cu_City VARCHAR(100),
    Cu_Street VARCHAR(100),
    Cu_Zip_Code VARCHAR(10),
    Cu_Type VARCHAR(100),
	Co_Descrip VARCHAR(200),
	Co_Status VARCHAR(100),
	Co_Resol_Date DATE,
	Co_Request_Date DATE,
	Co_Cost DECIMAL(10,2)

	--keys
	FOREIGN KEY(Cust_ID_5) REFERENCES Customers(Cust_ID),
	FOREIGN KEY(Comp_ID) REFERENCES Complaints(Complaint_ID)
);

--APPOINTMENTS TABLE
CREATE TABLE Appointments(
	Appoint_ID VARCHAR(10),
	Cust_ID_7 VARCHAR(10),
	Purpose VARCHAR(100),
	App_Status VARCHAR(100),
	App_Date DATE,
	App_Time TIME

	--keys
	PRIMARY KEY(Appoint_ID),
	FOREIGN KEY (Cust_ID_7) REFERENCES Customers(Cust_ID)
);

--SALES STAFF TABLE
CREATE TABLE Sales_Staff(
	SS_ID VARCHAR(10),
	First_Name VARCHAR(100),
    Last_Name VARCHAR(100),
	Position VARCHAR(100),
	Hire_Date DATE,
	Commission_Rate DECIMAL(3,2),
	Sales_Target VARCHAR(100),
	Salary DECIMAL(7,2),
	Perfomance_Rating DECIMAL(2,2),
	Assigned_Projects VARCHAR(500)

	--keys
	PRIMARY KEY(SS_ID)
);

--SALES STAFF PHONE NUMBER ATTRIBUTE
CREATE TABLE SS_Phone_Num(
	SS_ID_1 VARCHAR(10),
	SS_Phone_Num VARCHAR(15)

	--keys
	FOREIGN KEY(SS_ID_1) REFERENCES Sales_Staff(SS_ID)
);

--SALES STAFF EMAIL ATTRIBUTE
CREATE TABLE SS_Email(
	SS_ID_2 VARCHAR(10),
	SS_Email VARCHAR(100)

	--keys
	FOREIGN KEY(SS_ID_2) REFERENCES Sales_Staff(SS_ID)
);

--SALES STAFF HANDLES APPOINTMENTS RELATION
CREATE TABLE SS_Handles_Appoints(
	SS_ID_4 VARCHAR(10),
	Appoint_ID VARCHAR(10),
	SS_First_Name VARCHAR(100),
    SS_Last_Name VARCHAR(100),
	SS_Position VARCHAR(100),
	SS_Hire_Date DATE,
	SS_Commission_Rate DECIMAL(3,2),
	SS_Sales_Target VARCHAR(100),
	SS_Salary DECIMAL(7,2),
	SS_Perfomance_Rating DECIMAL(2,2),
	SS_Assigned_Projects VARCHAR(500),
	A_Purpose VARCHAR(100),
	A_Status VARCHAR(100),
	A_Date DATE,
	A_Time TIME

	--keys
	FOREIGN KEY(SS_ID_4) REFERENCES Sales_Staff(SS_ID),
	FOREIGN KEY(Appoint_ID) REFERENCES Appointments(Appoint_ID)
);

--PROJECTS TABLE
CREATE TABLE Projects(
	Project_ID VARCHAR(10),
	Proj_Name VARCHAR(10),
	Proj_State VARCHAR(100),
    City VARCHAR(100),
    Street VARCHAR(100),
	Zip_Code VARCHAR(10),
	Budget DECIMAL(10,2),
	Lead_Name VARCHAR(100),
	Proj_Status VARCHAR(100),
	Proj_Start_Date DATE,
	Proj_Comp_Date DATE

	--keys
	PRIMARY KEY(Project_ID)
);

--MAINTENANCE REQUEST TABLE
CREATE TABLE Maint_Request(
	Request_ID VARCHAR(10),
	Descrip VARCHAR(200),
	Req_Status VARCHAR(100),
	Req_Date DATE,
	Resol_Date DATE,
	Cost DECIMAL(10,2)

	--keys
	PRIMARY KEY(Request_ID)
);

--BUILDINGS TABLE
CREATE TABLE Buildings(
	Build_ID VARCHAR(10),
	Proj_ID VARCHAR(10),
	Build_Name VARCHAR(100),
	Build_Status VARCHAR(100),
	Total_Area DECIMAL(10,2),
	Build_Type VARCHAR(100),
	Num_Of_Floors INT,
	Total_Units INT

	--keys
	PRIMARY KEY (Build_ID),
	FOREIGN KEY (Proj_ID) REFERENCES Projects(Project_ID)
);

--UNITS TABLE
CREATE TABLE Units(
	Unit_ID VARCHAR(10),
	Build_ID_1 VARCHAR(10),
	Unit_Num INT UNIQUE,
	Num_Of_Bathrooms INT,
	Num_Of_Rooms INT,
	Price DECIMAL(10,2),
	Floor_Num INT,
	Unit_Status VARCHAR(100),
	Area DECIMAL(10,2),
	Has_Balcony TINYINT,
	Unit_Type VARCHAR(100),
	Ownership_Type VARCHAR(100),
	Furniture_Status TINYINT

	--keys
	PRIMARY KEY (Unit_ID)
	FOREIGN KEY (Build_ID_1) REFERENCES Buildings(Build_ID)
);

--MAINTENANCE REQUEST ASSOCIATED WITH BUILDING RELATION
CREATE TABLE Maint_Req_Build(
	Req_ID VARCHAR(10),
	Build_ID_1 VARCHAR(10),
	MR_Descrip VARCHAR(200),
	MR_Status VARCHAR(100),
	MR_Request_Date DATE,
	MR_Resol_Date DATE,
	MR_Cost DECIMAL(10,2),
	B_Name VARCHAR(100),
	B_Status VARCHAR(100),
	B_Total_Area DECIMAL(10,2),
	B_Type VARCHAR(100),
	B_Num_Of_Floors INT,
	B_Total_Units INT

	--keys
	FOREIGN KEY (Req_ID) REFERENCES Maint_Request(Request_ID),
	FOREIGN KEY (Build_ID_1) REFERENCES Buildings(Build_ID)
);

--PROPERTY MANAGEMENT TABLE
CREATE TABLE Property_Manag(
	PM_ID VARCHAR(10),
	Cost DECIMAL(10,2),
	PM_Start_Date DATE,
	PM_End_Date DATE,
	Service_Type VARCHAR(100)

	--keys
	PRIMARY KEY(PM_ID)
);

--SALES STAFF PERFORM PROPERTY MANAGEMENT
CREATE TABLE SS_Perform_PM(
	SS_ID_5 VARCHAR(10),
	PM_ID_1 VARCHAR(10),
	SS_First_Name VARCHAR(100),
    SS_Last_Name VARCHAR(100),
	SS_Position VARCHAR(100),
	SS_Hire_Date DATE,
	SS_Commission_Rate DECIMAL(3,2),
	SS_Sales_Target VARCHAR(100),
	SS_Salary DECIMAL(7,2),
	SS_Perfomance_Rating DECIMAL(2,2),
	SS_Assigned_Projects VARCHAR(500),
	PM_Cost DECIMAL(10,2),
	PM_Start_Date DATE,
	PM_End_Date DATE,
	PM_Service_Type VARCHAR(100),
	Num_Of_SS INT

	--keys
	FOREIGN KEY (SS_ID_5) REFERENCES Sales_Staff(SS_ID),
	FOREIGN KEY (PM_ID_1) REFERENCES Property_Manag(PM_ID)
);

--TRANSACTIONS TABLE
CREATE TABLE Transactions(
	Trans_ID VARCHAR(10),
	Uni_ID_2 VARCHAR(10),
	Cust_ID_8 VARCHAR(10),
	Trans_Type VARCHAR(100),
	Trans_Date DATE,
	Trans_Status VARCHAR(100),
	Amount DECIMAL(10,2),
	Pay_Method VArchar(100)

	--keys 
	PRIMARY KEY(Trans_ID),
	FOREIGN KEY (Uni_ID_2) REFERENCES Units(Unit_ID),
	FOREIGN KEY (Cust_ID_8) REFERENCES Customers(Cust_ID),
);

--SALES STAFF HANDLES TRANSACTION RELATION
CREATE TABLE SS_Handle_Trans(
	SS_ID_3 VARCHAR(10),
	Trans_ID_1 VARCHAR(10),
	SS_First_Name VARCHAR(100),
    SS_Last_Name VARCHAR(100),
	SS_Position VARCHAR(100),
	SS_Hire_Date DATE,
	SS_Commission_Rate DECIMAL(3,2),
	SS_Sales_Target VARCHAR(100),
	SS_Salary DECIMAL(7,2),
	SS_Perfomance_Rating DECIMAL(2,2),
	SS_Assigned_Projects VARCHAR(500),
	T_Type VARCHAR(100),
	T_Date DATE,
	T_Status VARCHAR(100),
	T_Amount DECIMAL(10,2),
	T_Pay_Method VARCHAR(100),

	--keys
	FOREIGN KEY (SS_ID_3) REFERENCES Sales_Staff(SS_ID),
	FOREIGN KEY (Trans_ID_1) REFERENCES Transactions(Trans_ID),
);

--PAYMENT TABLE
CREATE TABLE Payment(
	Payment_ID VARCHAR(10),
	Pay_Date DATE,
	Pay_Status VARCHAR(100),
	Amount DECIMAL(10,2),
	Pay_Method VARCHAR(100),
	Receipt_Num INT,
	Sales_Target VARCHAR(100)

	--keys
	PRIMARY KEY(Payment_ID)
);

--TRANSACTION INVOLVES PAYMENT RELATION
CREATE TABLE Trans_Involve_Pay(
	Trans_ID_2 VARCHAR(10),
	Pay_ID VARCHAR(10),
	T_Type VARCHAR(100),
	T_Date DATE,
	T_Status VARCHAR(100),
	T_Amount DECIMAL(10,2),
	T_Pay_Method VARCHAR(100),
	P_Date DATE,
	P_Status VARCHAR(100),
	P_Amount DECIMAL(10,2),
	P_Method VARCHAR(100),
	P_Receipt_Num INT,
	P_Sales_Target VARCHAR(100)

	--keys
	FOREIGN KEY (Trans_ID_2) REFERENCES Transactions(Trans_ID),
	FOREIGN KEY (Pay_ID) REFERENCES Payment(Payment_ID),
);

--COMMISSION STRUCTURE TABLE
CREATE TABLE Comm_Struct(
	Comm_ID VARCHAR(10),
	SS_ID_4 VARCHAR(10),
	Amount DECIMAL(10,2),
	Rate DECIMAL(3,2),
	Pay_Status VARCHAR(100)

	--keys
	PRIMARY KEY(Comm_ID),
	FOREIGN KEY(SS_ID_4) REFERENCES Sales_Staff(SS_ID)
);

--ANALYTICS TABLE
CREATE TABLE Analytics(
	Analysis_ID VARCHAR(10),
	Analy_Value DECIMAL(10,2),
	Gen_Date DATE,
	Metric_Type VARCHAR(100)

	--keys
	PRIMARY KEY(Analysis_ID)
);

--REPORTS TABLE
CREATE TABLE Reports(
	Report_ID VARCHAR(10),
	Rep_Format VARCHAR(100),
	Descrip VARCHAR(200),
	Rep_Type VARCHAR(100),
	Title VARCHAR(100),
	Issue_Date DATE,
	Author VARCHAR(100),

	--keys
	PRIMARY KEY(Report_ID)
);

--ANALYTICS GENERATE REPORTS RELATION
CREATE TABLE Analy_Gener_Rep(
	Analy_ID_1 VARCHAR(10),
	Rep_ID VARCHAR(10),
	A_Value DECIMAL(10,2),
	A_Gen_Date DATE,
	A_Metric_Type VARCHAR(100),
	R_Format VARCHAR(100),
	R_Descrip VARCHAR(200),
	R_Type VARCHAR(100),
	R_Title VARCHAR(100),
	R_Issue_Date DATE,
	R_Author VARCHAR(100),

	--keys
	FOREIGN KEY(Analy_ID_1) REFERENCES Analytics(Analysis_ID),
	Foreign KEY(Rep_ID) REFERENCES Reports(Report_ID)
);

--MARKETING CAMPAIGNS TABLE
CREATE TABLE Marketing_Camps(
	MC_ID VARCHAR(10),
	MC_Platform VARCHAR(100),
	Target_Audience VARCHAR(100),
	MC_Start_Date DATE,
	MC_End_Date DATE,
	Budget DECIMAL(10,2),
	MC_Status VARCHAR(100)

	--keys
	PRIMARY KEY(MC_ID)
);

--MARKTING CAMPAIGN LEAD ATTRIBUTE
CREATE TABLE MC_Lead(
	MC_ID_1 VARCHAR(10),
	Lead_Name VARCHAR(100)

	--keys
	FOREIGN KEY(MC_ID_1) REFERENCES Marketing_Camps(MC_ID)
);

--MARKETING CAMPAIGNS TRACK ANALYTICS
CREATE TABLE MC_Track_Analy(
	MC_ID_2 VARCHAR(10),
	Analy_ID_2 VARCHAR(10),
	MC_Platform VARCHAR(100),
	MC_Target_Audience VARCHAR(100),
	MC_Start_Date DATE,
	MC_End_Date DATE,
	MC_Budget DECIMAL(10,2),
	MC_Status VARCHAR(100),
	A_Value DECIMAL(10,2),
	A_Generat_Date DATE,
	A_Metric_Type VARCHAR(100),

	--keys
	FOREIGN KEY(Analy_ID_2) REFERENCES Analytics(Analysis_ID),
	FOREIGN KEY(MC_ID_2) REFERENCES Marketing_Camps(MC_ID)
);
