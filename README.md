# cli-scripts 

A collection of standalone developer scripts that might speed up your workflow.  
The scripts are targeted towards a developers whose workflow depends on a Bash terminal.  
No need to install the whole repository, I recommend you make a copy of any scripts you think you may need.

## 🗒️ Available Scripts

### 1. `generate-commit-msg.sh`

Prompt Grok (or any AI of your choosing, granted you update the script accordingly) to generate a Conventional Commit message based on locally staged changes

To get started, install the script in your project's `./scripts` directory.

**Installation:**

```bash
curl -o scripts/generate-commit-msg.sh https://raw.githubusercontent.com/AmiraBasyouni/cli-scripts/main/scripts/generate-commit-msg.sh
```

Create a file to store your API key:
```bash
echo "export XAI_API_KEY='your-key-here'" > ~/.xai_api_key
```  

Restrict the file's permissions to rw- --- ---:
```bash
chmod 600 ~/.xai_api_key
```

**Example usage:**
```bash
$ git add src/App.jsx
$ ./commit-msg-suggester.sh
Suggested commit message:
feat: add form validation to App.jsx
- Implemented useState for form input handling
- Added regex-based email validation
Use this message? [y/N]: y
Commit successful!
```

## 📫 Suggestions
Each script is fully self-contained. You can:
Copy/paste a single file into your repo.
Add it to package.json like so:

you can also can add the script to your package.json file, so you can run it from anywhere within your project directory (recommended):
```json
"scripts": {
  "generate-commit-msg": "bash scripts/generate-commit-msg.sh"
}
```

Then run:  
```json
npm run generate-commit-msg
```

## 🌐 Contributions
This project is intended for personal use. At the moment, I’m not accepting external contributions.
Feel free to explore the scripts and adapt them to your own workflow.

## 🏷️ License

MIT
