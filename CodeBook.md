
The R scrip cerates two independent tidy data sets: **“mydata”** and **“sum_data”**.
The variable “mydata” contains the merged and cleared up data.
The variable “sum_data” contains the average of each variable for each activity and each subject. 

The R scrip steps are the following:<br/>
<ol>
<li>Set working directory – (data files are in the working directory)
<li>Read the data from different files in different tables. The table names are:
      <ul>
        <li>sub_tr : "subject_train.txt"
        <li>x_tr : "x_train.txt"
        <li>y_tr : "y_train.txt"
        <li>sub_test :  "subject_test.txt"
        <li>x_test :  "x_test.txt"
        <li>y_test :  "y_test.txt"
        <li>features :  "features.txt"
        <li>activity_labels :  "activity_labels.txt"
      </ul>

<li>Merge tables of the two datasets

<li>Cive descriptive activity names to name the activities, the measurements variables  

<li>Keep only columns with "mean" or "std" in their name
<li>Create data set with the average of each variable for each activity  
<li>Write “sum_data”  in file
</ol>
