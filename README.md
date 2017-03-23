# mchl-portal

#### Description:
MCHLPortal is a web information system created for the preschool department of Montessori Children's House of Learning. Contrary to other applications of the same nature, this web application is primarily intended for parents to monitor the academic progress of their children as the latter are assumed to be not knowledgeable on the Internet. Amongst the features offered are the notification of news, events and payments obligations as well as the viewing of report cards.

#### Notes:
1. Make sure to run `rake db:seed` to insert the admin account and the default values for the assessment table.
   * The username and password for the admin account are **efernandez_jusa** and **e20140287fernandez**, respectively.
2. When creating a new student/teacher record:
   * The username follows the format **last name (without any space) + underscore + first three letters of first name + first letter of middle name** such that **Jonas P. Concina**'s username is **concina_jonp**.
   * The password follows the format **ID number + last name (without any space)** prefixed by **e** if the account is a teacher and **s** if a student such that if **Jonas P. Concina** with the ID number **20140603** is a teacher, then his password is **e20140603concina** while **s20140603concina** if a student.
   
#### Members:
* Closa, Antonio B.
* Concina, Jonas P.
* Moreno, Monette Pearl I.
* Rabago, Helimar M.
