= Fist Tab = 
* Started with the Tabbed Application Wizard 
- This gives you two view controllers (First View Controller and Second View Controller) 
- Left side will allow you to enter runs
- Right side will let you list past runs
- Simplest storage? (SQL Lite?  A text file?)
- Drawing out a simple "how far did you run" screen.
- Note the duplication in the app delegates.

- Potential "tracking" addition

 ----- What does their app do?, what does our app do? -------

 - Their app displays the data, and sends messages to our map.  What if for instance...
   - We change from a text archive to SQL lite
   - We change from SQL lite to Core Data
   - We change from Core Data back to SQL lite
   - We start syncing to a web service

 - More importantly - how do our tests look?

 - KISS design - do our tests express our intent?  


- Three issues with templates
 - Your context says spec, should just have the class name
 - Your include path isnt right - at least according to AppCode.
    - Yeah its an appCode issue not a 
 - MacRunner is showing up under iOS now.
