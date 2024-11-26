create database Learning_System;
use Learning_System;

-- Create the Subscription Plans table
CREATE TABLE SubscriptionPlans (
    PlanID INT PRIMARY KEY,
    PlanName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2),
    MaxCourses INT,
    IsCertificationIncluded BIT,  -- Boolean value
    AccessType VARCHAR(50),
    MaxProfiles INT
);

-- Create the Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    SubscriptionPlanID INT,
    Fname VARCHAR(100),
    Lname VARCHAR(100),
    Email VARCHAR(255) UNIQUE,  -- Email length increased
    Password VARCHAR(100),
    DateJoined DATE,
    IsActive BIT DEFAULT 1,      -- Flag with default value
    FOREIGN KEY (SubscriptionPlanID) REFERENCES SubscriptionPlans(PlanID)
);

-- Create the Instructors table
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FullName VARCHAR(200),
    Email VARCHAR(255),          -- Email length increased
    Specialization VARCHAR(100)
);

-- Create the Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    InstructorID INT,
    CourseTitle VARCHAR(200),
    Description TEXT,
    Category VARCHAR(100),
    Duration INT,
    Certification BIT,           -- Boolean value
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

-- Create the Modules table
CREATE TABLE Modules (
    ModuleID INT PRIMARY KEY,
    CourseID INT,
    ModuleName VARCHAR(200),
    Description TEXT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Create the Quizzes table
CREATE TABLE Quizzes (
    QuizID INT PRIMARY KEY,
    ModuleID INT,
    QuizTitle VARCHAR(200),
    QuizContent TEXT,
    MaxScore INT,
    FOREIGN KEY (ModuleID) REFERENCES Modules(ModuleID)
);

-- Create the Assignments table
CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY,
    ModuleID INT,
    AssignmentTitle VARCHAR(200),
    Description TEXT,
    DueDate DATE,
    FOREIGN KEY (ModuleID) REFERENCES Modules(ModuleID)
);

-- Create the Lessons table
CREATE TABLE Lessons (
    LessonID INT PRIMARY KEY,
    ModuleID INT,
    LessonTitle VARCHAR(200),
    LessonType VARCHAR(50),
    FOREIGN KEY (ModuleID) REFERENCES Modules(ModuleID)
);

-- Create the Marketing Campaigns table
CREATE TABLE MarketingCampaigns (
    CampaignID INT PRIMARY KEY,
    CampaignName VARCHAR(200),
    StartDate DATE,
    EndDate DATE,
    DiscountPercentage DECIMAL(5, 2),
    TargetAudience VARCHAR(200),
    Details TEXT
);

-- Create the Payments table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    UserID INT,
    PlanID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    PaymentStatus VARCHAR(50),
    CampaignID INT NULL,         -- Allow NULL if no campaign is associated
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (PlanID) REFERENCES SubscriptionPlans(PlanID),
    FOREIGN KEY (CampaignID) REFERENCES MarketingCampaigns(CampaignID)
);

-- Create the Progress table
CREATE TABLE Progress (
    ProgressID INT PRIMARY KEY,
    ProfileID INT,
    CourseID INT,
    LessonID INT,
    Status VARCHAR(50),
    FOREIGN KEY (ProfileID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (LessonID) REFERENCES Lessons(LessonID)
);

-- Create the Certificates table
CREATE TABLE Certificates(
    CertificateID INT PRIMARY KEY,
    ProfileID INT,
    CourseID INT,
    DateIssued DATE,
    URL VARCHAR(255),
    FOREIGN KEY (ProfileID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Create the Evaluation Results table
CREATE TABLE EvaluationResults (
    EvaluationID INT PRIMARY KEY,
    ProfileID INT,
    LessonID INT,
    ObtainedScore DECIMAL(5, 2),
    MaxScore INT,
    SubmissionDate DATE,
    FOREIGN KEY (ProfileID) REFERENCES Users(UserID),
    FOREIGN KEY (LessonID) REFERENCES Lessons(LessonID)
);

-- Create the Support Tickets table
CREATE TABLE SupportTickets (
    TicketID INT PRIMARY KEY,
    UserID INT,
    IssueType VARCHAR(100),
    Status VARCHAR(50),
    Description TEXT,
    CreatedAt DATE,
    ResolvedAt DATE NULL,   
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
