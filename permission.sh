echo "Name: Naishar Shah"
echo "Reg.No: 1947258"
while true
do
echo ""
echo ""
echo ""
echo ""
echo "1. Demonstrate the commands to change the ownership of a file."
echo "2. Demonstrate the commands to change the group of user"
echo "3. Demonstrate the recursive option to assign file permission."
echo "4. create a shell script (Permission.sh) to assign the file privileges at the time of creating a file based on the Roles as mentioned below. (Use switch case)"
echo "FILE		FILE PERMISSION"
echo "Administrator	R W X"
echo "Student		R – –"
echo "Faculty 	        R W –"
echo "5. shell script to group and compress the file based on their file extension."
echo "6. shell script to archive the files which are not accessed for past three months."
echo "7. Create a compressed file called Collection.tar and move all the files starting with a specific character to the directory Collection.tar"
echo "8. Compress the files from the current directory which consume more than 1GB"
echo "9. Group and compress the files based on their file permission.(For example compress the file with ‘read’ only/’read&write’/’read,write&execute’)"
echo "10. EXIT"
echo "Enter your choice"
read choice
case $choice in
   1) cd 
      cd /tmp
      echo "total files and their owners"
      ls -l
      echo "Enter the file name to change the owner"
      read file
      echo "enter new owner name"
      read owner
      sudo chown $owner $file
      echo "after change the owner of file"
      ls -l 
      ;;
   2) echo -n "Enter a group name to be created:"
      read group
      sudo groupadd $group
      echo -n "Enter username which will be made member of $group: "
      read user
      sudo usermod -a -G $group $user
      echo "$user is part of:"
      groups $user
      ;;
   3)echo "enter the directory name where you want create files"
     read dir
     mkdir $dir
     echo "Creating 10 files named test1.txt,test2.txt,......test10.txt"
     touch dir/test{1..10}.txt
     ls -l dir
     echo -n "Enter the absolute value of permission: "
     read per
     chmod -R $per dir 
     echo "after Permissions change: "
     ls -l dir 
     ;;
   4) echo "Enter file you want create and change the permission for that file"
      read file
      touch $file
      echo "1. Admin"
      echo "2. Student"
      echo "3. Faculty"
      echo -n "Enter your choice: "
      read ch
      case $ch in
         1)chmod 777 $file
           ;;
         2)chmod 444 $file
           ;;
         3)chmod 666 $file
           ;;
         *)echo "invalid choice"
           ;;
       esac
      ;;
   5) echo -n "Enter the directory name from which you wanna rtake files:"
      read dir
      ls $dir
      echo -n "enter the Zip file name you want to create:"
      read file
      echo -n "Enter extension:"
      read ext
      zip $file $dir/*$ext
      ls
      ;;
   6) echo "enter directory name from where you wanna chec file and zip"
      read d
      echo -n "enter the archived file name you want to create:"
      read zfile
      echo "archive files $zfile with the files which are not accessed for past three months"
      find . -atime +90 | zip -r $zfile $d 
      ll *.zip
      ;;
   7) echo "enter the character from which the file starts"
      read ch
      #echo enter the archived file name you want to create:"
      #read zfile
      tar cvf collection.tar $ch*
      ;;
   8)echo "enter directory name from where you wanna chec file and zip"
      read d
      echo -n "enter the archived file name you want to create:"
      read zfile
      find . -size +1G | zip -r $zfile $d
      ll *.zip
     ;;
   9)echo -n "enter the abosute value for permission"
     read p
     echo -n "enter the archived file name you want to create:"
      read zfile
     find -perm $p | zip -r $zfile . 
     ;;
   10) break
     ;;
   *) echo "Invalid Choice"
     ;;
esac
done
