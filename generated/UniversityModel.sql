CREATE TABLE Student (
	student_id BIGINT NOT NULL,	-- type mapped from: INTEGER
	name VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	major VARCHAR(50) NOT NULL,
	year BIGINT NOT NULL,	-- type mapped from: INTEGER
	PRIMARY KEY (student_id)
);
CREATE TABLE Course (
	course_id VARCHAR(10) NOT NULL,
	title VARCHAR(200) NOT NULL,
	credits BIGINT NOT NULL,	-- type mapped from: INTEGER
	department_id VARCHAR(10) NOT NULL,
	instructor_id BIGINT NOT NULL,	-- type mapped from: INTEGER
	PRIMARY KEY (course_id)
);
CREATE TABLE Instructor (
	instructor_id BIGINT NOT NULL,	-- type mapped from: INTEGER
	name VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	department_id VARCHAR(10) NOT NULL,
	PRIMARY KEY (instructor_id)
);
CREATE TABLE Department (
	department_id VARCHAR(10) NOT NULL,
	name VARCHAR(100) NOT NULL,
	location VARCHAR(100) NOT NULL,
	PRIMARY KEY (department_id)
);
CREATE TABLE Enrollment (
	enrollment_id BIGINT NOT NULL,	-- type mapped from: INTEGER
	student_id BIGINT NOT NULL,	-- type mapped from: INTEGER
	course_id VARCHAR(10) NOT NULL,
	grade VARCHAR(2) NOT NULL,
	semester VARCHAR(20) NOT NULL,
	PRIMARY KEY (enrollment_id)
);
CREATE TABLE StudentEnrollment (
	student_id BIGINT NOT NULL,	-- type mapped from: INTEGER
	enrollment_id BIGINT NOT NULL,	-- type mapped from: INTEGER
	PRIMARY KEY (student_id, enrollment_id),
	FOREIGN KEY (student_id) REFERENCES Student (student_id) ON DELETE CASCADE,
	FOREIGN KEY (enrollment_id) REFERENCES Enrollment (enrollment_id) ON DELETE CASCADE
);
CREATE TABLE CourseInstructor (
	course_id VARCHAR(10) NOT NULL,
	instructor_id BIGINT NOT NULL,	-- type mapped from: INTEGER
	PRIMARY KEY (course_id, instructor_id),
	FOREIGN KEY (course_id) REFERENCES Course (course_id) ON DELETE CASCADE,
	FOREIGN KEY (instructor_id) REFERENCES Instructor (instructor_id) ON DELETE CASCADE
);
CREATE TABLE CourseDepartment (
	course_id VARCHAR(10) NOT NULL,
	department_id VARCHAR(10) NOT NULL,
	PRIMARY KEY (course_id, department_id),
	FOREIGN KEY (course_id) REFERENCES Course (course_id) ON DELETE CASCADE,
	FOREIGN KEY (department_id) REFERENCES Department (department_id) ON DELETE CASCADE
);
CREATE TABLE InstructorDepartment (
	instructor_id BIGINT NOT NULL,	-- type mapped from: INTEGER
	department_id VARCHAR(10) NOT NULL,
	PRIMARY KEY (instructor_id, department_id),
	FOREIGN KEY (instructor_id) REFERENCES Instructor (instructor_id) ON DELETE CASCADE,
	FOREIGN KEY (department_id) REFERENCES Department (department_id) ON DELETE CASCADE
);
