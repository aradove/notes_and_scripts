### Christians favvis: 
http://www.yolinux.com/TUTORIALS/ClearcaseCommands.html

### A bigger cheat sheet
https://www.ibm.com/developerworks/rational/library/836-pdf.pdf

### Config specification
- Contains information about what you see in your view
- You may have an incorrect (according to you) view of the files, for example not viewing the latest version
	- To reset:
		``` § Xclearcase -> view -> config spec -> display/edit/...```

### Various settings commands
| Command        | description           |
| ------------- |:-------------:|
| ```ct setview view_name ``` | 	Change to your view, where setview view_name is your view. | 
| ```ct ls "filename" ``` | 	See which version we have of a file in our view | 
| ```ct ls | 	See which version we have of all rules according to our rules.  | 
| ```ct lsvtree -g "filename"	``` | Gui with file history, branches, etc. | 
| ```ct catcs	``` | See the rules for your view, your config-spec | 
| ```cleartool edcs	``` | Change rules for your view, your config-spec | 
| ```cleartool pwv	``` | Show what view you are in. | 
| ```xclearcase &	``` | Open a GUI for browsing in the VOB.  | 
| ```ct unco "filename"	``` | Uncheckout  / Remove the checkout q  | 
| ```ct mklbtype -nc "labelname"	``` | Skapar en label som man kan använda på filer.  | 
| ```ct find . -version "lbtype (LABEL_TO_FIND)" -print ``` |  	# Sök efter element med label LABEL_TO_FIND | 
| ```ct mklabel LABEL_TO_FIND . Makefile.am configure.ac .........	``` | Lägg på label på filer | 


### Tips and tricks
When using ```ct lsvtree -g "filename"``` on can select any version to copy the filename path to that specific version to the clipboard.

### Simple edit of file
| Command        | description           |
| ------------- |:-------------:|
| ```ct checkout "filename"	 ``` | Creates a new version of a file, so you can edit the file. |
| ```ct checkin "filename"	 ``` | Checks in the file, i.e. pushing it to the file history. |
| ```cleartool unco "filename"	 ``` | Undo checkout |

### Checkout flags
```-unr```:	Unreserved. Other people can edit the file you have checked out.  
```-nc```: 	No comments

### Putting a file under version control
To put a file under ClearCase control you must first check-out the directory that will be containing the file, issue the command to tell ClearCase to put the file under version control, and then check-in the directory containing the new file. Here are commands to perform these steps:
```
  cleartool co thedirectory  
	cleartool mkelem thefile  
	cleartool ci thedirectory
  ```

### Deleting elements
To remove an element you should use the cleartool rmname command. This command removes the name of the specified element from the directory in which it is contained. Similar to placing an element under ClearCase control, you must first check-out the directory containing the element to be removed, do the cleartool rmname of the element, and then check-in the new version of the directory. Here is an example:
```
cleartool co thedirectory   
cleartool rmname anelement  
cleartool ci thedirectory  
```

### History
``` cleartool lsh "name"```:	See change history of a file/directory
