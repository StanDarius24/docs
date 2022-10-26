

3 types of nodes: start Node, condifional Node and action Node, all connected in a tree structure, the father of the knots being the process.

Each time a process is performed, it clones so as not to change its initial definition.

A startNode and  a ConditionalNode have conditions.A condition is an expression that must be evaluated and returns a true or false value.If the evaluation is true, we switch to node's children to evaluate them.If the condition is false, the evalation on the respective bransh stops.When an evaluation leads to an error, let's sau we refer to a person who has a name and an age, and we in our evaluation want to extract the city where he lives but it s not set, the process will fail.

There are several types of actions to which the process reacts.When an object defined by us changes or we create one.

There are 3 states, isActive, isDone, Failed, to be able to view which step in the process has succeeded or failed.

StartNode is the first node in the process, a process can only have one child.

A conditionalNode is the node that contains several children, but in order to be able to pass to the child to evaluate him, you have to evaluate the filter, and the filter evaluation must return true.

Action node is the node that deals with ations, we can define workflows and we can call them dynamically with parameters defined by the evaluation.suppose we have a workflow that sends emails in a process that reacts to a dashboard object whitch has tickets.When a manager moves a certain ticket from one state to another, the process triggers, and start evaluating itsefl.we reach an actionNode that sends an email.We can define an expression that dynamically defines the person to whom we will send the email.

___

Cron Expression on StartNode:

Select, start Date, end Date, the action will be executed inside the interval.

Then you can select how often, let's say twice a day only mon,tue.It generates a cron expression, that trigger the process.

