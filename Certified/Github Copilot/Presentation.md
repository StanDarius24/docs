1. Features
2. Implementation


---

I've been using GitHub Copilot since its early days, so in this presentation, I'll include a comparison between my experience before and after adopting it. Last week, I completed a course on GitHub Copilot licensing—yes, apparently you can get certified for it, which might sound odd, but I found it useful. I wanted to understand how the underlying concepts are applied and how the system works overall. I’ve extracted the most relevant information from that course and will share some keys with you.

Now, moving on to a more technical aspect—I'll keep this brief, but I think it’s important to understand how data is transmitted. From my perspective, IBM could benefit from offering a similar agent, but one tailored more toward enterprise use rather than individual users. The key question is: how is the data sent through the servers, and what does its lifecycle look like?

- I found a helpful diagram to illustrate this process. First, the prompt is sent to a proxy server, which performs some initial filtering on the request. From there, it’s forwarded to the large language model (LLM). After generating a response, the system runs checks to detect potential vulnerabilities, common bugs, and other issues. It also attempts to match the response against public repositories. This is an important point I want to highlight: the LLM is trained on public code, so by default, it doesn't access or use your private code—only enough context from your code snippets to understand the intent. I’ll also show you a useful feature they’ve implemented to support this.

![[2000x1200-Inline-Graphic.jpg]]

Here is a nice feature that I think its important so you can select some lines of code and basically create a prompt with this code snippet

![[Screenshot 2025-05-01 at 15.37.06.png]]

they also provide predefined prompts lets call them like this


![[Screenshot 2025-05-01 at 15.37.50.png]]

they also have something that scans you file and they suggest to you different modifications like in this chase copilot suggested for me some javadocs but also some refactoring

![[Screenshot 2025-05-01 at 15.43.09.png]]

Another interesting thing is that you can add multiple files and you can basically prompt specific questions based on those files


![[Screenshot 2025-05-01 at 15.44.30.png]]

Now, regarding the metrics we defined, I ran some tests on a project that I’ll describe in terms of development time rather than complexity—a microservice we've been working on for about two years. So, there’s definitely some real logic and depth involved. Even with a paid subscription, I didn’t notice a significant improvement over the free version.

I asked Copilot a few moderately complex questions—for example, implementing multithreading and parallelism for a set of API calls. At a certain point, it started to hallucinate. While I did manage to get a working example, it wasn’t entirely accurate or exactly what I needed. So I’d rate it 4 out of 5 for accuracy. However, I believe if you're starting a project from scratch, the results might be significantly better.

In terms of efficiency, though, I’d give it a solid 5 out of 5. I use it constantly for generating boilerplate code and as a kind of pair programming assistant for debugging it’s been incredibly helpful.

https://github.ibm.com/IBM-Consulting-Advantage/developer-extension
https://pages.github.ibm.com/IBM-Consulting-Advantage/ica-docs/extensions/access-keys/