<<<<<<< HEAD
=======

>>>>>>> origin/master
#java #springBoot 

The Application Context is Spring's advanced container. Similar to BeanFactory, it can load bean definitions, wire beans together, and dispense beans upon request. Additionally, it adds more enterprise-specific functionality such as the ability to resolve textual messages from a properties file and the ability to publish application events to interested event listeners. This container is defined by _org.springframework.context.ApplicationContext_ interface.

The _ApplicationContext_ includes all functionality of the _BeanFactory_, It is generally recommended over BeanFactory. BeanFactory can still be used for lightweight applications like mobile devices or applet-based applications.

The most commonly used ApplicationContext implementations are −

-   **FileSystemXmlApplicationContext** − This container loads the definitions of the beans from an XML file. Here you need to provide the full path of the XML bean configuration file to the constructor.
    
-   **ClassPathXmlApplicationContext** − This container loads the definitions of the beans from an XML file. Here you do not need to provide the full path of the XML file but you need to set CLASSPATH properly because this container will look like bean configuration XML file in CLASSPATH.
    
-   **WebXmlApplicationContext** − This container loads the XML file with definitions of all beans from within a web application.
    

We already have seen an example on ClassPathXmlApplicationContext container in _Spring Hello World Example_, and we will talk more about XmlWebApplicationContext in a separate chapter when we will discuss web-based Spring applications. So let us see one example on FileSystemXmlApplicationContext.
