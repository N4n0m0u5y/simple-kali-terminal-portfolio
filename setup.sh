#!/bin/bash

# Initialize Git Repository
git init

# Add a README
echo "# Simple Kali Terminal Portfolio" >> README.md

# Create Project Directories
mkdir -p src assets/css assets/js assets/img

# Set up Basic Files
echo "{
  \"name\": \"simple-kali-terminal-portfolio\",
  \"version\": \"1.0.0\",
  \"description\": \"A simple, sleek AI-driven portfolio in the style of a Kali terminal\",
  \"main\": \"src/index.js\",
  \"scripts\": {
    \"start\": \"node src/index.js\",
    \"test\": \"echo \\"Error: no test specified\\" && exit 1\"
  },
  \"dependencies\": {
    \"openai\": \"^3.0.0\"
  }
}" > package.json

# HTML Structure
cat <<EOT > src/index.html
<!DOCTYPE html>
<html lang=\"en\">
<head>
    <meta charset=\"UTF-8\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <title>Simple Kali Terminal Portfolio</title>
    <link rel=\"stylesheet\" href=\"../assets/css/styles.css\">
</head>
<body>
    <div class=\"terminal\">
        <div class=\"header\">
            <span class=\"title\">Kali Terminal</span>
        </div>
        <div class=\"body\">
            <pre id=\"output\">Welcome to the Simple Kali Terminal Portfolio!</pre>
            <div class=\"input-line\">
                <span class=\"prompt\">$</span>
                <input type=\"text\" id=\"input\" autofocus autocomplete=\"off\">
            </div>
        </div>
    </div>
    <script src=\"../assets/js/scripts.js\"></script>
</body>
</html>
EOT

# Basic CSS
cat <<EOT > assets/css/styles.css
body {
    background-image: url('../assets/img/tech-background.png'); /* Use the background image */
    background-size: cover;
    color: #00FF00;
    font-family: monospace;
    margin: 0;
    display: flex;
    justify-content: flex-start;
    align-items: flex-start;
    height: 100vh;
    padding: 20px;
    box-sizing: border-box;
}

.terminal {
    background-color: rgba(30, 30, 30, 0.9);
    padding: 20px;
    border-radius: 10px;
    width: 100%;
    max-width: 800px;
    box-shadow: 0 0 10px rgba(0, 255, 0, 0.5);
}

.header {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
    color: #00CC66; /* Added color */
}

.title {
    font-weight: bold;
    color: #0099FF; /* Added color */
}

.body {
    background-color: #000;
    padding: 10px;
    border-radius: 5px;
    color: #00FF99; /* Added color */
}

.input-line {
    display: flex;
    align-items: center;
}

.prompt {
    margin-right: 10px;
    color: #FF9933; /* Added color */
}

input {
    background: none;
    border: none;
    color: #00FF00;
    width: 100%;
    font-family: monospace;
}
EOT

# Basic JS for Interaction
cat <<EOT > assets/js/scripts.js
document.addEventListener('DOMContentLoaded', () => {
    const input = document.getElementById('input');
    const output = document.getElementById('output');

    input.addEventListener('keydown', async (event) => {
        if (event.key === 'Enter') {
            const command = input.value.trim();
            input.value = '';

            // Handle commands
            if (command) {
                output.innerHTML += "\\n$ " + command;
                const response = await getResponse(command);
                output.innerHTML += "\\n" + response;
            }
        }
    });
});

async function getResponse(prompt) {
    // Mock response function - replace with actual OpenAI API call
    const responses = {
        'help': 'Available commands: help, about, projects, contact',
        'about': 'This is a simple Kali terminal-like portfolio.',
        'projects': 'Project 1: AI-Driven Portfolio\\nProject 2: Terminal Interface\\nProject 3: Dynamic Responses',
        'contact': 'Email: yourname@example.com'
    };
    return responses[prompt] || 'Command not found. Try \'help\' for a list of commands.';
}
EOT

# Initial Commit
git add .
git commit -m "Initial commit - Project setup"

# Push to GitHub using SSH
git remote add origin git@github.com:N4n0m0u5y/simple-kali-terminal-portfolio.git
git push -u origin master