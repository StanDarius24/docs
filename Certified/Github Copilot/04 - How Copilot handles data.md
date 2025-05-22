Wherever you’re using GitHub Copilot—in a code editor, on the command line, on GitHub.com, or elsewhere—the data pipeline consists of a few distinct components: the user input, the input enrichment and prompt construction tools, and the large language model (LLM) at the core.
Speaking broadly, GitHub Copilot gathers input and context, and uses these elements to build a prompt, which it then sends to the LLM. The LLM then formulates a response or code suggestion, which is returned to the user.
![[2000x1200-Inline-Graphic.jpg]]

1. GitHub Copilot gathers context and builds a prompt
 Much like humans, LLMs provide better answers when they have more context. GitHub Copilot can gather various elements to identify relevant context, including content in the file you are editing, neighboring or related files within a project, repository URLs, or file paths. You can stop GitHub Copilot from using certain content as context for code completions by updating your content exclusion settings.
2. Prompts are tested for toxic language, relevance, and hacking attempts
Once the prompt is built, it passes securely to a proxy service hosted in a GitHub-owned Microsoft Azure tenant. Traffic is routed to regions based on capacity; we cannot guarantee any traffic will stay within a single region. On the proxy, we first test the prompt for toxic language—things like hate speech, sexual content, violence, and evidence of self-harm—and relevance. We don’t want GitHub Copilot to engage with model baiting, vulgar language, or questions unrelated to code and software development. At the same time, we also guard against prompt hacking by detecting and blocking attempts to trick the model into revealing information on how its code works and how it generates suggestions.
Assuming all tests pass, the prompt is passed to the large language model.
3. The model produces its responses
Like the proxy server and the GitHub Copilot API, the GitHub Copilot LLMs are hosted in GitHub-owned Azure tenants. These LLMs consist of AI models created by OpenAI that have been trained on natural language text and source code from publicly available sources, including code in public repositories on GitHub.
How data is treated at this point depends on a few configuration options and the specific GitHub Copilot feature you’re working with.
- **GitHub Copilot in the code editor** does not retain any prompts (like code or other context used for the purposes of providing suggestions) for training the foundational LLMs. Prompts are discarded once a suggestion is returned. GitHub Copilot Individual subscribers can opt-out of sharing their prompts with GitHub which will otherwise be used to finetune GitHub’s foundational model.
- **GitHub Copilot outside the code editor (including CLI, Mobile, and GitHub Copilot Chat on GitHub.com)** will retain prompts, suggestions, and responses to retain conversation history and provide continuity across page navigation events and browser sessions, but will not retain prompts, suggestions, or responses for training GitHub’s foundational model.
 
4. GitHub Copilot’s responses are tested for code quality, certain unique identifiers and matching public code
Each response produced by the model passes through the proxy server for post-processing. Here, the response is checked for toxic language and relevancy, just as the prompt was, but also must pass three additional checks:
- **Code quality:** We test code suggestions for obvious bugs and common security vulnerabilities like cross-site scripting and SQL injection.
- **Unique identifiers:** We truncate responses that contain unique identifiers like email addresses, GitHub URLs, IP addresses, and hard-coded credentials.
- **Suggestions matching public code**: While code suggestions are always synthesized by the model and never copy-pasted from a repository, we guard against cases where the model even _coincidentally_ synthesizes a response matching public code.
If a response fails any one of these filters—toxic language, relevancy, code quality, unique identifiers, or suggestions matching public code—it is either truncated or discarded entirely. Responses that pass all five tests are returned to the user.
	How does GitHub Copilot identify matching code?
	
	Our research suggests that about 1% of GitHub Copilot’s suggestions match public code. The important caveat is that these matches aren't evenly distributed across all suggestions. We see matches far more often when GitHub Copilot lacks context, such as when a developer starts a new project or file. When existing application code provides context, we almost never see a match.
	Regardless of context, the public code filter identifies matching code by stripping out all whitespace and comparing suggestions over ~150 characters against an index of all the public data on GitHub.com. When the filter is enabled, developers should only receive unique suggestions with no match in the public corpus. If there's a match, GitHub Copilot discards the suggestion and moves on to the next one in the queue.

5. GitHub Copilot returns a response or code suggestion to the user
Finally, the response or code suggestion is returned to the user. If the suggestion is returned in the code editor, the model may produce multiple suggestions, and the developer can choose which suggestion to accept or reject.
