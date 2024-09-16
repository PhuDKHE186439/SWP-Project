USE TrainProject; 

CREATE TABLE `Role`(
RoleID INT PRIMARY KEY,
RoleName NVARCHAR(255)
);

CREATE TABLE Seat (
    SeatID INT PRIMARY KEY,
    CompartmentID INT,
    SeatNumber NVARCHAR(255),
    SeatType NVARCHAR(255),
    AvailabilityStatus BOOLEAN,
    FOREIGN KEY (CompartmentID) REFERENCES Compartment(CompartmentID)
);
 
CREATE TABLE Compartment (
    CompartmentID INT PRIMARY KEY,
    CompartmentNumber INT,
    CompartmentType NVARCHAR(255),
    TrainID INT,
    FOREIGN KEY (TrainID) REFERENCES Train(TrainID)
);

CREATE TABLE Train (
    TrainID INT PRIMARY KEY,
    TrainScheduleTime DATE,
    TrainName NVARCHAR(255),
    NumberOfSeat NVARCHAR(255),
    CompartmentID INT,
    SeatID INT,
    StartLocationID INT,
    ArrivalLocationID INT,
    FOREIGN KEY (StartLocationID) REFERENCES Location(LocationID),
    FOREIGN KEY (ArrivalLocationID) REFERENCES Location(LocationID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    TicketID INT,
    PassengerID INT,
    PaymentMethod ENUM('Bank', 'Digital Wallet'),
    PaymentDate DATE,
    Amount DOUBLE,
    FOREIGN KEY (TicketID) REFERENCES Ticket(TicketID),
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID)
);

CREATE TABLE Ticket (
    TicketID INT PRIMARY KEY,
    PassengerID INT,
    TicketClassID INT,
    PurchaseDate DATE,
    TicketPrice DOUBLE,
    CompartmentID INT,
    SeatID INT,
    CompartmentNumber INT,
    TimeArrive DATE,
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID),
    FOREIGN KEY (TicketClassID) REFERENCES TicketClass(TicketClassID),
    FOREIGN KEY (CompartmentID) REFERENCES Compartment(CompartmentID),
    FOREIGN KEY (SeatID) REFERENCES Seat(SeatID)
);

CREATE TABLE TicketClass (
    TicketClassID INT PRIMARY KEY,
    CategoryName NVARCHAR(255)
);

CREATE TABLE Account (
    AccountID INT PRIMARY KEY,
    PhoneNumber NVARCHAR(255),
    Username NVARCHAR(255),
    `Password` NVARCHAR(255),
    Email NVARCHAR(255),
    RoleID INT,
   FOREIGN KEY (RoleID) REFERENCES Role(RoleID)
);

CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    Message TEXT,
    PassengerID INT,
    SubmissionDate DATE,
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID)
);

CREATE TABLE Passenger (  
    PassengerID INT AUTO_INCREMENT PRIMARY KEY,  
    Name VARCHAR(255),  
    Password VARCHAR(255),  
    Email VARCHAR(255),  
    Age INT,  
    Address VARCHAR(255),  
    PhoneNumber VARCHAR(255)  
);

-- Insert data into Passenger
INSERT INTO Passenger (PassengerID, Name, Password, Email, Age, Address, PhoneNumber) VALUES
(1, 'Himmel', 'Frieren123', 'himmel@gmail.com', 28, 'British', '555-1234-4321'),
(2, 'John Smith', 'moviestar', 'johnsmith@gmail.com', 34, 'America', '555-5678-4321'),
(3, 'Rin Tohsaka', 'holygrail', 'emiya@gmail.com', 22, ' Japan', '555-9876-4321'),
(4, 'Dang Khac Phu', 'phudk123', 'Phudk@gmail.com', 26, 'Viet Nam', '555-6543-4321');

-- Insert data into Role
INSERT INTO Role (RoleID, RoleName) VALUES
(1,'Admin'),
(2,'TicketManager'),
(3,'Passenger');

-- Insert data into Account
INSERT INTO Account (AccountID, PhoneNumber, Username, Password, Email, RoleID) VALUES
(1, '555-1234', 'johnd', 'password123', 'himmel@gmail.com',3),
(2, '555-5678', 'janes', 'janeSecure', 'johnsmith@gmail.com',3),
(3, '555-9876', 'robj', 'robJ2023', 'emiya@gmail.com',3),
(4, '555-6543', 'emilyd', 'emilyPass456', 'Phudk@gmail.com',3),

(5, '096-258-2004','admin1', 'admin1', 'DungPVHE180060@gmail.com',1 ),
(6, '555-3344-6352','admin2', 'admin2', 'admin2@system.com',1 ),

(7, '555-6543', 'Mana', 'ManagerTicket', 'Manager@gmail.com',2);

-- Insert data into Train
INSERT INTO Train (TrainID, TrainScheduleTime, TrainName, NumberOfSeat, StartLocationID, ArrivalLocationID) VALUES
(1, '2024-09-17 08:00:00', 'Express 101', 100, 1, 2),
(2, '2024-09-17 10:30:00', 'Local 202', 120, 2, 3),
(3, '2024-09-18 07:00:00', 'Regional 303', 150, 1, 4);

-- Insert data into Location
INSERT INTO Location (LocationID, LocationName, Description) VALUES
(1, 'Ha Noi', 'Main station in Ha Noi'),
(2, 'Hai Phong', 'Main station in Hai Phong'),
(3, 'Da Nang', 'Main station in Da Nang'),
(4, 'Ho Chi Minh', 'Main station in Ho Chi Minh');

-- Insert data into Compartment
INSERT INTO Compartment (CompartmentID, CompartmentNumber, TrainID) VALUES
(1, 101, 1),
(2, 102, 2);

-- Insert data into Seat
INSERT INTO Seat (SeatID, SeatNumber, SeatType, AvailabilityStatus, CompartmentID) VALUES
(1, '1A', 'First Class', TRUE, 1),
(2, '2B', 'Economy', TRUE, 2);

-- Insert data into TicketClass
INSERT INTO TicketClass (TicketClassID, CategoryName) VALUES
(1, 'First Class'),
(2, 'Business Class');

-- Insert data into Ticket
INSERT INTO Ticket (TicketID, PassengerID, SeatID, TicketClassID, PurchaseDate, TicketPrice, CompartmentID, TimeArrive) VALUES
(1, 1, 1, 1, '2024-09-01', 150.00, 1, '2024-09-17 08:45:00'),
(2, 2, 2, 2, '2024-09-01', 50.00, 2, '2024-09-17 11:00:00');

-- Insert data into Payment
INSERT INTO Payment (PaymentID, TicketID, PassengerID, PaymentMethod, PaymentDate, Amount) VALUES
(1, 1, 1, 'Bank', '2024-09-01', 150.00),
(2, 2, 2, 'Digital Wallet', '2024-09-01', 50.00);

-- Insert data into Feedback
INSERT INTO Feedback (FeedbackID, Message, PassengerID, SubmissionDate) VALUES
(1, 'Great service, smooth ride.', 1, '2024-09-17 08:45:00'),
(2, 'The seat was uncomfortable.', 2, '2024-09-18 11:00:00');


