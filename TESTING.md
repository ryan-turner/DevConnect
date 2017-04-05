### Who
Jeffrey Lipnick, Cassidy Haas, Ryan Turner, Dante Pasionek, Pierce Doogan


### Title
DevConnect

### Vision
Make Finding Groups Less Terrible

---
## Automated Tests




## User Acceptance Tests

Test 1
-
**Use case name**

    Create new user

**Description**

    Create a new user from the signup page
    
**Pre-conditions**

    Visitor can successfully fill out signup form
    
**Test steps**

    1. Navigate to signup page
    2. Fill out all form fields
    3. Click "Create User" button

**Expected result**

    New user should be created and user profile page is displayed
    
**Actual result**

    New user is created and user's profile is displayed
    
**Status (Pass/Fail)**

    Pass
    
**Notes**

    N/A
    
**Post-conditions**

    Matching algorithm is run and matches are displayed in the user profile


Test 2
-
**Use case name**

    Edit User Information

**Description**

    Let user edit their profile by click "Edit" link
    
**Pre-conditions**

    User has signed up and is on their profile page
    
**Test steps**

    1. Navigate to user profile page
    2. Scroll down to "Edit" link
    3. Click on "Edit" link
    4. Update profile information in form
    5. Click "Update User" button

**Expected result**

    User should be taken back to their profile page with the updated changes
    A success notification should be displayed
    
**Actual result**

    User is taken to their profile page with the changes
    A success notification is displayed above their profile information
    
**Status (Pass/Fail)**

    Pass
    
**Notes**

    N/A
    
**Post-conditions**

    The user's data has been updated in the database


Test 3
-
**Use case name**

    Add User to Group

**Description**

    Let user join group by clicking "Join" button in their profile matches
    
**Pre-conditions**

    User has signed up and is on their profile page
    
**Test steps**

    1. Navigate to user profile page
    2. Scroll down to "Group Matches" section
    3. Hover mouse over desired group
    4. Click on desired group

**Expected result**

    User should be added to group and a success notification displayed
    
**Actual result**

    Nothing happens when user clicks desired group
    
**Status (Pass/Fail)**

    Fail
    
**Notes**

    This feature has not been fully implemented yet
    
**Post-conditions**

    User has been added to chosen group in the database
    User is notified of successful addition


Test 4
-
**Use case name**

    About Page Navigation

**Description**

    Visitors can navigate to the About page
    
**Pre-conditions**

    Visitor has opened the DevConnect web application in their browser
    
**Test steps**

    1. Open DevConnect in browser
    2. Click on "About" button

**Expected result**

    Visitor should be taken to About page
    
**Actual result**

    Visitor is taken to About page
    
**Status (Pass/Fail)**

    Pass
    
**Notes**

    N/A
    
**Post-conditions**

    Visitor is on About page


Test 5
-
**Use case name**

    Users can login

**Description**

    Users can login to their profile
    
**Pre-conditions**

    User has already registered a profile and has their email and password
    
**Test steps**

    1. Navigate to Login page
    2. Enter email and password
    3. Click "Login" button

**Expected result**

    User should be taken to their profile page
    
**Actual result**

    Login button does not work
    
**Status (Pass/Fail)**

    Fail
    
**Notes**

    The login feature has not been implemented yet
    
**Post-conditions**

    User credentials are validated in database and they are logged into their account


