# ScottishSummit 2021 Homework
Resources referenced during my Scottish Summit 2021 virtual session

This app will allow you to turn the BypassConsent setting on and off for your various Power Apps

Import and Setup

Azure Automation
1) Setup your Azure Automation Account
2) Add the 2 Power Apps modules to your Automation Account
    - "Microsoft.PowerApps.PowerShell"
    - "Microsoft.PowerApps.Administration.PowerShell"
3) Add your Admin Credentials
    - The account will need to have a Power App license
    - The account can only make edits to a Power App if it is an owner, and the app is not currently locked for editing
4) Create a new PowerShell Runbook and paste in the script
5) Publish the Runbook

Power Apps
1) Import the "Power Apps - BypassConsent.zip" into Power Apps - this is a create as new import and contains a Power App and flow
2) Open the app in the editor
3) Edit the OnStart property of the app and replace "<ADMIN ACCOUNT ID>" with the Object ID of the account you plan to run your script with
4) You will notice that the submit button will be disabled if the Admin account being used is not an owner of the the App you have selected
    - Manually assign co-ownership of the app to your account either in Power Apps or the PowerPlatform admin centre
    - You can add in the functionality to add this account to the app as an owner using the exiting connections in the App
5) You may need to reconnect the flow to the submit button/app -  make sure to copy out the existing value before reconnecting the flow because it will clear the value when you re-add the flow
6) Save and Publish
  
Power Automate
1) Open the imported flow and turn it on
2) All the variables should match to the Power App and the script
3) Add in a "Create Job" Azure Automation connection
    - Select your Subscription, Resource Group, Azure Automation Account and Script
    - Add in your AppID value and your RemoveConsent value to the Parameters
4) Update the Respond to Power Apps connection to include the "Create Job Status" to allow it to be returned to the Power App
5) Save the flow

Running the System
1) If everything has been connected correctly, you should be able to select an environemt, select an app and turn on/off the BypassConsent property
2) To see this in action, use a seperate account that has never accessed a particular app, run the app and you will notice a prompt to consent to connections that app requires - close without granting consent
3) Use the system to turn on BypassConsent for that same app and go back into the app as the same user, if all has worked correctly, the prompt should no longer appear



