## Principles of prompt engineering

Before we explore specific strategies, let's first understand the basic principles of prompt engineering, summed up in the **4 Ss** below. These core rules are the basis for creating effective prompts.

- **Single**: Always focus your prompt on a single, well-defined task or question. This clarity is crucial for eliciting accurate and useful responses from Copilot.
- **Specific**: Ensure that your instructions are explicit and detailed. Specificity leads to more applicable and precise code suggestions.
- **Short**: While being specific, keep prompts concise and to the point. This balance ensures clarity without overloading Copilot or complicating the interaction.
- **Surround**: Utilize descriptive filenames and keep related files open. This provides Copilot with rich context, leading to more tailored code suggestions.

### 1. Secure prompt transmission and context gathering

The process begins with the secure transmission of the user prompt over HTTPS. This ensures that your natural language comment is sent to GitHub Copilot's servers securely and confidentially, protecting sensitive information.

### 2. Proxy filter

Once the context is gathered and the prompt is built, it passes securely to a proxy server hosted in a GitHub-owned Microsoft Azure tenant. The proxy filters traffic, blocking attempts to hack the prompt or manipulate the system into revealing details about how the model generates code suggestions.

### 3. Toxicity filtering

Copilot incorporates content filtering mechanisms before proceeding with intent extraction and code generation, to ensure that the generated code and responses don't include or promote:

- **Hate speech and inappropriate content**: Copilot employs algorithms to detect and prevent the intake of hate speech, offensive language, or inappropriate content that could be harmful or offensive.
- **Personal data**: Copilot actively filters out any personal data, such as names, addresses, or identification numbers, to protect user privacy and data security.

### 4. Code generation with LLM

Finally, the filtered and analyzed prompt is passed to LLM Models, which generate appropriate code suggestions. These suggestions are based on Copilot’s understanding of the prompt and the surrounding context, ensuring that the generated code is relevant, functional, and aligned with project-specific requirements.

### 5. Post-processing and response validation

Once the model produces its responses, the toxicity filter removes any harmful or offensive generated content. The proxy server then applies a final layer of checks to ensure code quality, security, and ethical standards. These checks include:
- **Code quality**
- **Matching public code (optional)**
### 6. Suggestion delivery and feedback loop initiation

Only responses that pass all filters are delivered to the user. Copilot then initiates a feedback loop based on your actions to achieve the following:
- Grow its knowledge from accepted suggestions.
- Learn and improve through modifications and rejections of its suggestions.

### 7. Repeat for subsequent prompts
The process is repeated as you provide more prompts, with Copilot continuously handling user requests, understanding their intent, and generating code in response. Over time, Copilot applies the cumulative feedback and interaction data, including context details, to improve its understanding of user intent and refine its code generation capabilities.

---
## Data handling for GitHub Copilot code suggestions
GitHub Copilot in the code editor does not retain any prompts like code or other context used for the purposes of providing suggestions to train the foundational models. It discards the prompts once a suggestion is returned.

GitHub Copilot Individual subscribers can opt-out of sharing their prompts with GitHub which will otherwise be used to finetune GitHub’s foundational model.

## Data handling for GitHub Copilot chat
GitHub Copilot Chat operates as an interactive platform, allowing developers to engage in conversational interactions with the AI assistant to receive coding assistance. Here are the steps that it carries out which might be distinct from other features like code completion:
- **Formatting**
- **User engagement**
- **Data retention**

## Prompt types supported by GitHub Copilot Chat
GitHub Copilot Chat processes a wide range of coding-related prompts, demonstrating its versatility as a conversational coding assistant. Here are some common input types:
- **Direct Questions**
- **Code-Related Requests**
- **Open-Ended Queries**
- **Contextual Prompts**

---

# GitHub Copilot Large Language Models (LLMs)

## What are LLMs?

Large Language Models (LLMs) are artificial intelligence models designed and trained to understand, generate, and manipulate human language. These models are ingrained with the capability to handle a broad range of tasks involving text, thanks to the extensive amount of text data they're trained on. Here are some core aspects to understand about LLMs:

---
### Volume of training data

LLMs are exposed to vast amounts of text from diverse sources. This exposure equips them with a broad understanding of language, context, and intricacies involved in various forms of communication.

---

### Contextual understanding

They excel in generating contextually relevant and coherent text. Their ability to understand context allows them to provide meaningful contributions, be it completing sentences, paragraphs, or even generating whole documents that are contextually apt.

---

### Machine learning and AI integration

LLMs are grounded in machine learning and artificial intelligence principles. They're neural networks with millions, or even billions, of parameters that are fine-tuned during the training process to understand and predict text effectively.

---
### Versatility

These models aren't limited to a specific type of text or language. They can be tailored and fine-tuned to perform specialized tasks, making them highly versatile and applicable across various domains and languages.

---

## Role of LLMs in GitHub Copilot and prompting

GitHub Copilot utilizes LLMs to provide context-aware code suggestions. The LLM considers not just the current file but also other open files and tabs in the IDE to generate accurate and relevant code completions. This dynamic approach ensures tailored suggestions, improving your productivity.

---

## Fine-tuning LLMs

Fine-tuning is a critical process that allows us to tailor pretrained large language models (LLMs) for specific tasks or domains. It involves training the model on a smaller, task-specific dataset, known as the target dataset, while using the knowledge and parameters gained from a large pretrained dataset, referred to as the source model.

---

### LoRA fine-tuning

Traditional full fine-tuning means to train all parts of a neural network, which can be slow and heavily reliant on resources. But LoRA (Low-Rank Adaptation) fine-tuning is a clever alternative. It's used to make large pretrained language models (LLMs) work better for specific tasks without redoing all the training.

Here's how LoRA works:

- LoRA adds smaller trainable parts to each layer of the pretrained model, instead of changing everything.
- The original model remains the same, which saves time and resources.

What's great about LoRA:

- It beats other adaptation methods like adapters and prefix-tuning.
- It's like getting great results with fewer moving parts.

