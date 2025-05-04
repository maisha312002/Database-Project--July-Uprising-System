create database July_Uprising_System
go
use July_Uprising_System
go
CREATE TABLE People (
    P_id INT PRIMARY KEY,    
    Name VARCHAR(100),        
    Age INT,                
    Role VARCHAR(150)        
)
go

CREATE TABLE Location (
    Location_id INT PRIMARY KEY,  
    Name VARCHAR(100),            
    District VARCHAR(150)
)  
go

CREATE TABLE Organization (
    O_id INT PRIMARY KEY,                
    Name VARCHAR(100) NOT NULL,          
    Type VARCHAR(100),                    
    Description TEXT,                      
    P_id INT,                              
    CONSTRAINT fk_P_id FOREIGN KEY (P_id)
        REFERENCES People(P_id)          
                       
)
go

CREATE TABLE Event (
    Event_id INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Date DATE,
    Location_id INT,
    CONSTRAINT fk_Location_id FOREIGN KEY (Location_id) REFERENCES Location(Location_id) ,
  
)
go

CREATE TABLE Arrest (
    Arrest_id INT PRIMARY KEY,
    Reason VARCHAR(150) ,
    Duration VARCHAR(50),
    P_id INT,
    Event_id INT,
    FOREIGN KEY (P_id) REFERENCES People(P_id) ,
    CONSTRAINT fk_Event_id FOREIGN KEY (Event_id) REFERENCES Event(Event_id)
)
go


CREATE TABLE Injuries (
    Injured_id INT PRIMARY KEY,
    Severity VARCHAR(100) NOT NULL,
    P_id INT,
    Event_id INT,
    FOREIGN KEY (P_id) REFERENCES People(P_id) ,
    FOREIGN KEY (Event_id) REFERENCES Event(Event_id)
)
go

CREATE TABLE Social_Media_Post (
    Post_id INT PRIMARY KEY,
    Author VARCHAR(150) ,
    Platform VARCHAR(100),
    Date DATE,
    Event_id INT,
    FOREIGN KEY (Event_id) REFERENCES Event(Event_id)
)
go


CREATE TABLE Media (
    Media_id INT PRIMARY KEY,
    Type VARCHAR(100) ,
    Description TEXT,    
	)
go


CREATE TABLE Medical_Facility (
    Medical_id INT PRIMARY KEY,
    Name VARCHAR(100) ,
    Capacity INT,
    Location_id INT,
    FOREIGN KEY (Location_id) REFERENCES location(Location_id)
)
CREATE TABLE Protest (
    Protest_Id INT PRIMARY KEY,
    P_Id INT,
    Event_Id INT,
    Number_Of_Participants INT,
    FOREIGN KEY (P_Id) REFERENCES People(P_Id),
    FOREIGN KEY (Event_Id) REFERENCES Event(Event_Id)
);

CREATE TABLE Event_in_Media (
    event_id INT,
    media_id INT,
    PRIMARY KEY (event_id, media_id), 
    FOREIGN KEY (event_id) REFERENCES Event(event_id),
    FOREIGN KEY (Media_id) REFERENCES Media(media_id)
);
INSERT INTO People VALUES
(1, 'Abdul Karim', 34, 'Police Officer'),
(2, 'Fatema Begum', 28, 'Firefighter'),
(3, 'Shahadat Hossain', 45, 'Paramedic'),
(4, 'Rabeya Sultana', 38, 'Teacher'),
(5, 'Kamrul Islam', 50, 'Doctor'),
(6, 'Nusrat Jahan', 40, 'Nurse'),
(7, 'Jahid Hasan', 33, 'Engineer'),
(8, 'Rafiq Ahmed', 29, 'Lawyer'),
(9, 'Tanvir Rahman', 25, 'Student'),
(10, 'Maya Akter', 31, 'Journalist'),
(11, 'Imran Chowdhury', 37, 'Artist'),
(12, 'Shirin Akhter', 44, 'Social Worker'),
(13, 'Aminul Islam', 26, 'Police Officer'),
(14, 'Taslima Nasrin', 32, 'Scientist'),
(15, 'Abu Hanif', 55, 'Retired'),
(16, 'Rumana Parveen', 27, 'Architect'),
(17, 'Shafiq Ullah', 52, 'Politician'),
(18, 'Tania Rahman', 30, 'Entrepreneur'),
(19, 'Masud Rana', 41, 'Driver'),
(20, 'Farhana Rahim', 35, 'Musician');

INSERT INTO People VALUES
(21, 'Sajid Arefin', 24, 'Student'),
(22, 'Hujur Shahadat Hossain',18, 'Student'), 
(23, 'Sajjad Ullah Fahim bissash',12, 'Student'),
(24, 'Udoy Titus',28, 'Student')


go
INSERT INTO Location VALUES
(1, 'Shapla Chattar', 'Dhaka'),
(2, 'Jatiya Sangsad Bhaban', 'Dhaka'),
(3, 'Kamalapur Railway Station', 'Dhaka'),
(4, 'Baitul Mukarram National Mosque', 'Dhaka'),
(5, 'Chittagong Port Area', 'Chittagong'),
(6, 'Shah Amanat Bridge', 'Chittagong'),
(7, 'Shaheed Minar', 'Sylhet'),
(8, 'Keane Bridge', 'Sylhet'),
(9, 'Rajshahi University Campus', 'Rajshahi'),
(10, 'Bagha Mosque', 'Rajshahi'),
(11, 'Khadimnagar Tea Estate', 'Sylhet'),
(12, 'Mongla Port', 'Khulna'),
(13, 'Sundarbans Gateway', 'Khulna'),
(14, 'Hardinge Bridge', 'Kushtia'),
(15, 'Pabna Mental Hospital', 'Pabna'),
(16, 'Sonargaon Museum', 'Narayanganj'),
(17, 'Bangabandhu Bridge', 'Tangail'),
(18, 'Barisal River Port', 'Barisal'),
(19, 'Padma Bridge', 'Madaripur'),
(20, 'Lalbagh Fort', 'Dhaka');
go

INSERT INTO Organization VALUES
(1, 'National Unity Forum', 'Political', 'An Organization advocating for democratic reforms and fair elections.', 1),
(2, 'Workers Solidarity Union', 'Labor', 'An organization representing factory and garment workers protesting for higher wages.', 3),
(3, 'Student Alliance for Change', 'Student', 'A student-led movement demanding educational reforms and better opportunities.', 9),
(4, 'Green Future Bangladesh', 'Environmental', 'A group focused on climate action and opposing deforestation in the Sundarbans.', 18),
(5, 'Freedom Fighters Association', 'Historical', 'An association preserving the legacy of the 1971 liberation war.', 15),
(6, 'Citizen’s Rights Collective', 'Activist', 'A civil society group campaigning for freedom of speech and human rights.', 2),
(7, 'Transport Workers Federation', 'Labor', 'An organization advocating for the rights of public transport workers.', 19),
(8, 'Women’s Empowerment Circle', 'Social', 'A network promoting gender equality and women’s safety.', 6),
(9, 'Youth for Digital Progress', 'Technology', 'A youth organization promoting digital literacy and access in rural areas.', 13),
(10, 'Farmers Union of Bangladesh', 'Agricultural', 'An association working for fair crop prices and against forced land acquisition.', 11),
(11, 'Bangladesh Medical Society', 'Health', 'A professional society addressing health care challenges during protests.', 5),
(12, 'Cultural Heritage Foundation', 'Cultural', 'An organization preserving and promoting Bangladeshi arts and culture.', 11),
(13, 'Freedom of Press Initiative', 'Journalism', 'A group advocating for the protection of journalists during movements.', 10),
(14, 'Peace Builders Network', 'Social', 'A non-partisan group mediating between protestors and authorities.', 17),
(15, 'Teachers’ Federation of Bangladesh', 'Education', 'A union calling for better pay and improved school infrastructure.', 4),
(16, 'Legal Aid Bangladesh', 'Legal', 'An NGO providing legal support to protestors and marginalized communities.', 8),
(17, 'Community Health Advocates', 'Health', 'A group offering medical aid to protestors during movements.', 6),
(18, 'Technology for Justice', 'Technology', 'A group using tech tools to track protests and police actions.', 7),
(19, 'Rural Development Trust', 'Development', 'An organization supporting rural communities affected by social movements.', 14),
(20, 'Artists for Change', 'Cultural', 'A collective using art to spread awareness about social and political issues.', 11);
 go
 INSERT INTO Event (Event_Id, Name, Description, Date, Location_Id) VALUES
(1, 'Nationwide Student March', 'A large-scale protest demanding reforms in the education system and lower tuition fees.', '2024-07-01', 9),
(2, 'Campus Occupation at Dhaka University', 'Students occupied key buildings at Dhaka University, calling for administrative transparency.', '2024-07-03', 1),
(3, 'Sylhet Student Rally', 'A rally by students in Sylhet demanding better hostel facilities and campus security.', '2024-07-05', 7),
(4, 'Rajshahi University Sit-In', 'A peaceful sit-in demanding an increase in scholarships for underprivileged students.', '2024-07-08', 9),
(5, 'March to the Parliament', 'Students marched to the Parliament building in Dhaka to deliver their list of demands.', '2024-07-10', 2),
(6, 'Social Media Awareness Campaign', 'Students launched an online campaign to raise awareness about their issues using #FairEducation2024.', '2024-07-12', 8),
(7, 'University-Wide Strike', 'Students at multiple universities boycotted classes to protest against fee hikes.', '2024-07-14', 14),
(8, 'Peaceful Protest at Shahbagh', 'Students gathered at Shahbagh to demand action against corruption in education institutions.', '2024-07-16', 1),
(9, 'Candlelight Vigil for Education Reform', 'Students held a vigil to commemorate those affected by education inequality.', '2024-07-18', 1),
(10, 'Rural Education Solidarity March', 'Urban students marched to rural areas to highlight disparities in education quality.', '2024-07-20', 19),
(11, 'Meeting with University Chancellors', 'Student leaders met with university chancellors to discuss reforms.', '2024-07-22', 2),
(12, 'Protest Song Performance', 'Students organized a cultural event to share protest songs and poetry.', '2024-07-23', 20),
(13, 'Media Forum for Education Rights', 'A discussion with journalists to highlight student issues.', '2024-07-25', 10),
(14, 'Scholarship Awareness Drive', 'Students distributed flyers about the need for more government scholarships.', '2024-07-27', 14),
(15, 'Education for All March', 'A protest highlighting the lack of access to education for marginalized communities.', '2024-07-28', 18),
(16, 'Dhaka University Hunger Strike', 'A hunger strike by students demanding immediate government action.', '2024-07-29', 1),
(17, 'Legal Aid Camp for Protesters', 'Law students provided legal assistance to detained protesters.', '2024-07-30', 16),
(18, 'Tech for Protest Coordination', 'Students used apps and digital tools to coordinate their movements.', '2024-07-30', 18),
(19, 'Statewide Student Coalition Meeting', 'A meeting to unify demands across all protesting universities.', '2024-07-31', 9),
(20, 'Memorial Rally for Injured Protesters', 'Students held a rally in honor of those injured during police crackdowns.', '2024-07-31', 1);
GO
INSERT INTO Arrest VALUES
(1, 'Participation in unauthorized protest', '48 hours', 9, 1),
(2, 'Disrupting public order during campus occupation', '72 hours', 4, 2),
(3, 'Organizing an unauthorized rally', '96 hours', 9, 3),
(4, 'Obstructing traffic during the march to Parliament', '48 hours', 1, 5),
(5, 'Distributing protest materials without permission', '24 hours', 13, 6),
(6, 'Inciting unrest through public speeches', '72 hours', 6, 8),
(7, 'Violating curfew during candlelight vigil', '48 hours', 9, 9),
(8, 'Disrupting university operations during a strike', '36 hours', 4, 7),
(9, 'Defying police orders during hunger strike', '72 hours', 1, 16),
(10, 'Damaging public property during a solidarity march', '96 hours', 14, 10),
(11, 'Resisting arrest at a peaceful protest', '48 hours', 11, 12),
(12, 'Unauthorized use of campus facilities for protest activities', '24 hours', 19, 2),
(13, 'Blocking roads during rural education march', '48 hours', 14, 15),
(14, 'Using social media to organize protests without a permit', '36 hours', 7, 18),
(15, 'Clashing with authorities during a memorial rally', '72 hours', 19, 20),
(16, 'Engaging in an unlicensed media forum', '24 hours', 10, 13),
(17, 'Alleged vandalism during education for all march', '96 hours', 14, 15),
(18, 'Illegal gathering during strike coordination meeting', '24 hours', 9, 19),
(19, 'Violating restrictions at protest song event', '24 hours', 11, 12),
(20, 'Participating in a banned student coalition meeting', '48 hours', 13, 19);
go
INSERT INTO Injuries VALUES
(1, 'Minor', 9, 1), 
(2, 'Moderate', 4, 2), 
(3, 'Severe', 13, 3), 
(4, 'Moderate', 11, 5),
(5, 'Minor', 6, 6), 
(6, 'Severe', 1, 8),
(7, 'Minor', 9, 9),
(8, 'Moderate', 4, 7),
(9, 'Severe', 14, 10),
(10, 'Moderate', 19, 16),
(11, 'Minor', 18, 18), 
(12, 'Severe', 13, 19),
(13, 'Minor', 10, 13),
(14, 'Moderate', 7, 18),
(15, 'Minor', 11, 12),
(16, 'Severe', 19, 20), 
(17, 'Moderate', 6, 15), 
(18, 'Minor', 9, 14), 
(19, 'Severe', 4, 16),
(20, 'Moderate', 1, 19);
go
INSERT INTO Social_Media_Post VALUES
(1, 'Taslima Rahman', 'Facebook', '2024-07-01', 1),
(2, 'Arif Chowdhury', 'Twitter', '2024-07-03', 2),
(3, 'Farzana Islam', 'Instagram', '2024-07-05', 3),
(4, 'Rahim Ahmed', 'Facebook', '2024-07-08', 7),
(5, 'Maya Hossain', 'YouTube', '2024-07-10', 5),
(6, 'Shuvo Karim', 'Twitter', '2024-07-12', 6),
(7, 'Sadia Zaman', 'Facebook', '2024-07-14', 9),
(8, 'Junaid Khan', 'Instagram', '2024-07-16', 8),
(9, 'Rafiqul Islam', 'YouTube', '2024-07-18', 16),
(10, 'Nazia Haque', 'Twitter', '2024-07-20', 10),
(11, 'Hasan Mahmud', 'Facebook', '2024-07-22', 19),
(12, 'Rehana Jahan', 'Instagram', '2024-07-23', 12),
(13, 'Azim Uddin', 'YouTube', '2024-07-25', 13),
(14, 'Shamim Akhter', 'Twitter', '2024-07-27', 15),
(15, 'Nabila Sultana', 'Facebook', '2024-07-28', 19),
(16, 'Fahim Hasan', 'YouTube', '2024-07-29', 18),
(17, 'Samiha Rahman', 'Instagram', '2024-07-30', 14),
(18, 'Tanvir Alam', 'Twitter', '2024-07-30', 18),
(19, 'Mahbuba Akter', 'Facebook', '2024-07-31', 20),
(20, 'Niaz Morshed', 'Instagram', '2024-07-31', 15);

go

INSERT INTO Media (Media_Id, Type, Description) VALUES
(1, 'Photo', 'Images of students marching with banners during the Nationwide Student March.'),
(2, 'Video', 'Footage of students occupying buildings at Dhaka University.'),
(3, 'Photo', 'Pictures of the large gathering at the Sylhet Student Rally.'),
(4, 'Audio', 'Recordings of speeches made during the University-Wide Strike.'),
(5, 'Video', 'Clips showing the student march to the Parliament building.'),
(6, 'Graphic', 'Social media graphics promoting #FairEducation2024.'),
(7, 'Photo', 'Images of candlelight vigil participants holding signs.'),
(8, 'Video', 'Drone footage of the Shahbagh protest.'),
(9, 'Photo', 'Images of students on hunger strike at Dhaka University.'),
(10, 'Video', 'Clashes between students and police during the Rural Education Solidarity March.'),
(11, 'Graphic', 'Illustrations shared online to support the Statewide Student Coalition Meeting.'),
(12, 'Photo', 'Cultural performances during the Protest Song Performance event.'),
(13, 'Audio', 'Recording of the panel discussion at the Media Forum for Education Rights.'),
(14, 'Video', 'Footage of protesters marching during the Education for All March.'),
(15, 'Photo', 'Behind-the-scenes images from the Scholarship Awareness Drive.'),
(16, 'Video', 'Highlights from the Protest Coordination meeting.'),
(17, 'Graphic', 'Infographics showing student demands and statistics.'),
(18, 'Photo', 'Images of injuries sustained during the Memorial Rally for Injured Protesters.'),
(19, 'Audio', 'Protesters chanting slogans during the hunger strike.'),
(20, 'Video', 'Compilation of events from the July 2024 student protests.');

INSERT INTO Medical_Facility VALUES
(1, 'Dhaka Medical College Hospital', 1000, 1),
(2, 'Bangabandhu Sheikh Mujib Medical University', 1200, 1),
(3, 'Sylhet MAG Osmani Medical College Hospital', 800, 7),
(4, 'Rajshahi Medical College Hospital', 750, 9),
(5, 'Chittagong Medical College Hospital', 900, 3),
(6, 'Kurigram Sadar Hospital', 500, 11),
(7, 'Barisal Sher-e-Bangla Medical College Hospital', 600, 12),
(8, 'Khulna Medical College Hospital', 700, 13),
(9, 'National Institute of Traumatology and Orthopedic Rehabilitation', 450, 1),
(10, 'Shaheed Suhrawardy Medical College Hospital', 850, 1),
(11, 'Sir Salimullah Medical College Hospital', 700, 1),
(12, 'Rangpur Medical College Hospital', 750, 15),
(13, 'Cumilla Medical College Hospital', 650, 4),
(14, 'Noakhali General Hospital', 500, 6),
(15, 'Faridpur Medical College Hospital', 550, 10),
(16, 'Mymensingh Medical College Hospital', 800, 5),
(17, 'Pabna General Hospital', 400, 14),
(18, 'Tangail General Hospital', 600, 8),
(19, 'Dinajpur Medical College Hospital', 700, 17),
(20, 'National Heart Foundation Hospital', 300, 1);
go
INSERT INTO Protest VALUES
(1, 9, 1, 5000),
(2, 4, 1, 3000),
(3, 13, 7, 2000),
(4, 11, 3, 1500),
(5, 1, 1, 8000),
(6, 6, 6, 1000),
(7, 9, 1, 4000),
(8, 14, 1, 2500),
(9, 19, 11, 3500),
(10, 7, 3, 3000),
(11, 18, 1, 1200),
(12, 13, 9, 1500),
(13, 10, 4, 1000),
(14, 11, 5, 2000),
(15, 14, 15, 4500),
(16, 4, 10, 1800),
(17, 1, 1, 6000),
(18, 9, 8, 2200),
(19, 6, 17, 2800),
(20, 14, 1, 5000);
go
INSERT INTO Protest VALUES
(21, 22, 1, 5000),
(22, 24, 1, 3000),
(23, 23, 7, 2000),
(24, 21, 3, 1500)

INSERT INTO Event_In_Media  VALUES
(1, 1), 
(1, 20), 
(2, 2), 
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 4), 
(8, 8), 
(9, 7), 
(10, 10), 
(11, 11),
(12, 12), 
(13, 13), 
(14, 6), 
(15, 14),
(16, 9), 
(17, 16), 
(18, 17), 
(19, 11), 
(20, 18);

--list of people
select * from people

--list of Location
select * from Location

--list of Organization
select * from Organization

--list of Event
select * from Event

--list of Arrest
select * from Arrest

--list of Injuries
select * from Injuries

--list of Social_Media_Post
select * from Social_Media_Post

--list of Media
select * from Media

--list of Medical_Facility
select * from Medical_Facility

--list of Protest
select * from Protest

--list of Event_In_media
select * from Event_In_media

-- Count the total number of injuries by severity.
SELECT Severity, COUNT(*) AS Total_Injuries
FROM Injuries
GROUP BY Severity;

--Find the total number of arrests made during the protests
SELECT COUNT(*) AS TotalArrests
FROM Arrest;

 --Combine lists of people who were either arrested or injured during the protests
SELECT Name
FROM People
WHERE P_Id IN (SELECT P_Id FROM Injuries)
UNION
SELECT Name
FROM People
WHERE P_Id IN (SELECT P_Id FROM Arrest);

 --Find people who participated in protests and were also injured during events
SELECT P_Id
FROM Protest
INTERSECT
SELECT P_Id
FROM Injuries;

--List all names of locations where events occurred or where medical facilities are available
SELECT Name
FROM Location
WHERE Location_Id IN (SELECT Location_Id FROM Event)
UNION
SELECT Name
FROM Location
WHERE Location_Id IN (SELECT Location_Id FROM Medical_Facility);

--List protests ordered by the number of participants in descending order.
SELECT Protest_Id, Event_Id, Number_of_Participants
FROM Protest
ORDER BY Number_of_Participants DESC;

--Find people involved in more than 2 arrests
SELECT P_Id, COUNT(Arrest_Id) AS Total_Arrests
FROM Arrest
GROUP BY P_Id
HAVING COUNT(Arrest_Id) > 2;

--List all events that occurred in Dhaka.
SELECT E.Name, E.Date, L.Name AS LocationName
FROM Event E, Location L
WHERE E.Location_id = L.Location_id
AND L.District = 'Dhaka';

-- Get a list of all protests led by students
SELECT Pe.Name,P.Protest_Id
FROM People Pe, Protest P
WHERE Pe.P_id = P.P_id
 AND Pe.Role = 'Student';

--Create a view to combine events held in Dhaka and Chittagong
CREATE VIEW DhakaAndChittagongEvents AS
SELECT Name, Date
FROM Event
WHERE Location_id IN (SELECT Location_id FROM Location WHERE District = 'Dhaka')
UNION
SELECT Name, Date
FROM Event
WHERE Location_id IN (SELECT Location_id FROM Location WHERE District = 'Chittagong');

--TO see the view:
SELECT * FROM DhakaAndChittagongEvents;

--View for Event Details

CREATE VIEW View_Event_Details AS
SELECT E.Event_id, E.Name AS Event_Name, E.Description, E.Date, L.Name AS Location_Name
FROM Event E, Location L
WHERE E.Location_id = L.Location_id;

--TO see the view:
SELECT * FROM View_Event_Details;