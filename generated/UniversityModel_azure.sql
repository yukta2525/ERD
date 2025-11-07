-- Full rebuild: drop all FK constraints, then tables, then recreate schema.

-- 1. Drop all foreign key constraints (dynamic)
DECLARE @fksql NVARCHAR(MAX) = N'';
SELECT @fksql += N'ALTER TABLE [' + s.name + '].[' + t.name + '] DROP CONSTRAINT [' + fk.name + '];' + CHAR(10)
FROM sys.foreign_keys fk
JOIN sys.tables t      ON fk.parent_object_id = t.object_id
JOIN sys.schemas s     ON t.schema_id = s.schema_id;
IF (@fksql <> '') EXEC sys.sp_executesql @fksql;

-- 2. Drop tables if they exist (child -> parent)
IF OBJECT_ID('Enrollment','U')           IS NOT NULL DROP TABLE Enrollment;
IF OBJECT_ID('Course','U')               IS NOT NULL DROP TABLE Course;
IF OBJECT_ID('Instructor','U')           IS NOT NULL DROP TABLE Instructor;
IF OBJECT_ID('Student','U')              IS NOT NULL DROP TABLE Student;
IF OBJECT_ID('Department','U')           IS NOT NULL DROP TABLE Department;

PRINT 'All tables dropped successfully.';

-- 3. Recreate tables (surrogate IDs where appropriate)

CREATE TABLE Department (
    department_id VARCHAR(10) NOT NULL,
    name          VARCHAR(100) NOT NULL,
    location      VARCHAR(100) NOT NULL,
    PRIMARY KEY (department_id),
    CONSTRAINT UQ_Department_Name UNIQUE (name)
);

CREATE TABLE Instructor (
    instructor_id BIGINT IDENTITY(1,1) NOT NULL,
    name          VARCHAR(100) NOT NULL,
    email         VARCHAR(100) NOT NULL,
    department_id VARCHAR(10) NOT NULL,
    created_at    DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    updated_at    DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    PRIMARY KEY (instructor_id),
    CONSTRAINT UQ_Instructor_Email UNIQUE (email)
);

CREATE TABLE Student (
    student_id BIGINT IDENTITY(1,1) NOT NULL,
    name       VARCHAR(100) NOT NULL,
    email      VARCHAR(100) NOT NULL,
    major      VARCHAR(50)  NOT NULL,
    year       INT NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    updated_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    PRIMARY KEY (student_id),
    CONSTRAINT UQ_Student_Email UNIQUE (email)
);

CREATE TABLE Course (
    course_id     VARCHAR(10) NOT NULL,
    title         VARCHAR(200) NOT NULL,
    credits       INT NOT NULL,
    department_id VARCHAR(10) NOT NULL,
    instructor_id BIGINT NOT NULL,
    created_at    DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    updated_at    DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    PRIMARY KEY (course_id)
);

CREATE TABLE Enrollment (
    enrollment_id BIGINT IDENTITY(1,1) NOT NULL,
    student_id    BIGINT NOT NULL,
    course_id     VARCHAR(10) NOT NULL,
    grade         VARCHAR(2) NOT NULL,
    semester      VARCHAR(20) NOT NULL,
    created_at    DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    updated_at    DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    PRIMARY KEY (enrollment_id),
    CONSTRAINT UQ_Enrollment_StudentCourseSemester UNIQUE (student_id, course_id, semester)
);

-- 4. Add foreign keys (no cascades to avoid multiple cascade paths)

ALTER TABLE Instructor
  ADD CONSTRAINT FK_Instructor_Department FOREIGN KEY (department_id) REFERENCES Department(department_id);

ALTER TABLE Course
  ADD CONSTRAINT FK_Course_Department FOREIGN KEY (department_id) REFERENCES Department(department_id),
      CONSTRAINT FK_Course_Instructor FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id);

ALTER TABLE Enrollment
  ADD CONSTRAINT FK_Enrollment_Student FOREIGN KEY (student_id) REFERENCES Student(student_id),
      CONSTRAINT FK_Enrollment_Course  FOREIGN KEY (course_id)  REFERENCES Course(course_id);

-- 5. Indexes
CREATE INDEX IX_Enrollment_Student ON Enrollment(student_id);
CREATE INDEX IX_Enrollment_Course  ON Enrollment(course_id);
CREATE INDEX IX_Course_Department  ON Course(department_id);
CREATE INDEX IX_Course_Instructor  ON Course(instructor_id);
CREATE INDEX IX_Instructor_Department ON Instructor(department_id);

PRINT 'University model deployed successfully.';

-- Optional CHECK constraints (uncomment as needed)
-- ALTER TABLE Course ADD CONSTRAINT CK_Course_Credits CHECK (credits BETWEEN 0 AND 30);
-- ALTER TABLE Enrollment ADD CONSTRAINT CK_Enrollment_Grade CHECK (grade IN ('A','B','C','D','F','I','W'));