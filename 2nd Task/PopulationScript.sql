USE Learning_System;

INSERT INTO Learning_System_datawarehouse.dbo.dimUsers (UserID, SubscriptionPlanID, Fname, Lname, Email, Password, DateJoined, IsActive)
SELECT UserID, SubscriptionPlanID, Fname, Lname, Email, Password, DateJoined, IsActive
FROM Users;

INSERT INTO Learning_System_datawarehouse.dbo.DimCourse (CourseID, InstructorID, CourseTitle, Description, Category, Duration, Certification)
SELECT CourseID, InstructorID, CourseTitle, Description, Category, Duration, Certification
FROM Courses;


INSERT INTO Learning_System_datawarehouse.dbo.DimModule (ModuleID, CourseID, ModuleName, Description)
SELECT ModuleID, CourseID, ModuleName, Description
FROM Modules;


INSERT INTO Learning_System_datawarehouse.dbo.DimLesson (LessonID, ModuleID, LessonTitle, LessonType)
SELECT LessonID, ModuleID, LessonTitle, LessonType
FROM Lessons;


INSERT INTO Learning_System_datawarehouse.dbo.DimQuiz (QuizID, ModuleID, QuizTitle, QuizContent, MaxScore)
SELECT QuizID, ModuleID, QuizTitle, QuizContent, MaxScore
FROM Quizzes;


INSERT INTO Learning_System_datawarehouse.dbo.DimAssignments (AssignmentID, ModuleID, AssignmentTitle, Description, DueDate)
SELECT AssignmentID, ModuleID, AssignmentTitle, Description, DueDate
FROM Assignments;

INSERT INTO Learning_System_datawarehouse.dbo.DimEvaluateResult (EvaluationID, ProfileID, ObtainedScore, MaxScore, SubmissionDate)
SELECT EvaluationID, ProfileID, ObtainedScore, MaxScore, SubmissionDate
FROM EvaluationResults;


USE Learning_System_datawarehouse;

INSERT INTO FactUserProgress (UserID, CourseID, ModuleID, LessonID, QuizID, AssignmentID, ProgressStatus, EvaluationScore, CertificateIssued, EvaluationID)
SELECT 
    u.UserID, 
    c.CourseID,
    m.ModuleID, 
    l.LessonID, 
    q.QuizID, 
    a.AssignmentID, 
	p.Status,
	e.ObtainedScore,
    CASE 
        -- Add logic for CertificateIssued (if score > a threshold)
        WHEN e.ObtainedScore >= e.MaxScore * 0.7 THEN 1 -- Issue certificate if score is >= 70% of max score
        ELSE 0
    END AS CertificateIssued,
    e.EvaluationID 
FROM 
    Learning_System.dbo.Users u
    JOIN Learning_System.dbo.Courses c ON u.UserID = c.InstructorID 
    JOIN Learning_System.dbo.Modules m ON c.CourseID = m.CourseID
    JOIN Learning_System.dbo.Lessons l ON m.ModuleID = l.ModuleID
    LEFT JOIN Learning_System.dbo.Quizzes q ON m.ModuleID = q.ModuleID
    LEFT JOIN Learning_System.dbo.Assignments a ON m.ModuleID = a.ModuleID
    LEFT JOIN Learning_System.dbo.EvaluationResults e ON u.UserID = e.ProfileID
	LEFT JOIN Learning_System.dbo.Progress p ON p.CourseID = c.CourseID;


	select * from FactUserProgress;