# Bash-Scripts
Different Bash Scripts for WEB scraping and Program Running


## Stock Follower
Stock_Follower is a bash script aimed to send the user an EMAIL every time a requested stock has gone down or up by 5%.

User must create a text file names “symbols.txt” which obtains all of the stocks symbols he wishes to follow, each symbol in its own line.
Stock_Follower is using YAHOO-FINANCE API for recieving stocks information.

Example for running the script over a symbols text file which contains 3 stocks (for this example the script is sending an alert if change is more than 1% , and runs every 10 seconds): 
![image](https://user-images.githubusercontent.com/93818437/205460402-3a7e62fd-a0ca-4e38-9299-fe447907c46b.png)
![image](https://user-images.githubusercontent.com/93818437/205460405-9635634e-de7a-4344-aeb1-155300a29e77.png)
