#java #springBoot 

The Spring container is at the core of the Spring Framework. The container will create the objects, wire them together, configure them, and manage their complete life cycle from creation till destruction. The Spring container uses DI to manage the components that make up an application. These objects are called Spring Beans, which we will discuss in the next chapter.

The container gets its instructions on what objects to instantiate, configure, and assemble by reading the configuration metadata provided. The configuration metadata can be represented either by XML, Java annotations, or Java code. The following diagram represents a high-level view of how Spring works. The Spring IoC container makes use of Java POJO classes and configuration metadata to produce a fully configured and executable system or application.

![[Pasted image 20221025234603.png]]

Spring provides the following two distinct types of containers.

1.[03-Spring BeanFactory Container]

This is the simplest container providing the basic support for DI and is defined by the _org.springframework.beans.factory.BeanFactory_ interface. The BeanFactory and related interfaces, such as BeanFactoryAware, InitializingBean, DisposableBean, are still present in Spring for the purpose of backward compatibility with a large number of third-party frameworks that integrate with Spring.

2.[Spring ApplicationContext Container]

This container adds more enterprise-specific functionality such as the ability to resolve textual messages from a properties file and the ability to publish application events to interested event listeners. This container is defined by the _org.springframework.context.ApplicationContext_ interface.

The _ApplicationContext_ container includes all functionality of the _BeanFactory_container, so it is generally recommended over _BeanFactory_. BeanFactory can still be used for lightweight applications like mobile devices or applet-based applications where data volume and speed is significant.