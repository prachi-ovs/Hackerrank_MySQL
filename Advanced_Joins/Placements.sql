SELECT ft.StudentName
FROM (SELECT fr.ID AS StudentID, fr.Name AS StudentName, fr.StudentsSalary AS StudentsPackage, fr.FriendID AS FriendsID, pkg.Salary AS FriendsPackage
    FROM Packages pkg
    JOIN (SELECT st.ID AS ID, st.Name AS Name, st.PersonsSalary AS StudentsSalary, f.Friend_ID AS FriendID
         FROM Friends f
         JOIN (SELECT s.ID AS ID, s.Name AS Name, p.Salary AS PersonsSalary
               FROM Students s
               JOIN Packages p ON s.ID = p.ID) st ON f.ID = st.ID) AS fr ON pkg.ID = fr.FriendID) AS ft
WHERE ft.StudentsPackage < ft.FriendsPackage
ORDER BY ft.FriendsPackage ASC;
    

