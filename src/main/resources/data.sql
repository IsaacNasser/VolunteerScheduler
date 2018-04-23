SET DB_CLOSE_DELAY -1;         
;              
CREATE USER IF NOT EXISTS SA SALT '1635b1e0fe21c740' HASH '0ad7ced51a2614f1d443aa7b37619f2de21d384c02677cc38a545580aa73e63f' ADMIN;            
CREATE MEMORY TABLE PUBLIC.PERSON(
    P_USERNAME VARCHAR(255) NOT NULL,
    P_FIRSTNAME VARCHAR(255) NOT NULL,
    P_LASTNAME VARCHAR(255) NOT NULL,
    P_ADDRESS VARCHAR(255),
    P_CITY VARCHAR(255),
    P_STATE VARCHAR(255),
    P_ZIP VARCHAR(5),
    P_PHONE VARCHAR(11),
    P_DOB DATE NOT NULL
); 
ALTER TABLE PUBLIC.PERSON ADD CONSTRAINT PUBLIC.CONSTRAINT_8 PRIMARY KEY(P_USERNAME);          
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.PERSON;   
CREATE MEMORY TABLE PUBLIC.VOLUNTEER(
    V_USERNAME VARCHAR(255) NOT NULL
);  
ALTER TABLE PUBLIC.VOLUNTEER ADD CONSTRAINT PUBLIC.CONSTRAINT_2 PRIMARY KEY(V_USERNAME);       
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.VOLUNTEER;
CREATE MEMORY TABLE PUBLIC.SCHOOL(
    SCH_ID INTEGER NOT NULL,
    SCH_NAME VARCHAR(255) NOT NULL,
    SCH_ADDRESS VARCHAR(255) NOT NULL,
    SCH_CITY VARCHAR(255) NOT NULL,
    SCH_STATE VARCHAR(2) NOT NULL,
    SCH_ZIP VARCHAR(5) NOT NULL
);           
ALTER TABLE PUBLIC.SCHOOL ADD CONSTRAINT PUBLIC.CONSTRAINT_9 PRIMARY KEY(SCH_ID);              
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SCHOOL;   
CREATE MEMORY TABLE PUBLIC.STUDENT(
    S_USERNAME VARCHAR(255) NOT NULL,
    S_SCHOOL INTEGER NOT NULL,
    S_MAJOR VARCHAR(255) NOT NULL,
    S_GRADYEAR INTEGER NOT NULL,
    S_ID VARCHAR(255) NOT NULL
); 
ALTER TABLE PUBLIC.STUDENT ADD CONSTRAINT PUBLIC.CONSTRAINT_B PRIMARY KEY(S_USERNAME);         
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.STUDENT;  
CREATE MEMORY TABLE PUBLIC.AVAILABLETIME(
    AT_VOLUNTEER VARCHAR(255) NOT NULL,
    AT_STARTTIME DATETIME NOT NULL,
    AT_ENDTIME DATETIME NOT NULL
);      
ALTER TABLE PUBLIC.AVAILABLETIME ADD CONSTRAINT PUBLIC.CONSTRAINT_29 PRIMARY KEY(AT_VOLUNTEER, AT_STARTTIME, AT_ENDTIME);      
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.AVAILABLETIME;            
CREATE MEMORY TABLE PUBLIC.WORKER(
    W_USERNAME VARCHAR(255) NOT NULL,
    W_POSITION VARCHAR(255)
);        
ALTER TABLE PUBLIC.WORKER ADD CONSTRAINT PUBLIC.CONSTRAINT_98 PRIMARY KEY(W_USERNAME);         
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.WORKER;   
CREATE MEMORY TABLE PUBLIC.LOGIN(
    L_USERNAME VARCHAR(255) NOT NULL,
    L_PASSWORD VARCHAR(255),
    L_HASH VARCHAR(255)
);
ALTER TABLE PUBLIC.LOGIN ADD CONSTRAINT PUBLIC.CONSTRAINT_4 PRIMARY KEY(L_USERNAME);           
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.LOGIN;    
CREATE MEMORY TABLE PUBLIC.ORGANIZATION(
    O_ID INTEGER NOT NULL,
    O_NAME VARCHAR(255) NOT NULL,
    O_DESCRIPTION VARCHAR(255),
    O_ADDRESS VARCHAR(255) NOT NULL,
    O_CITY VARCHAR(255) NOT NULL,
    O_STATE VARCHAR(2) NOT NULL,
    O_ZIP VARCHAR(5) NOT NULL,
    O_ORGANIZER VARCHAR(255) NOT NULL
);          
ALTER TABLE PUBLIC.ORGANIZATION ADD CONSTRAINT PUBLIC.CONSTRAINT_D PRIMARY KEY(O_ID);          
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.ORGANIZATION;             
CREATE MEMORY TABLE PUBLIC.TAG(
    T_NAME VARCHAR(255) NOT NULL
);            
ALTER TABLE PUBLIC.TAG ADD CONSTRAINT PUBLIC.CONSTRAINT_1 PRIMARY KEY(T_NAME); 
-- 35 +/- SELECT COUNT(*) FROM PUBLIC.TAG;     
INSERT INTO PUBLIC.TAG(T_NAME) VALUES
('Advocacy'),
('Arts'),
('Cooperative Business'),
('Counseling'),
('Crisis Intervention'),
('Culture'),
('Disabilities'),
('Disaster Relief'),
('Domestic Violence'),
('Economic Justice'),
('Education'),
('Elderly'),
('Emergency Assistance'),
('Environment'),
('Financial Counseling'),
('Healthcare'),
('History'),
('Homelessness'),
('Housing'),
('Human Rights'),
('Immigration'),
('Literacy'),
('Mental Health'),
('Mentoring'),
('Nature'),
('Nutrition'),
('Poverty'),
('Recreation'),
('Senior Services'),
('Social Justice'),
('Substance Abuse'),
('Tutoring'),
('Veterans Issues'),
('Women''s issues'),
('Youth');     
CREATE MEMORY TABLE PUBLIC.ORGANIZATIONTAG(
    OT_ORGANIZATION INTEGER NOT NULL,
    OT_TAG VARCHAR(255) NOT NULL
);          
ALTER TABLE PUBLIC.ORGANIZATIONTAG ADD CONSTRAINT PUBLIC.CONSTRAINT_91 PRIMARY KEY(OT_ORGANIZATION, OT_TAG);   
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.ORGANIZATIONTAG;          
CREATE MEMORY TABLE PUBLIC.EVENT(
    E_ID INTEGER NOT NULL,
    E_DATETIME DATETIME NOT NULL,
    E_NAME VARCHAR(255) NOT NULL,
    E_DESCRIPTION VARCHAR(255),
    E_ORGANIZATION INTEGER NOT NULL,
    E_EMPLOYEEORG VARCHAR(255)
);        
ALTER TABLE PUBLIC.EVENT ADD CONSTRAINT PUBLIC.CONSTRAINT_3 PRIMARY KEY(E_ID); 
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.EVENT;    
CREATE MEMORY TABLE PUBLIC.VOLUNTEEREVENT(
    VE_ID INTEGER NOT NULL,
    VE_VOLUNTEER VARCHAR(255) NOT NULL,
    VE_EVENT INTEGER NOT NULL,
    VE_HOURS INTEGER NOT NULL
); 
ALTER TABLE PUBLIC.VOLUNTEEREVENT ADD CONSTRAINT PUBLIC.CONSTRAINT_1A PRIMARY KEY(VE_ID);      
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.VOLUNTEEREVENT;           
ALTER TABLE PUBLIC.EVENT ADD CONSTRAINT PUBLIC.CONSTRAINT_3F4 FOREIGN KEY(E_EMPLOYEEORG) REFERENCES PUBLIC.WORKER(W_USERNAME) NOCHECK;         
ALTER TABLE PUBLIC.STUDENT ADD CONSTRAINT PUBLIC.CONSTRAINT_BA FOREIGN KEY(S_USERNAME) REFERENCES PUBLIC.VOLUNTEER(V_USERNAME) NOCHECK;        
ALTER TABLE PUBLIC.LOGIN ADD CONSTRAINT PUBLIC.CONSTRAINT_45 FOREIGN KEY(L_USERNAME) REFERENCES PUBLIC.PERSON(P_USERNAME) NOCHECK;             
ALTER TABLE PUBLIC.ORGANIZATIONTAG ADD CONSTRAINT PUBLIC.CONSTRAINT_91A8 FOREIGN KEY(OT_ORGANIZATION) REFERENCES PUBLIC.ORGANIZATION(O_ID) NOCHECK;            
ALTER TABLE PUBLIC.VOLUNTEER ADD CONSTRAINT PUBLIC.CONSTRAINT_27 FOREIGN KEY(V_USERNAME) REFERENCES PUBLIC.PERSON(P_USERNAME) NOCHECK;         
ALTER TABLE PUBLIC.AVAILABLETIME ADD CONSTRAINT PUBLIC.CONSTRAINT_297 FOREIGN KEY(AT_VOLUNTEER) REFERENCES PUBLIC.VOLUNTEER(V_USERNAME) NOCHECK;               
ALTER TABLE PUBLIC.WORKER ADD CONSTRAINT PUBLIC.CONSTRAINT_98F FOREIGN KEY(W_USERNAME) REFERENCES PUBLIC.PERSON(P_USERNAME) NOCHECK;           
ALTER TABLE PUBLIC.VOLUNTEEREVENT ADD CONSTRAINT PUBLIC.CONSTRAINT_1A1 FOREIGN KEY(VE_VOLUNTEER) REFERENCES PUBLIC.VOLUNTEER(V_USERNAME) NOCHECK;              
ALTER TABLE PUBLIC.ORGANIZATION ADD CONSTRAINT PUBLIC.CONSTRAINT_D0 FOREIGN KEY(O_ORGANIZER) REFERENCES PUBLIC.WORKER(W_USERNAME) NOCHECK;     
ALTER TABLE PUBLIC.VOLUNTEEREVENT ADD CONSTRAINT PUBLIC.CONSTRAINT_1A13 FOREIGN KEY(VE_EVENT) REFERENCES PUBLIC.EVENT(E_ID) NOCHECK;           
ALTER TABLE PUBLIC.ORGANIZATIONTAG ADD CONSTRAINT PUBLIC.CONSTRAINT_91A FOREIGN KEY(OT_TAG) REFERENCES PUBLIC.TAG(T_NAME) NOCHECK;             
ALTER TABLE PUBLIC.STUDENT ADD CONSTRAINT PUBLIC.CONSTRAINT_BAC FOREIGN KEY(S_SCHOOL) REFERENCES PUBLIC.SCHOOL(SCH_ID) NOCHECK;
ALTER TABLE PUBLIC.EVENT ADD CONSTRAINT PUBLIC.CONSTRAINT_3F FOREIGN KEY(E_ORGANIZATION) REFERENCES PUBLIC.ORGANIZATION(O_ID) NOCHECK;         
