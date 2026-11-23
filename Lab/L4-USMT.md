### Exercise: Creating and customizing USMT XML files
### Task 1: Create a Config.xml file

CLIENT03
```
net use F: \\DC1\USMT
scanstate /i:migapp.xml /i:miguser.xml /genconfig:config.xml
```

```
component displayname="Shared Video" migrate="no"
component displayname="Shared Music" migrate="no"
component displayname="Shared Pictures" migrate="no"
```

### Task 2: Create a custom migration XML file

### Exercise: Capturing and restoring a user state by using the USMT
### Task 1: Create user state for a research user on the source computer

### Task 2: Capture user state from the source computer
```
Scanstate \\DC1\MigrationStore /i:migapp.xml /i:miguser.xml /i:folders.xml
/config:config.xml /o /efs:copyraw /ue:%computername%\LocalAdmin
```

### Task 3: Restore user state on the destination computer (CLIENT1)
```
Loadstate \\DC1\MigrationStore /i:migapp.xml /i:miguser.xml /i:folders.xml
/lac:P@ssw0rd /lae
```

### Task 4: Verify that user state migration is successful

