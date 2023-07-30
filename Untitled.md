Generative AI is a broad term that can be used for any AI system whose primary function is to generate content. This is in contrast to AI systems that perform other functions, such as classifying data (for example, assigning labels to images), grouping data (for example, identifying customer segments with similar purchasing behavior), or choosing actions (for example, steering an autonomous vehicle).

What is Generative AI?

Typical examples of Generative AI systems include image generators (such as Midjourney or Stable Diffusion), Large Language Models (such as GPT-4, PaLM, Claude, or Bert), and now watsonx models (more later on that), code generation tools (such as Copilot or Wysdom), or audio generation tools (such as VALL-E or resemble.ai).

Using the term "Generative AI" emphasizes the content-creating function of these systems. It is a relatively intuitive term that covers a range of types of AI that have progressed rapidly in recent years.

---

What are some of the key terms used when discussing Generative AI?

A Foundation Model is any model that is generally pretrained on broad unlabeled data sets in a self-supervised manner, and in the process, learns generalizable and adaptable data representations.

The term Foundation Model was coined in a 200+ pages Stanford report, which describes how AI is undergoing a paradigm shift with the rise of a new class of models called Foundation Models.

The authors observed two trends that led to the definition of Foundation Models:

Previous generations of Machine Learning (ML) models were trained to perform specific behaviors, such as answering questions (Q&A) or summarizing a body of text. However, Foundation Models perform tasks for which they were not explicitly trained.

As the ML community discovers techniques that work well for different kinds of problems, those techniques become part of a standardized approach to building ML systems. With Foundation Models, the model itself is becoming the object of homogenization. For example, the model itself provides the foundation on top of which new models can be developed to specialize in a domain.

Applying the emergent behaviors of Foundation Models to client use cases is a challenge. These models generate content that varies, even if the inputs are identical. The outcomes could be biased, inaccurate, insecure, and have inherent copyright issues. Applying the appropriate safeguard rails facilitates the ability to quantify and mitigate the harmful business impacts from using generated content by ensuring the model and its outcomes are explainable and appropriate for the use case, and the training data is audited. Ultimately, all models should optimally be configured with AI Governance processes and policies in place.

---

What are Large Language Models (LLMs)?

Large Language Models (LLMs) are a type of AI system that works with language. An LLM aims to model language, that is, to create a simplified—but useful—digital representation. The "large" part of the term describes the trend toward training language models with more parameters. 

Typical examples of LLMs include OpenAI's GPT-4, Google's PaLM, and Meta's LLaMA. There is some ambiguity about whether to refer to specific products (such as OpenAI's ChatGPT or Google's Bard) as LLMs themselves or to say that they are powered by underlying LLMs.

As a term, LLM is often used by AI practitioners to refer to systems that work with language.

GPT, or Generative Pre-trained Transformer, is one of these Large Language Models.

Pretrained The model is initially trained on large amounts of text data.

Fine-tuned The model is fine-tuned for specific generative tasks.

Transformer A type of machine learning architecture used to process and analyze data.

Encoders and decoders

Encoders and decoders are components of the transformer architecture used to process and generate data sequences, such as text.

An encoder takes a sequence of input data, like a sentence, and converts it into a series of encoded representations. Each representation captures information about the original input data but at a different level of abstraction. The final encoded representation is typically a vector that summarizes the input sequence.

On the other hand, a decoder takes an encoded representation and uses it to generate a new sequence of data, like a translation of the original sentence into a different language. The decoder does this by predicting the next token in the sequence based on the encoded representation and the tokens generated so far.

Here's an example of how encoders and decoders might work together to translate a sentence from English to French:

Input sentence: "The cat sat on the mat."

Encoded representation: [0.2, 0.5, -0.1, 0.4, ...]

Target language: French

Decoder output: "Le chat s'est assis sur le tapis."

In this example, the encoder takes the English sentence as input and generates an encoded representation, which captures the meaning of the sentence in a lower-dimensional space. The decoder then uses this encoded representation to generate a new sequence of tokens in the target language, French. The final output is a translated sentence that captures the same meaning as the original sentence but in a different language.

---

[Why are Foundation Models important?]

**Foundation Models**

Foundation Models are pretrained on massive amounts of data and can be fine-tuned for specific tasks. Foundation Models can generate human-like language, perform question-answering tasks, and even generate code. They represent a significant breakthrough in the field of artificial intelligence and have the potential to revolutionize a wide range of industries, including healthcare, finance, and education.

Advanced Analytics -> Machine Learning -> Deep Learning -> Generative AI & Fundation Models

**Opportunities**

**For IBM, there are numerous opportunities to leverage Foundation Models to improve our products, services, and customer offerings.** With IBM's unmatched history of AI and automation at scale, IBM's Garage methodology and open ecosystem approach, we are in a unique position to continue accelerating how we solve business problems by reducing costs, turnaround time, and improving productivity.

---

[What are some of the advantages of the Foundation Models?]

Because Foundation Models can be fine-tuned for a range of downstream tasks by using a small amount of task-specific labeled training data, benefits include:

**Less effort and lower upfront costs for data acquisition and labeling**

Using an out-of-the-box, already existing Foundation Model as a starting point requires less labeled, task-specific training data than previous approaches, resulting in lower upfront costs for data acquisition and labeling.

**Faster deployment time**

Built once, the same Foundation Model can be fine-tuned for downstream applications using a small amount of training data, decreasing time-to-value, and increasing productivity.

**Better accuracy**

Foundation Models are the next revolution in deep learning – they are shown to be far better in various benchmarks than the previous generation of AI models.

---

[What are some of the shortcomings of Foundation Models?]

**How can an enterprise overcome these shortcomings and exploit Foundation Models to its advantage?**

**Creating Foundation Models from scratch requires a large volume of unlabeled data and large computing resources.**

However, enterprises could start with pretrained Foundation Models that have been fine-tuned with much less labeled data and minimal computing resources.

**For cases where a pretrained Foundation Model does not exist, enterprises will want to create their own.**

While this seems daunting, the software required to train and validate Foundation Models is maturing rapidly. In fact, the Red Hat OpenShift platform will provide a Foundation Model, Stack to train, fine-tune, and inference Foundation Models in 2H 2023.

**The inference of Foundation Models is more expensive than traditional models.**

Inference cost is a function of model size. In cases where Foundation Models are significantly larger than previous models, they will require more computing resources. However, tooling also exists to manage the size of Foundation Models for different environments.

---
allows you to rapidly apply generative AI to new and existing use cases through a proven co-creation method. (Select the most appropriate option.)
	not enterprise design thinking
	not agile 
	not application management services
BM Consulting is aggressively working to penetrate the industry through the end of 2023 by targeting over ____________ pilots and workshops.
	not 500
	700 right
Which of the items listed below is NOT one of the benefits of Generative AI that IBM sees accruing to employees and business leaders?
	not increase employee productivity
	not help employees with necessary but repetitive tasks
	not augment or enhance human capabilities
IBM Consulting is using a use-case approach to penetrating the Generative AI opportunity set in the market. Which of the following are the top three use cases that IBM Consulting will focus on initially?
	good customer service, human resources modernization and migration

When engaging in generative AI projects, business leaders must ensure that they put in place strong AI Ethics and Governance mechanisms to mitigate the risks involved. Which question below best suggests a client is concerned with the risk of bias?

Longest one

Which one of the following statements is NOT IBM's approach to AI ethics?
	not longest one

Which of the following is NOT one of the core risks associated with Generative AI and Large Language Models (LLMs)?
	not hallucinations