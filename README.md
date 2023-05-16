# roboshop-shell
Even if user is running script as normal user we should not run the script
It should notify as run as root user

Delete some lines 
- > Based on line numbers
    sed -e '1d' /etc/passwd -to delte file
    sed -i -e '5d' /etc/passwd- to modify 5th line(it will delete 5th file)
    sed -i -e '5d' passwd
-> string based delete
    sed -i -e '/nologin/ d' passwd

 **   sed -i -e '5d' -e '/nologin d' passwd --> (-e is used to tell multiple operations) **

Add some lines
-> Based on line number
    sed -i -e '1 a Hello' -e '/mongod/ a Hello world' passwd

->Modify(change) some line
    sed -i -e '2 c Hello Uniserv' -e '/centos/ c Hello Gallaxy' passwd

Delete some words
 sed -i -e 's|Hello||g'
 
Modify(substitute) some words
 sed -i -e 's|bin|BIN||g' passwd
 instead of | we can use as boundary with /,?,:,;,#,@
