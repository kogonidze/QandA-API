CREATE TABLE dbo.Question(
	QuestionId int IDENTITY(1,1) NOT NULL,
	Title nvarchar(100) NOT NULL,
	Content nvarchar(max) NOT NULL,
	UserId nvarchar(150) NOT NULL,
	UserName nvarchar(150) NOT NULL,
	Created datetime2(7) NOT NULL,
 CONSTRAINT PK_Question PRIMARY KEY CLUSTERED 
(
	QuestionId ASC
)
) 
GO

CREATE TABLE dbo.Answer(
	AnswerId int IDENTITY(1,1) NOT NULL,
	QuestionId int NOT NULL,
	Content nvarchar(max) NOT NULL,
	UserId nvarchar(150) NOT NULL,
	UserName nvarchar(150) NOT NULL,
	Created datetime2(7) NOT NULL,
 CONSTRAINT PK_Answer PRIMARY KEY CLUSTERED 
(
	AnswerId ASC
)
) 
GO
ALTER TABLE dbo.Answer  WITH CHECK ADD  CONSTRAINT FK_Answer_Question FOREIGN KEY(QuestionId)
REFERENCES dbo.Question (QuestionId)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE dbo.Answer CHECK CONSTRAINT FK_Answer_Question
GO

SET IDENTITY_INSERT dbo.Question ON 
GO
INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(1, 'Why should I learn TypeScript?', 
		'TypeScript seems to be getting popular so I wondered whether it is worth my time learning it? What benefits does it give over JavaScript?',
		'1',
		'bob.test@test.com',
		'2019-05-18 14:32')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(2, 'Which state management tool should I use?', 
		'There seem to be a fair few state management tools around for React - React, Unstated, ... Which one should I use?',
		'2',
		'jane.test@test.com',
		'2019-05-18 14:48')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(3, 'How to set interface version in inetlab library?', 
		'I am using the SMPP library inetlab for .NET to send SMS messages, I need to change the interface version for the SmppClient class, the interface version should be v3.3 or v3.4 but the SmppClient class property to set the version must take byte? I could not find any documentation on how to implement the code on the inetlab website so I decided to ask the question on StackOverflow to get a fast answer.',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 14:48')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(4, 'How to copy a canvas on top of another canvas?', 
		'Given a reference to a <canvas> element, I want to create a copy to handle operations like drawing a square; the idea being the user draws the square onto the canvas, instead while they are defining the dimensions with their mouse, the potential square is constantly drawn on the temp canvas, and cleared each frame as they update the size/position. Only when they release the mouse, we clear the temp canvas and write the described square to the original canvas. But first, I need to simply create that temp canvas; is there a way to call cloneNode() and modify the clone in such a way that it sits on top of the original canvas element? Preferably in such a way that it is resilient to changes in the original canvas size or position.',
		'1',
		'bob.test@test.com',
		'2021-01-18 14:49')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(5, 'How do I calculate someones age based on a DateTime type birthday?', 
		'Given a DateTime representing a persons birthday, how do I calculate their age in years?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 14:49')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(6, 'When should I use a struct rather than a class in C#?', 
		'When should you use struct and not class in C#? My conceptual model is that structs are used in times when the item is merely a collection of value types. A way to logically hold them all together into a cohesive whole.',
		'10',
		'vasili.kotok@test.com',
		'2019-05-18 14:56')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(7, 'When can a null check throw a NullReferenceException?', 
		'I know this might seem impossible at first and it seemed that way to me at first as well, but recently I have seen exactly this kind of code throw a NullReferenceException, so it is definitely possible.
Unfortunately, there are pretty much no results on Google that explain when code like foo == null can throw a NRE, which can make it difficult to debug and understand why it happened. So in the interest of documenting the possible ways this seemingly bizzare occurance could happen:
In what ways can this code foo == null throw a NullReferenceException?',
		'10',
		'vasili.kotok@test.com',
		'2019-05-18 14:57')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(8, 'How can I cast int to enum?', 
		'How can an int be cast to an enum in C#?',
		'10',
		'vasili.kotok@test.com',
		'2019-05-18 14:57')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(9, 'How can I represent an Enum in Python?', 
		'I am mainly a C# developer, but I am currently working on a project in Python. How can I represent the equivalent of an Enum in Python?',
		'10',
		'vasili.kotok@test.com',
		'2019-05-18 14:58')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(10, 'different dash in Gnome 3.36.8', 
		'recently upgrade to Ubuntu 20.04.1 (from 18.) and then Gnome 3.36.8; i got a dash different than other same set-up in my environment: File icon is a blue drawer, Ubuntu Help is a life buoy, that's no problem but what's bothering is Files duplicating its icon when mounting another partition (icon like a lego piece in a frame) even if the partition is in a Files tab in the main icon; Gnome 3.36.8 has different flavors ? Thanks for your help',
		'10',
		'vasili.kotok@test.com',
		'2019-05-18 14:58')



GO
SET IDENTITY_INSERT dbo.Question OFF
GO

SET IDENTITY_INSERT dbo.Answer ON 
GO
INSERT INTO dbo.Answer(AnswerId, QuestionId, Content, UserId, UserName, Created)
VALUES(1, 1, 'To catch problems earlier speeding up your developments', '2', 'jane.test@test.com', '2019-05-18 14:40')

INSERT INTO dbo.Answer(AnswerId, QuestionId, Content, UserId, UserName, Created)
VALUES(2, 1, 'So, that you can use the JavaScript features of tomorrow, today', '3', 'fred.test@test.com', '2019-05-18 16:18')

INSERT INTO dbo.Answer(AnswerId, QuestionId, Content, UserId, UserName, Created)
VALUES(3, 3, 'If I could choose between a paid library whose creators have put more work in obfuscating their binaries than into their documentation and any of the available free libraries, Id pick the latter anytime.', '3', 'fred.test@test.com', '2021-01-19 16:18')

INSERT INTO dbo.Answer(AnswerId, QuestionId, Content, UserId, UserName, Created)
VALUES(4, 4, 'Positioning one element above another isn’t really canvas-specific. But them both into a common wrapper element, and position your clone absolutely within that.', '10', 'vasili.kotok@test.com', '2021-01-19 16:18')

INSERT INTO dbo.Answer(AnswerId, QuestionId, Content, UserId, UserName, Created)
VALUES(5, 4, '“resilient to changes in the original canvas size” - the actual, intrinsic canvas size, or the display size in case the canvas element dimensions get manipulated via CSS? Those are two completely different things to begin with.', '3','fred.test@test.com', '2021-01-19 16:21')

INSERT INTO dbo.Answer(AnswerId, QuestionId, Content, UserId, UserName, Created)
VALUES(6, 5, 'what all of the answers so far have missed is that it depends where the person was born and where they are right now.', '2', 'jane.test@test.com', '2021-01-19 16:31')

INSERT INTO dbo.Answer(AnswerId, QuestionId, Content, UserId, UserName, Created)
VALUES(7, 5, 'Just convert the time of now + birth into GMT/UTC, age is only a relative value, hence timezones are irrelevant. For determining the users current timezone, you can use GeoLocating.', '3','fred.test@test.com', '2021-01-19 16:33')

INSERT INTO dbo.Answer(AnswerId, QuestionId, Content, UserId, UserName, Created)
VALUES(8, 5, 'If we are taking into consideration @Yaur suggestion of cross-timezone calculations, should Day Light Saving Time affect the calculation in any manner?', '4', 'viktor.semenov@test.com', '2021-01-19 17:01')

INSERT INTO dbo.Answer(AnswerId, QuestionId, Content, UserId, UserName, Created)
VALUES(9, 5, 'Note that for someone less than one year old, their age is given in days, weeks, or months. The transition time for the units may be domain-specific.', '5', 'andrei.vorontsov@test.com', '2021-01-19 17:03')

INSERT INTO dbo.Answer(AnswerId, QuestionId, Content, UserId, UserName, Created)
VALUES(10, 5, 'A scenario all the answers fail to take into account: my Great Grandad was born 29th February 1928. He died the year before last, just 13 months short of his 23rd birthday.', '6', 'muhammad.hewedy@test.com', '2021-01-19 17:11')

GO
SET IDENTITY_INSERT dbo.Answer OFF 
GO