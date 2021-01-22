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
		'2021-01-18 14:56')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(7, 'When can a null check throw a NullReferenceException?', 
		'I know this might seem impossible at first and it seemed that way to me at first as well, but recently I have seen exactly this kind of code throw a NullReferenceException, so it is definitely possible.
Unfortunately, there are pretty much no results on Google that explain when code like foo == null can throw a NRE, which can make it difficult to debug and understand why it happened. So in the interest of documenting the possible ways this seemingly bizzare occurance could happen:
In what ways can this code foo == null throw a NullReferenceException?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 14:57')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(8, 'How can I cast int to enum?', 
		'How can an int be cast to an enum in C#?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 14:57')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(9, 'How can I represent an Enum in Python?', 
		'I am mainly a C# developer, but I am currently working on a project in Python. How can I represent the equivalent of an Enum in Python?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 14:58')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(10, 'Different dash in Gnome 3.36.8', 
		'recently upgrade to Ubuntu 20.04.1 (from 18.) and then Gnome 3.36.8; i got a dash different than other same set-up in my environment: File icon is a blue drawer, Ubuntu Help is a life buoy, that is no problem but what is bothering is Files duplicating its icon when mounting another partition (icon like a lego piece in a frame) even if the partition is in a Files tab in the main icon; Gnome 3.36.8 has different flavors ? Thanks for your help',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 14:58')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(11, 'How do I undo the most recent local commits in Git?', 
		'I accidentally committed the wrong files to Git, but didnt push the commit to the server yet. How can I undo those commits from the local repository?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:01')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(12, 'How do I delete a Git branch locally and remotely?', 
		'I want to delete a branch both locally and remotely. What should I do differently to successfully delete the remotes/origin/bugfix branch both locally and remotely?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:03')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(13, 'What is the difference between "git pull" and "git fetch"?', 
		'What are the differences between git pull and git fetch?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:03')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(14, 'What does the “yield” keyword do?', 
		'What is the use of the yield keyword in Python, and what does it do?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:03')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(15, 'What is the correct JSON content type?', 
		'I have been messing around with JSON for some time, just pushing it out as text and it hasnt hurt anybody (that I know of), but Id like to start doing things properly. I have seen so many purported "standards" for the JSON content type, but which one is correct, or best?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:04')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(16, 'How do I undo "git add" before commit?', 
		'I mistakenly added files to Git using the command: git add myfile.txt I have not yet run git commit. Is there a way to undo this, so these files wont be included in the commit?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:04')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(17, 'How do I rename a local Git branch?', 
		'I dont want to rename a remote branch, as described in Rename master branch for both local and remote Git repositories. How can I rename a local branch which hasnt been pushed to a remote branch? In case you need to rename remote branch as well: How do I rename both a Git local and remote branch name',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:04')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(18, 'How can I remove a specific item from an array?', 
		'I have an array of numbers and Im using the .push() method to add elements to it. Is there a simple way to remove a specific element from an array? Im looking for the equivalent of something like: array.remove(number);
I have to use cre JavaScript. Frameworks are not allowed.',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:04')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(19, 'What and where are the stack and heap?', 
		'Programming language books explain that value types are created on the stack, and reference types are created on the heap, without explaining what these two things are. I havent read a clear explanation of this. I understand what a stack is. But, 
1. Where and what are they (physically in a real computers memory)?
2. To what extent are they controlled by the OS or language run-time?
3. What is their scope?
4. What determines the size of each of them?
5. What makes one faster?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:04')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(20, 'Can comments be used in JSON?', 
		'Can I use comments inside a JSON file? If so, how?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:05')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(21, 'How do I check if an element is hidden in jQuery?', 
		'Is it possible to toggle the visibility of an element, using the functions .hide(), .show() or .toggle()? How would you test if an element is visible or hidden?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:05')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(22, 'What does “use strict” do in JavaScript, and what is the reasoning behind it?', 
		'What is "use strict"; all about, what does it imply, and is it still relevant? Do any of the current browsers respond to the "use strict"; string or is it for future use?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:05')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(23, 'How do I redirect to another webpage?', 
		'How can I redirect the user from one page to another using jQuery or pure JavaScript?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:06')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(24, 'How to modify existing, unpushed commit messages?', 
		'I wrote the wrong thing in a commit message. How can I change the message? The commit has not been pushed yet.',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:06')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(25, 'How do JavaScript closures work?', 
		'How would you explain JavaScript closures to someone with a knowledge of the concepts they consist of (for example functions, variables and the like), but does not understand closures themselves? I have seen the Scheme example given on Wikipedia, but unfortunately it did not help.',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:06')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(26, 'How to check whether a string contains a substring in JavaScript?', 
		'Usually I would expect a String.contains() method, but there doesnt seem to be one. What is a reasonable way to check for this?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:06')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(27, 'How to remove local (untracked) files from the current Git working tree?', 
		'How do you delete untracked local files from your current working tree?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:06')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(28, 'Is Java “pass-by-reference” or “pass-by-value”?', 
		'I always thought Java uses pass-by-reference. However, I have seen a couple of blog posts (for example, this blog) that claim that it isnt (the blog post says that Java uses pass-by-value). I dont think I understand the distinction they are making. What is the explanation?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:07')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(29, 'What is the difference between String and string in C#?', 
		'What are the guidelines for the use of each? And what are the differences?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:07')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(30, 'Does Python have a ternary conditional operator?', 
		'If Python does not have a ternary conditional operator, is it possible to simulate one using other language constructs?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:08')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(31, 'What are metaclasses in Python?', 
		'In Python, what are metaclasses and what do we use them for?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:08')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(32, 'What is the difference between “px”, “dip”, “dp” and “sp”?', 
		'What is the difference between Android units of measure?

px
dip
dp
sp',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:08')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(33, 'How do I check whether a file exists without exceptions?', 
		'How do I check if a file exists or not, without using the try statement?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:10')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(34, 'How to make Git “forget” about a file that was tracked but is now in .gitignore?', 
		'There is a file that was being tracked by git, but now the file is on the .gitignore list. However, that file keeps showing up in git status after it is edited. How do you force git to completely forget about it?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:10')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(35, 'PUT vs. POST in REST', 
		'According to the HTTP/1.1 Spec: POST is used to create, That is, PUT is used to create or replace. So, which one should be used to create a resource? Or one needs to support both?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:11')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(36, 'How do I include a JavaScript file in another JavaScript file?', 
		'Is there something in JavaScript similar to @import in CSS that allows you to include a JavaScript file inside another JavaScript file?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:11')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(37, 'How to get the source directory of a Bash script from within the script itself?', 
		'How do I get the path of the directory in which a Bash script is located, inside that script? I want to use a Bash script as a launcher for another application. I want to change the working directory to the one where the Bash script is located, so I can operate on the files in that directory, like so:
$ ./application',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:12')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(38, 'How to execute a program or call a system command from Python?', 
		'How do you call an external command (as if Id typed it at the Unix shell or Windows command prompt) from within a Python script?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:12')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(39, 'How do I discard unstaged changes in Git?', 
		'How do I discard changes in my working copy that are not in the index?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:12')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(40, 'What is the most efficient way to deep clone an object in JavaScript?', 
		'What is the most efficient way to clone a JavaScript object? I have seen obj = eval(uneval(o)); being used, but that is non-standard and only supported by Firefox. I have done things like obj = JSON.parse(JSON.stringify(o)); but question the efficiency.
I have also seen recursive copying functions with various flaws.
I am surprised no canonical solution exists.',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:12')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(41, 'What is the maximum length of a URL in different browsers?', 
		'What is the maximum length of a URL in different browsers? Does it differ among browsers? Is a maximum URL length part of the HTTP specification?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:13')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(42, 'How to resolve merge conflicts in Git repository?', 
		'I want to resolve merge conflicts in my Git repository. How to do that ?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:13')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(43, 'What is the difference between using “let” and “var”?', 
		'ECMAScript 6 introduced the let statement. I have heard that it is described as a local variable, but I am still not quite sure how it behaves differently than the var keyword.
What are the differences?. When should let be used instead of var?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:14')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(44, 'For-each over an array in JavaScript', 
		'How can I loop through all the entries in an array using JavaScript? I thought it was something like this: forEach(instance in theArray)
Where theArray is my array, but this seems to be incorrect.',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:14')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(45, 'What is the difference between “INNER JOIN” and “OUTER JOIN”?', 
		'Also how do LEFT JOIN, RIGHT JOIN and FULL JOIN fit in?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:15')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(46, 'How can I reset or revert a file to a specific revision?', 
		'I have made some changes to a file which has been committed a few times as part of a group of files, but now want to reset/revert the changes on it back to a previous version.
I have done a git log along with a git diff to find the revision I need, but just have no idea how to get the file back to its former state in the past.',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:15')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(47, 'How to validate an email address in JavaScript?', 
		'Is there a regular expression to validate an email address in JavaScript?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:16')


INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(48, 'What is the difference between a URI, a URL and a URN?', 
		'People talk about URLs, URIs, and URNs as if they are different things, but they look the same to the naked eye. What are the distinguishable differences between them?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:17')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(49, 'How can I add an empty directory to a Git repository?', 
		'How can I add an empty directory (that contains no files) to a Git repository?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:18')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(50, 'How to create a GUID / UUID?', 
		'I am trying to create globally-unique identifiers in JavaScript. I am not sure what routines are available on all browsers, how "random" and seeded the built-in random number generator is, etc. The GUID / UUID should be at least 32 characters and should stay in the ASCII range to avoid trouble when passing them around.',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:19')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(51, 'How can I determine the URL that a local Git repository was originally cloned from?', 
		'I pulled a project from GitHub a few days ago. I have since discovered that there are several forks on GitHub, and I neglected to note which one I took originally. How can I determine which of those forks I pulled?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:19')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(52, 'How to clone all remote branches in Git?', 
		'I have a master and a development branch, both pushed to GitHub. I have cloned, pulled, and fetched, but I remain unable to get anything other than the master branch back. I am sure I am missing something obvious, but I have read the manual and I am getting no joy at all.',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:19')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(53, 'How do you get a timestamp in JavaScript?', 
		'How can I get a timestamp in JavaScript? Something similar to Unix timestamp, that is, a single number that represents the current time and date. Either as a number or a string.',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:21')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(54, 'How do I exit the Vim editor?', 
		'I am stuck and cannot escape. It says: "type :quit<Enter> to quit VIM" But when I type that it simply appears in the object body.',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:23')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(55, 'What exactly is RESTful programming?', 
		'What exactly is RESTful programming?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:23')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(56, 'How do I update a GitHub forked repository?', 
		'I recently forked a project and applied several fixes. I then created a pull request which was then accepted. A few days later another change was made by another contributor. So my fork doesnt contain that change.
How can I get that change into my fork? Do I need to delete and re-create my fork when I have further changes to contribute? Or is there an update button?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:24')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(57, 'How do you close/hide the Android soft keyboard using Java?', 
		'I have an EditText and a Button in my layout.
After writing in the edit field and clicking on the Button, I want to hide the virtual keyboard when touching outside the keyboard. I assume that this is a simple piece of code, but where can I find an example of it?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:24')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(58, 'Squash my last X commits together using Git', 
		'How can I squash my last X commits together into one commit using Git?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:25')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(59, 'How can I check if a directory exists in a Bash shell script?', 
		'What command can be used to check if a directory exists or not, within a Bash shell script?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:25')

INSERT INTO dbo.Question(QuestionId, Title, Content, UserId, UserName, Created)
VALUES(60, 'What are the differences between a HashMap and a Hashtable in Java?', 
		'What are the differences between a HashMap and a Hashtable in Java? Which is more efficient for non-threaded applications?',
		'10',
		'vasili.kotok@test.com',
		'2021-01-18 15:26')

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