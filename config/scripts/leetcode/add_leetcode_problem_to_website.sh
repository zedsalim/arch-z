#!/bin/bash

# Prompt the user for the problem name
read -p "Enter the name of the problem: " problem_name

# Automatically generate the LeetCode problem link
problem_link="https://leetcode.com/problems/$(echo "$problem_name" | tr ' ' '-' | tr '[:upper:]' '[:lower:]')/"

# Automatically generate the GitHub solution link
solution_link="https://github.com/zedsalim/leetcode-solutions/tree/main/$(echo "$problem_name" | tr ' ' '-' | tr '[:upper:]' '[:lower:]').c"

# Prompt the user for the difficulty level
echo "Select the difficulty level:"
echo "1 - Easy"
echo "2 - Medium"
echo "3 - Hard"
read -p "Enter the number corresponding to the difficulty level: " difficulty_number

# Map the difficulty number to the actual difficulty
case $difficulty_number in
    1)
        difficulty="Easy"
        ;;
    2)
        difficulty="Medium"
        ;;
    3)
        difficulty="Hard"
        ;;
    *)
        difficulty="Unknown"
        ;;
esac

# Prepare the new table row
new_row="<tr>\n"
new_row+="    <td><a href=\"$problem_link\" target=\"_blank\">$problem_name</a></td>\n"
new_row+="    <td><a href=\"$solution_link\" target=\"_blank\">Link</a></td>\n"
new_row+="    <td>$difficulty</td>\n"
new_row+="</tr>"

# Insert the new row into the HTML file
sed -i "/<!-- Add more problems here -->/i $new_row" /home/zed/Documents/github/zedsalim/leetcode/index.html

cd  /home/zed/Documents/github/zedsalim/leetcode
git add .
git commit -m "adding new problem"
git push
