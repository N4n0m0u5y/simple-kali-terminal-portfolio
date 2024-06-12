document.addEventListener('DOMContentLoaded', () => {
    const input = document.getElementById('input');
    const output = document.getElementById('output');

    input.addEventListener('keydown', async (event) => {
        if (event.key === 'Enter') {
            const command = input.value.trim();
            input.value = '';

            // Handle commands
            if (command) {
                output.innerHTML += "\n$ " + command;
                const response = await getResponse(command);
                output.innerHTML += "\n" + response;
            }
        }
    });
});

async function getResponse(prompt) {
    // Mock response function - replace with actual OpenAI API call
    const responses = {
        'help': 'Available commands: help, about, projects, contact',
        'about': 'This is a simple Kali terminal-like portfolio.',
        'projects': 'Project 1: AI-Driven Portfolio\nProject 2: Terminal Interface\nProject 3: Dynamic Responses',
        'contact': 'Email: yourname@example.com'
    };
    return responses[prompt] || 'Command not found. Try \'help\' for a list of commands.';
}
