CREATE DATABASE Learning_System_datawarehouse;
USE Learning_System_datawarehouse;

-- Dimension Tables
CREATE TABLE dimUsers (
    UserID INT PRIMARY KEY,
    SubscriptionPlanID INT,
    Fname VARCHAR(100),
    Lname VARCHAR(100),
    Email VARCHAR(255) UNIQUE,  
    Password VARCHAR(100),
    DateJoined DATE,
    IsActive BIT DEFAULT 1
);

CREATE TABLE DimCourse (
    CourseID INT PRIMARY KEY,
    InstructorID INT,
    CourseTitle VARCHAR(200),
    Description TEXT,
    Category VARCHAR(100),
    Duration INT,
    Certification BIT
);

CREATE TABLE DimModule (
    ModuleID INT PRIMARY KEY,
    CourseID INT,
    ModuleName VARCHAR(200),
    Description TEXT
);

CREATE TABLE DimLesson (
    LessonID INT PRIMARY KEY,
    ModuleID INT,
    LessonTitle VARCHAR(200),
    LessonType VARCHAR(50)
);

CREATE TABLE DimQuiz (
    QuizID INT PRIMARY KEY,
    ModuleID INT,
    QuizTitle VARCHAR(200),
    QuizContent TEXT,
    MaxScore INT
);

CREATE TABLE DimAssignments (
    AssignmentID INT PRIMARY KEY,
    ModuleID INT,
    AssignmentTitle VARCHAR(200),
    Description TEXT,
    DueDate DATE
);

CREATE TABLE DimEvaluateResult (
    EvaluationID INT PRIMARY KEY,
    ProfileID INT,
    ObtainedScore DECIMAL(5, 2),
    MaxScore INT,
    SubmissionDate DATE
);

-- Fact Table
CREATE TABLE FactUserProgress (
    FactID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    CourseID INT NOT NULL,
    ModuleID INT NOT NULL,
    LessonID INT NOT NULL,
    QuizID INT,
    AssignmentID INT,
    ProgressStatus VARCHAR(50),
    EvaluationScore DECIMAL(5, 2),
    CertificateIssued BIT,
    EvaluationID INT,
    CreatedAt DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (UserID) REFERENCES dimUsers(UserID),
    FOREIGN KEY (CourseID) REFERENCES DimCourse(CourseID),
    FOREIGN KEY (ModuleID) REFERENCES DimModule(ModuleID),
    FOREIGN KEY (LessonID) REFERENCES DimLesson(LessonID),
    FOREIGN KEY (QuizID) REFERENCES DimQuiz(QuizID),
    FOREIGN KEY (AssignmentID) REFERENCES DimAssignments(AssignmentID)
);



ALTER TABLE FactUserProgress
ADD CONSTRAINT FK_FactUserProgress_EvaluationID
FOREIGN KEY (EvaluationID) REFERENCES DimEvaluateResult(EvaluationID);
