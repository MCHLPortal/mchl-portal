# mchl-portal

#### Description:
MCHLPortal is a web information system created for the preschool department of Montessori Children's House of Learning. Contrary to other applications of the same nature, this web application is primarily intended for parents to monitor the academic progress of their children as the latter are assumed to be not knowledgeable on the Internet. Amongst the features offered are the notification of news, events and payments obligations as well as the viewing of report cards.

#### Notes:
1. Make sure to run `rake db:seed` to insert the admin account and the default values for the assessment table.
   * The username and password for the admin account are **efernandez_jusa** and **e20140287fernandez**, respectively.
2. When creating a new student/teacher record:
   * The ID number follows the format **year + four-digit number (padded with 0s if below 1000)** prefixed by **s** if a student and **e** if a teacher such that student **Jonas Petallo Concina** has an ID number **s20140603**.
   * The username follows the format **last name (without any space) + underscore + first three letters of first name + first letter of middle name** prefixed by **e** only if a teacher such that student **Jonas Petallo Concina**'s username is **concina_jonp** and teacher **Antonio Balido Closa**'s is **eclosa_antb**.
   * The password follows the format **ID number + last name (without any space)** such that student **Jonas Petallo Concina** with the ID number **s20140603** has **s20140603concina** as his password.
   
#### Members:
* Closa, Antonio B.
* Concina, Jonas P.
* Moreno, Monette Pearl I.
* Rabago, Helimar M.
