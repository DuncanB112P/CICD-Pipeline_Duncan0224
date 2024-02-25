#This if statement will allow us to check if our website name matches in our index.html file_name.
#Conditional statements are case sensitive.

#Check for file_name starting in the root of directory for file_name named index.html
# start file_name path default at root directory and search all subdirectories
import os
file_name = "index.html"
expected_title = "HealthCare Hospital"

# traverse directory and subdirectories to find file_name
for root, dirs, file_names in os.walk("."):
    for name in file_names: 
        if name == file_name:
            print(os.path.join(root, name))
            # now check that the title of the html file_name matches the expected value
            with open(os.path.join(root, name), 'r') as f:
                html_content = f.read()
                if expected_title in html_content:
                    print("Website title matches expected value:", expected_title)
                else:
                    print("Website title did not match expected value:", expected_title)






