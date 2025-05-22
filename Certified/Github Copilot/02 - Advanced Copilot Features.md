
---
## What will I learn?

By the conclusion of this module, you acquire the skills to:

- Work with a preconfigured GitHub repository in Codespaces with the GitHub Copilot extension.
- Use interactive features of GitHub Copilot to generate useful suggestions for an existing project.
- Apply advanced GitHub Copilot features to learn more about a new project, write documentation, and create unit tests.

---

## The basics

When GitHub Copilot is enabled, it provides you with suggestions. These suggestions are called ghost text. You can either ignore the ghost text, or accept it by pressing the **Tab** key. The suggestions don't require a prompt because by default GitHub Copilot uses the files you have open as context. However, you can provide a prompt using a comment, the chat window, or the inline chat within your code.

## Chatting with GitHub Copilot

GitHub Copilot allows you to have an interactive discussion using the chat feature. In Visual Studio Code, you can click the chat icon on the left sidebar, which opens the chat interface in a dedicated pane.

## Using inline chat

Besides the dedicated chat pane, you can use the inline chat. It allows you to interact with GitHub Copilot without leaving your code.

Access the inline chat by using **Ctrl+i** on Windows or **Command+i** on a Mac. One of the benefits of using the inline chat is that you don't have to switch context by going to a different pane. The suggestions and interactions happen closer to the code.

## Slash commands

Within the chat pane or when using the inline chat, you can use slash commands. These commands allow GitHub Copilot to use a specific intent for quickly solving common development tasks.

If you type a forward slash in the chat pane or inline chat, you should see a drop-down menu with all the slash commands available. For example, the `/tests` slash command helps you write tests, while the `/docs` command is intended for writing documentation.

## Agents

Visual Studio Code has a feature called _agents_ that allows you to interact with GitHub Copilot. These agents allow you to ask questions using a specific context. For example the `@terminal` agent helps you chat with GitHub Copilot to interact with the terminal.

Another agent is `@workspace`, which is aware of your entire workspace. It allows you to ask questions about the entire project. To use an agent, prefix your question with the agent, for example: `@workspace how can I package this project?`.