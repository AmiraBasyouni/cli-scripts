# cli-scripts 

A collection of self-contained developer scripts that can speed up your workflow.  
There’s no need to install the entire repository. Instead, I recommend copying only the scripts that can complement your workflow.   
For convenience, consider adding each script to your `package.json` file.

## 🗒️ Available Scripts

### 1. `generate-commit-msg.sh`

Prompt Grok (or any AI of your choosing, granted you update the script accordingly) to generate a Conventional Commit message based on locally staged changes

To get started, cd into the root of your project directory.

**Installation:**

Install the script into your ./scripts directory (make sure the directory exists):
```bash
curl -o ./scripts/generate-commit-msg.sh https://raw.githubusercontent.com/AmiraBasyouni/cli-scripts/refs/heads/main/generate-commit-msg.sh
```

Transform the script file into an executable:
```bash
chmod u+x ./scripts/generate-commit-msg.sh
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
$ ./scripts/commit-msg-suggester.sh
Suggested commit message:
feat: add form validation to App.jsx
- Implemented useState for form input handling
- Added regex-based email validation
Use this message? [y/N]: y
Commit successful!
```

## 📫 Suggestions
Once added to `package.json`, scripts can be run from any location within your project directory.

Add the script:
```json
"scripts": {
  "commit": "./scripts/generate-commit-msg.sh"
}
```

Then run it using:  
```bash
npm run commit
```

## 🌐 Contributions
This project is intended for personal use. At the moment, I’m not accepting external contributions.
Feel free to explore the scripts and adapt them to your development workflow

## 🏷️ License

MIT
