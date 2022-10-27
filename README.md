# Fclone_Tg_Bot

⚫ This is just a Fclone only version of Telegram bot Modified and updated by [Nemesis](https://github.com/LotusCloud/) - [Here](https://github.com/LotusCloud/Fclone-Bot)

🔷 Fclone is just another Tool like Autorclone/Folderclone/Gclone to bypass 750GB limit by google (more optimised for speed)

## 📗 Pre-requisites:-
1. [Install Python 3.7+](https://www.python.org/downloads/)（Latest version 3.8.3 recommended）
2. You need Generated SAs (using [Easiest method](https://github.com/LotusCloud/Fclone-Bot/blob/master/README.md#-How-To-make-SA) or [Autorclone](https://github.com/xyou365/AutoRclone) or [Folderclone](https://github.com/Spazzlo/folderclone))
3. Not needed if you are using Easiest method Open **accounts** Folder (inside Autorclone or Folderclone Folder) and select any one of the json files and rename it as **1.json** 
4. Zip the accounts Folder and keep it safe you upload it to bot later 
5. Make a new bot from [BotFather](https://t.me/BotFather) and get the **Bot token** Ignore 👉[Bot Father Details](https://core.telegram.org/bots#6-botfather) 
6. Get your own Telegram ID - using this [bot](https://t.me/userinfobot) or [rose bot](https://t.me/MissRose_bot) type /id for rose bot 

## 📙 Installation:-

## Method 1
### Docker Deployment easiest

1. Installing docker compose
```bash
sudo apt update -y ; sudo apt upgrade -y; sudo apt autoremove -y; sudo apt install docker-compose -y
```
2. Clone this repo using the command below or Download the Zip version of this repo and extract it
```
git clone https://github.com/LotusCloud/Fclone-Bot
cd Fclone-Bot
```
3.Open config.ini (Its inside telegram_gcloner Folder) - Fill the appropriate values
```
[General]
path_to_gclone =./fclone

telegram_token = telegram bot token
user_ids = Your Telegram ID (multiple separated by commas, first ID is admin get it from https://t.me/MissRose_bot type /id in rose bot to get id )
group_ids = Your Telegram Group ID (If you are not adding the bot to any group - you can leave it blank)

gclone_para_override = Leave it Blank
```
4. Starting the Bot 
```docker
sudo docker-compose up --build
```
## Method 2
### Normal Deployment without docker 
1. Download the Zip version of this repo and extract it or clone this repo using the command below
```
git clone https://github.com/LotusCloud/Fclone-Bot
```
2. Unzip the Repository and Open CMD inside it (if u used git clone - Change directory to cloned repository)- and run this
```
pip install -r requirements.txt
```
3. Open config.sample.ini (Its inside telegram_gcloner Folder) - Fill the appropriate values
```
[General]
path_to_gclone =./fclone

telegram_token = telegram bot token
user_ids = Your Telegram ID (multiple separated by commas, first ID is admin get it from https://t.me/MissRose_bot type /id in rose bot to get id )
group_ids = Your Telegram Group ID (If you are not adding the bot to any group - you can leave it blank)

gclone_para_override = Leave it Blank
```
4. After filling appropriate values - rename it as config.ini and save it

## 🍎 Running the Bot

🔷 Running in Windows 10/11 System - `python telegram_gcloner.py`

🔷 Running in Linux System - `python3 telegram_gcloner.py`

🔶 How to use the bot:-

1. Once its done - go to Telegram Bot you created before and Press **Start**
2. Upload the **accounts.zip** (we created before) to the bot
3. Reply to the message with `/sa`
4. Type /`folders` and set your favourite Folders
5. Send or forward a message with a Google Drive link to the bot to start Copying...

## 📘 How To make SA 

You can follow this guide which has images 👉 [Image Guide Easiest](https://github.com/TheCaduceus/CloneBot_V2/blob/main/README.md#-service-accounts)

or 
a little difficult one 👇 because it just has text.

### Create credentials.JSON in Google Cloud Console

- Open console.developers.google.com/apis/credentials (see in Video how to create it)

- renamed to credentials.json the save to "Bot credentials" folder


### ENABLE Required API
- Go to console.cloud.google.com/apis/library
Click on the search bar find these 2 and enable them 

👉ENABLE 

`Google Drive API`

`Identity and Access Management (IAM) API`

### Create Token.Pickle + Token_sa.Pickle + Service Accounts JSON Files from Windows CMD

- Open CMD in gdrive tools directory 

```
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
pip -V (to confirm it's properly installed)
```

### Generate Token.pickle

- copy paste credentials.json from "Bot credentials" folder to mltb folder

```
pip install google-api-python-client google-auth-httplib2 google-auth-oauthlib
python3 generate_drive_token.py
```

- save token.pickle to "Bot credentials" folder

#### ALTERNATIVE COMMAND

in case **python3** command not working / not installed properly in your windows system. you can use **python** only command without 3 at the end

example below :

```
python generate_drive_token.py
```

### Generate Token_sa.pickle + SA Accounts folder

```
python -m pip install progress
python3 gen_sa_accounts.py --quick-setup 1 --new-only
```

- save SAs (service accounts) folder and token_sa.pickle to "Bot credentials" folder

#### ALTERNATIVE COMMAND

in case **python3** command not working / not installed properly in your windows system. you can use **python** only command without 3 at the end

example below :

```
python gen_sa_accounts.py --quick-setup 1 --new-only
```

### Add Service Account to SHARED DRIVE / TEAM DRIVE

- Open **POWERSHELL** in windows **Accounts** folder
- Copy Paste this command 

```
$emails = Get-ChildItem .\**.json |Get-Content -Raw |ConvertFrom-Json |Select -ExpandProperty client_email >>emails.txt
```

- **For linux **

```
grep -oPh '"client_email": "\K[^"]+' *.json > emails.txt
```

- Go to groups.google.com

- create a new group (DON'T add SA in the 3rd step while creating group)

- open your group, go to members tab and press 'Add Members'

- Copy all mails from \accounts\emails.txt and paste in 'Group members' field, then press 'Add Members'

- open your SHARED DRIVE and add this  [Google Group](https://groups.google.com/my-groups) (it will be something like `your@googlegroups.com`) as 'Content Manager'. Done!

- Don't forget delete emails.txt in your local drive


#### Alternative

- add all the service accounts to your team drive by running this:

```
python3 add_to_team_drive.py -d YourSharedDriveID
```

- If this does not work use 

```
python add_to_team_drive.py -d YourSharedDriveID
```

- You may check your team drive in order to see whether the service accounts are added or not. If it's added by 100 people, then it works. You can check the members too.


## Credits:

🧠 [Nemesis](https://github.com/LotusCloud) - [Here](https://github.com/LotusCloud/Fclone-Bot) - Updating Bot to latest dependencies and adding Custom docker image 

🧠 [wrenfairbank](https://github.com/wrenfairbank) - [Here](https://github.com/wrenfairbank/telegram_gcloner) - Original Author of the Bot

🧠 [Seiko](https://github.com/thegreatestminer) - [Here](https://github.com/thegreatestminer/telegram_gcloner) - Made the English version 

🧠 [Smartass](https://github.com/smartass08) - [Here](https://github.com/smartass08/telegram_gcloner) - Added docker and Heroku support `heroku support removed as it's against tos`

🧠 [TheCaduceus](https://github.com/TheCaduceus) - [Here](https://github.com/TheCaduceus/CloneBot_V2/blob/main/README.md#%EF%B8%8F-create-service-accounts) - For the Image guide on how to create sa 

## License
This project is licensed under the MIT License - see the [LICENSE]([https://github.com/roshanconnor123/Fclone_Tg_Bot/blob/master/LICENSE](https://github.com/LotusCloud/Fclone-Bot/blob/main/LICENSE)) file for details


