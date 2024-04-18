-- Create/Stablish Connection using:
-- Connection Name: SSIS_localhost
-- Hostname: 127.0.0.1
-- Port: 3306

-- Use only if there existing schema
-- DROP DATABASE ssis_database;

CREATE DATABASE ssis_database;

USE ssis_database;

CREATE TABLE courses(
	course_code VARCHAR(10),
    course_name VARCHAR(100),
    CONSTRAINT pk_course_code PRIMARY KEY(course_code),
    CONSTRAINT unique_course_name UNIQUE(course_name)
);

INSERT INTO courses VALUES 		('BSB','Bachelor of Science in Biology'),
								('BSCE','Bachelor of Science in Civil Engineering'),
								('BSCA','Bachelor of Science in Computer Application'),
								('BSCS','Bachelor of Science in Computer Science'),
								('BSECE','Bachelor of Science in Electronics and Communication Engineering'),
								('BSIAM','Bachelor of Science in Industrial Automation and Mechatronics'),
								('BSIS','Bachelor of Science in Information Systems'),
								('BSIT','Bachelor of Science in Information Technology'),
								('BSME','Bachelor of Science in Mining Engineering'),
								('BSN','Bachelor of Science in Nursing'),
								('BSPsy','Bachelor of Science in Psychology');

CREATE TABLE students(
	last_name VARCHAR(50),
    first_name VARCHAR(50),
    middle_name VARCHAR(50) DEFAULT "",
    id_number CHAR(9),
    year_level ENUM('1st year','2nd year','3rd year','4th year','5th year','6th year','More...') NOT NULL,
	gender VARCHAR(50) DEFAULT "Not yet named.",
    course_code VARCHAR(10),
    CONSTRAINT unique_full_name UNIQUE(last_name, first_name, middle_name),
    CONSTRAINT pk_id_number PRIMARY KEY(id_number),
    CONSTRAINT students_courses_fk FOREIGN KEY(course_code) REFERENCES courses(course_code)
);

INSERT INTO students VALUES ('Bautista','Dale Justin','Recomata','2022-0001','1st year','Male','BSIT'),
							('Bautista','Behn Joshua','Recomata','2022-0002','1st year','Male','BSME'),
							('Bautista','Caine Ivan','Recomata','2022-0378','2nd year','Male','BSCS'),
							('Cabilla','Angel Claire','Abrazado','2022-3337','1st year','Female','BSPsy'),
							('Smith','John','Michael','2069-0001','4th year','Male','BSIAM'),
							('Johnson','Emily','Grace','2069-0002','3rd year','Female','BSIAM'),
							('Brown','Matthew','Robert','2069-0003','2nd year','Male','BSIAM'),
							('Davis','Sophia','Elizabeth','2069-0004','4th year','Female','BSIAM'),
							('Miller','James','Andrew','2069-0005','3rd year','Male','BSIAM'),
							('Wilson','Olivia','Rose','2069-0006','2nd year','Female','BSCA'),
							('Moore','David','Thomas','2069-0007','1st year','Male','BSCA'),
							('Taylor','Emma','Marie','2069-0008','4th year','Female','BSCA'),
							('Anderson','William','Christopher','2069-0009','3rd year','Male','BSCA'),
							('White','Abigail','Lynn','2069-0010','2nd year','Female','BSCA'),
							('Jones','Aiden','Joseph','2069-0011','1st year','Male','BSIS'),
							('Martin','Chloe','Grace','2069-0012','4th year','Female','BSIS'),
							('Lee','Liam','Alexander','2069-0013','3rd year','Male','BSIS'),
							('Garcia','Mia','Isabella','2069-0014','2nd year','Female','BSIS'),
							('Clark','Samuel','Edward','2069-0015','1st year','Male','BSIS'),
							('Lewis','Grace','Victoria','2069-0016','4th year','Female','BSB'),
							('Hall','Nathan','Daniel','2069-0017','3rd year','Male','BSB'),
							('Baker','Sofia','Rose','2069-0018','2nd year','Female','BSB'),
							('Hill','Ethan','Michael','2069-0019','1st year','Male','BSB'),
							('Gomez','Ava','Marie','2069-0020','4th year','Female','BSB'),
							('Young','Noah','William','2069-0021','3rd year','Male','BSIT'),
							('Cooper','Lily','Ann','2069-0022','2nd year','Female','BSIT'),
							('Fisher','Jack','Thomas','2069-0023','1st year','Male','BSIT'),
							('Ward','Ella','Grace','2069-0024','4th year','Female','BSIT'),
							('Evans','Christopher','John','2069-0025','3rd year','Male','BSIT'),
							('Turner','Hannah','Rose','2069-0026','2nd year','Female','BSCS'),
							('Harrison','Dylan','James','2069-0027','1st year','Male','BSCS'),
							('Morgan','Avery','Lynn','2069-0028','4th year','Female','BSCS'),
							('Harris','Aiden','Robert','2069-0029','3rd year','Male','BSCS'),
							('Lopez','Sophie','Marie','2069-0030','2nd year','Female','BSCS'),
							('Reed','Logan','Michael','2069-0031','1st year','Male','BSME'),
							('Phillips','Ella','Grace','2069-0032','4th year','Female','BSME'),
							('Carter','Matthew','David','2069-0033','3rd year','Male','BSME'),
							('Wright','Isabella','Rose','2069-0034','2nd year','Female','BSME'),
							('Turner','Liam','Christopher','2069-0035','1st year','Male','BSME'),
							('Perez','Ava','Elizabeth','2069-0036','4th year','Female','BSECE'),
							('Bailey','Samuel','Joseph','2069-0037','3rd year','Male','BSECE'),
							('Garcia','Lily','Marie','2069-0038','2nd year','Female','BSECE'),
							('Ross','Nathan','Edward','2069-0039','1st year','Male','BSECE'),
							('Foster','Sofia','Grace','2069-0040','4th year','Female','BSECE'),
							('Gonzalez','Noah','Andrew','2069-0041','3rd year','Male','BSN'),
							('Kelly','Chloe','Marie','2069-0042','2nd year','Female','BSN'),
							('Barnes','William','Joseph','2069-0043','1st year','Male','BSN'),
							('Hill','Emily','Lynn','2069-0044','4th year','Female','BSN'),
							('Fisher','James','Michael','2069-0045','3rd year','Male','BSN'),
							('Allen','Olivia','Rose','2069-0046','2nd year','Female','BSPsy'),
							('Collins','Ethan','Christopher','2069-0047','1st year','Male','BSPsy'),
							('Bryant','Ava','Lynn','2069-0048','4th year','Female','BSPsy'),
							('Bell','Liam','Joseph','2069-0049','3rd year','Male','BSPsy'),
							('Stewart','Emma','Grace','2069-0050','2nd year','Female','BSPsy'),
							('Nguyen','Anh','Tuan','2069-0051','4th year','Male','BSME'),
							('Wang','Mei','Li','2069-0052','3rd year','Female','BSIS'),
							('Gonzalez','Miguel','Angel','2069-0053','2nd year','Male','BSCS'),
							('Smith','Elizabeth','Anne','2069-0054','1st year','Female','BSN'),
							('Chen','Hui','Xin','2069-0055','4th year','Female','BSIS'),
							('Lopez','Jose','Carlos','2069-0056','3rd year','Male','BSCA'),
							('Kim','Ji-Won','Min','2069-0057','2nd year','Female','BSIT'),
							('Brown','Michael','Anthony','2069-0058','1st year','Male','BSIS'),
							('Garcia','Sofia','Isabel','2069-0059','4th year','Female','BSCA'),
							('Lee','Sung-Ho','Ki','2069-0060','3rd year','Male','BSME'),
							('Martinez','Alejandro','Juan','2069-0061','2nd year','Male','BSN'),
							('Nguyen','Thanh','Huyen','2069-0062','1st year','Female','BSIS'),
							('Kumar','Rajesh','Ravi','2069-0063','4th year','Male','BSIT'),
							('Hernandez','Luis','Fernando','2069-0064','3rd year','Male','BSB'),
							('Wong','Li','Jun','2069-0066','1st year','Female','BSME'),
							('Park','Ji-Hoon','Hyun','2069-0067','4th year','Male','BSECE'),
							('Tan','Siew','Yen','2069-0068','3rd year','Female','BSN'),
							('Chang','Wei-Li','Xiang','2069-0069','2nd year','Female','BSCS'),
							('Kowalski','Mateusz','Adam','2069-0070','1st year','Male','BSME'),
							('Fischer','Lukas','Maximilian','2069-0071','4th year','Male','BSN'),
							('Müller','Sarah','Sophie','2069-0072','3rd year','Female','BSB'),
							('Andersen','Mikkel','Larsen','2069-0073','2nd year','Male','BSCS'),
							('Hassan','Ahmed','Mohamed','2069-0074','1st year','Male','BSIS'),
							('Gomes','Maria','Isabel','2069-0075','4th year','Female','BSIT'),
							('Li','Jing','Yi','2069-0076','3rd year','Female','BSECE'),
							('Singh','Rajendra','Kumar','2069-0077','2nd year','Male','BSN'),
							('Kawamura','Yuki','Ko','2069-0078','1st year','Female','BSIS'),
							('Ferrari','Giulia','Francesca','2069-0079','4th year','Female','BSN'),
							('Olsen','Lars','Andreas','2069-0080','3rd year','Male','BSIT'),
							('Nguyen','Minh','Thanh','2069-0081','2nd year','Female','BSN'),
							('Kovačević','Marko','Nikola','2069-0082','1st year','Male','BSCS'),
							('Chung','Jae-Wook','Sun','2069-0083','4th year','Male','BSME'),
							('Almelda','Ana','Lucia','2069-0084','3rd year','Female','BSIS'),
							('Petrov','Ivan','Andreev','2069-0085','2nd year','Male','BSIT'),
							('Lima','João','Paulo','2069-0086','1st year','Male','BSECE'),
							('Morita','Yuki','Hiroshi','2069-0087','4th year','Male','BSN'),
							('Schneider','Lukas','Martin','2069-0088','3rd year','Male','BSB'),
							('Huang','Li','Ying','2069-0089','2nd year','Female','BSIS'),
							('Santos','Luis','Miguel','2069-0090','1st year','Male','BSN'),
							('Ong','Hui','Ling','2069-0091','4th year','Female','BSCS'),
							('Zhang','Wei','Jie','2069-0092','3rd year','Male','BSIT'),
							('Jensen','Emma','Louise','2069-0093','2nd year','Female','BSN'),
							('Dubois','Pierre','Marie','2069-0094','1st year','Male','BSME'),
							('Yamamoto','Sakura','Ai','2069-0095','4th year','Female','BSN'),
							('Ramos','Carlos','Eduardo','2069-0096','3rd year','Male','BSIT'),
							('Ivanov','Alexander','Dmitrievich','2069-0097','2nd year','Male','BSN'),
							('Silva','Ana','Beatriz','2069-0098','1st year','Female','BSIS'),
							('Joshi','Aditi','Vikram','2069-0099','4th year','Female','BSN'),
							('Kim','Yoon-Hee','Soo','2069-0100','3rd year','Female','BSME'),
							('Wu','Cheng','Li','2069-0101','4th year','Male','BSME'),
							('Choi','Soo-Jin','Min','2069-0102','3rd year','Female','BSN'),
							('Santos','Paulo','Rodrigo','2069-0103','2nd year','Male','BSIT'),
							('Gupta','Aman','Kumar','2069-0104','1st year','Male','BSIS'),
							('Le','Trang','Thu','2069-0105','4th year','Female','BSIS'),
							('Saito','Takashi','Ryu','2069-0106','3rd year','Male','BSME'),
							('Andrei','Ana','Maria','2069-0107','2nd year','Female','BSN'),
							('Tanaka','Yuichi','Kohei','2069-0108','1st year','Male','BSIS'),
							('Santos','Julia','Maria','2069-0109','4th year','Female','BSN'),
							('Wong','Yau','Ming','2069-0110','3rd year','Male','BSCA'),
							('Gomez','Carlos','Manuel','2069-0111','2nd year','Male','BSME'),
							('Silva','Luis','Felipe','2069-0112','1st year','Male','BSN'),
							('Nguyen','Hoa','Binh','2069-0113','4th year','Female','BSIT'),
							('Ferrari','Marco','Andrea','2069-0114','3rd year','Male','BSIS'),
							('Chen','Xiao','Yun','2069-0115','2nd year','Female','BSN'),
							('Ivanov','Anastasia','Dmitrievna','2069-0116','1st year','Female','BSME'),
							('Tan','Wee','Liang','2069-0117','4th year','Male','BSIS'),
							('Suzuki','Kenji','Takahashi','2069-0118','3rd year','Male','BSN'),
							('Wang','Jing','Yi','2069-0119','2nd year','Female','BSME'),
							('Nguyen','Tuan','Anh','2069-0120','1st year','Male','BSN'),
							('Gomes','Luis','Fernando','2069-0121','4th year','Male','BSIT'),
							('Park','Min-Ji','Hye','2069-0122','3rd year','Female','BSCA'),
							('Fischer','Sabine','Katrin','2069-0123','2nd year','Female','BSIS'),
							('Kumar','Ashish','Raj','2069-0124','1st year','Male','BSN'),
							('Wu','Jing','Wei','2069-0125','4th year','Female','BSME'),
							('Rocha','Felipe','Silva','2069-0126','3rd year','Male','BSN'),
							('Takahashi','Aoi','Ren','2069-0127','2nd year','Female','BSIS'),
							('Kim','Seo-Jin','Hye','2069-0128','1st year','Female','BSN'),
							('Ali','Mohammed','Khalid','2069-0129','4th year','Male','BSME'),
							('Müller','Maximilian','Paul','2069-0130','3rd year','Male','BSIS'),
							('Hernandez','Ana','Luisa','2069-0131','2nd year','Female','BSN'),
							('Jiang','Wei','Li','2069-0132','1st year','Male','BSME'),
							('Ramos','Isabela','Moreira','2069-0133','4th year','Female','BSIS'),
							('Gupta','Priya','Anjali','2069-0134','3rd year','Female','BSN'),
							('Chen','Zheng','Wei','2069-0135','2nd year','Male','BSME'),
							('Sato','Ren','Yamamoto','2069-0136','1st year','Male','BSN'),
							('Li','Xiao','Wei','2069-0137','4th year','Female','BSIS'),
							('Park','Sang-Hoon','Ho','2069-0138','3rd year','Male','BSME'),
							('Nguyen','Tam','Anh','2069-0139','2nd year','Female','BSN'),
							('Garcia','Diego','Javier','2069-0140','1st year','Male','BSIS'),
							('Kovács','Gábor','László','2069-0141','4th year','Male','BSN'),
							('Chang','Chen','Wei','2069-0142','3rd year','Female','BSME'),
							('Liu','Wei','Liang','2069-0143','2nd year','Male','BSIS'),
							('Hwang','Hyun-Ji','Min','2069-0144','1st year','Female','BSN'),
							('Ahmed','Aisha','Mohammed','2069-0145','4th year','Female','BSME'),
							('Yamamoto','Ren','Sato','2069-0146','3rd year','Male','BSN'),
							('Garcia','Manuel','Luis','2069-0147','2nd year','Male','BSIS'),
							('Nguyen','Tran','Hoang','2069-0148','1st year','Male','BSN'),
							('Santos','Marcelo','Andrade','2069-0149','4th year','Male','BSIT');