#!/bin/bash
# commit_suggest.sh

# Load API key from secure file
if [ -f ~/.xai_api_key ]; then
  source ~/.xai_api_key
else
  echo "Error: ~/.xai_api_key not found. Please create it with XAI_API_KEY."
  exit 1
fi

# Get git diff for staged changes
DIFF=$(git diff --cached)

# Prepare prompt for Grok 4 with conventional commits and bullet-list body
PROMPT="Analyze the following git diff for a React project and suggest a commit message in the conventional commits format (e.g., 'feat: description', 'fix: description'). Include a commit body as a bullet list if the changes are complex or involve multiple tasks; otherwise, keep it concise:\n\n$DIFF"

# Call xAI API with curl
RESPONSE=$(curl -s -X POST https://api.x.ai/v1/chat/completions \
  -H "Authorization: Bearer $XAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "grok-4",
    "messages": [{"role": "user", "content": "'"$PROMPT"'"}],
    "max_tokens": 150
  }')

# Extract commit message from response
COMMIT_MSG=$(echo "$RESPONSE" | jq -r '.choices[0].message.content' | tr -d '\n')

# Check for valid response
if [ -z "$COMMIT_MSG" ] || [ "$COMMIT_MSG" = "null" ]; then
  echo "Error: Failed to retrieve commit message from API."
  exit 1
fi

# Display suggested commit message
echo "Suggested commit message:"
echo "$COMMIT_MSG"

# Prompt for confirmation
read -p "Use this message? [y/N]: " CONFIRM
if [ "$CONFIRM" = "y" ]; then
  git commit -m "$COMMIT_MSG"
  echo "Commit successful!"
else
  echo "Commit aborted."
fi
