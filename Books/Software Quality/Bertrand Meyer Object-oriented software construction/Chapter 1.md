#softwareQuality #books 

---

### Correctness

Correctness is the ability of software products to perform their exact tasks, as defined by their specification.

Correctness is the prime quality. If a system does not do what it is supposed to do,
everything else about it — whether it is fast, has a nice user interface¼ — matters little.
Even the first step to correctness is already difficult:
we must be able to specify the system requirements in a precise form, by itself quite a challenging task.

---

### Robustness

Robustness is the ability of software systems to react appropriately to abnormal conditions.

Robustness complements correctness. Correctness addresses the behavior of a system in cases covered by its specification; robustness characterizes what happens outside of
that specification.
There will always be cases that the specification does not explicitly address. The role
of the robustness requirement is to make sure that if such cases do arise, the system does not cause catastrophic events; it should produce appropriate error messages, terminate its execution cleanly, or enter a so-called “graceful degradation” mode.

---

### Extendibility

Extendibility is the ease of adapting software products to changes of specification.

Software is supposed to be soft, and indeed is in principle; nothing can be easier than to change a program if you have access to its source code. Just use your favorite text editor (Vim).
The problem of extendibility is one of scale. For small programs change is usually
not a difficult issue; but as software grows bigger, it becomes harder and harder to adapt. A large software system often looks to its maintainers as a giant house of cards in which pulling out any one element might cause the whole edifice to collapse.

 - Design simplicity: a simple architecture will always be easier to adapt to changes than a complex one.
 - Decentralization: the more autonomous the modules, the higher the likelihood that a simple change will affect just one module, or a small number of modules, rather than triggering off a chain reaction of changes over the whole system.

---

### Reusability

Reusability is the ability of software elements to serve for the construction of many different applications.
The need for reusability comes from the observation that software systems often follow similar patterns; it should be possible to exploit this commonality and avoid reinventing solutions to problems that have been encountered before. By capturing such a pattern, a reusable software element will be applicable to many different developments.
Reusability has an influence on all other aspects of software quality, for solving the reusability problem essentially means that less software must be written, and hence that more effort may be devoted (for the same total cost) to improving the other factors, such as correctness and robustness.

---

### Compatibility

Compatibility is the ease of combining software elements with others.
Compatibility is important because we do not develop software elements in a vacuum: they need to interact with each other. But they too often have trouble interacting because they make conflicting assumptions about the rest of the world. An example is the wide variety of incompatible file formats supported by many operating systems. A program can directly use another’s result as input only if the file formats are compatible.
The key to compatibility lies in homogeneity of design, and in agreeing on standardized conventions for inter-program communication. Approaches include:

• Standardized file formats, as in the Unix system, where every text file is simply a sequence of characters.
• Standardized data structures, as in Lisp systems, where all data, and programs as well, are represented by binary trees (called lists in Lisp).
• Standardized user interfaces, as on various versions of Windows, OS/2 and MacOS, where all tools rely on a single paradigm for communication with the user, based on standard components such as windows, icons, menus etc.

---

### Efficiency

Efficiency is the ability of a software system to place as few demands as possible on hardware resources, such as processor time, space occupied in internal and external memories, bandwidth used in communication devices.
Almost synonymous with efficiency is the word “performance”. The software community shows two typical attitudes towards efficiency:
• Some developers have an obsession with performance issues, leading them to devote a lot of efforts to presumed optimizations.
• But a general tendency also exists to downplay efficiency concerns, as evidenced by such industry lore as “make it right before you make it fast” and “next year’s computer model is going to be 50% faster anyway”.
All this, however, does not diminish the importance of efficiency. No one likes to wait for the responses of an interactive system, or to have to purchase more memory to run a program. So offhand attitudes to performance include much posturing; if the final system is so slow or bulky as to impede usage, those who used to declare that “speed is not that important” will not be the last to complain.

---

### Portability

Portability is the ease of transferring software products to various hardware and software environments.

Portability addresses variations not just of the physical hardware but more generally of the hardware-software machine, the one that we really program, which includes the operating system, the window system if applicable, and other fundamental tools. In the rest of this book the word “platform” will be used to denote a type of hardware-software machine; an example of platform is “Intel X86 with Windows NT” (known as “Wintel”).

---

### Ease of use

Ease of use is the ease with which people of various backgrounds and qualifications can learn to use software products and apply them to solve problems. It also covers the ease of installation, operation and monitoring.
The definition insists on the various levels of expertise of potential users. This requirement poses one of the major challenges to software designers preoccupied with ease of use: how to provide detailed guidance and explanations to novice users, without bothering expert users who just want to get right down to business.
As with many of the other qualities discussed in this chapter, one of the keys to ease of use is structural simplicity. A well-designed system, built according to a clear, well thought-out structure, will tend to be easier to learn and use than a messy one. The condition is not sufficient, of course (what is simple and clear to the designer may be difficult and obscure to users, especially if explained in designer’s rather than user’s terms), but it helps considerably.

---

### User Interface Design principle

Do not pretend you know the user; you don’t.

---

### Functionality

Functionality is the extent of possibilities provided by a system.
One of the most difficult problems facing a project leader is to know how much functionality is enough. The pressure for more facilities, known in industry parlance as featurism (often “creeping featurism”), is constantly there. Its consequences are bad for internal projects, where the pressure comes from users within the same company, and worse for commercial products, as the most prominent part of a journalist’s comparative review is often the table listing side by side the features offered by competing products.
The more difficult problem is to avoid being so focused on features as to forget the other qualities. Projects commonly make such a mistake, a situation vividly pictured by Roger Osmond in the form of two possible paths to a project’s completion:
![[Pasted image 20230115232903.png]]
The bottom curve (black) is all too common: in the hectic race to add more features, the development loses track of the overall quality. The final phase, intended to get things right at last, can be long and stressful. If, under users’ or competitors’ pressure, you are forced to release the product early — at stages marked by black squares in the figure  the outcome may be damaging to your reputation. 
What Osmond suggests (the color curve) is, aided by the quality-enhancing techniques of O-O development, to maintain the quality level constant throughout the project for all aspects but functionality. You just do not compromise on reliability, extendibility and the like: you refuse to proceed with new features until you are happy with the features you have.

---

### Timeliness

Timeliness is the ability of a software system to be released when or before
its users want it.
Timeliness is one of the great frustrations of our industry. A great software product that appears too late might miss its target altogether. This is true in other industries too, but few evolve as quickly as software.

Other qualities beside the ones discussed so far affect users of software systems and the people who purchase these systems or commission their development. In particular:
• Verifiability is the ease of preparing acceptance procedures, especially test data, and procedures for detecting failures and tracing them to errors during the validation and operation phases.
• Integrity is the ability of software systems to protect their various components (programs, data) against unauthorized access and modification.
• Repairability is the ability to facilitate the repair of defects.
• Economy, the companion of timeliness, is the ability of a system to be completed on or below its assigned budget.

---

### ABOUT SOFTWARE MAINTENANCE

Maintenance is what happens after a software product has been delivered. Discussions of software methodology tend to focus on the development phase; so do introductory programming courses. But it is widely estimated that 70% of the cost of software is devoted to maintenance. No study of software quality can be satisfactory if it neglects this aspect.