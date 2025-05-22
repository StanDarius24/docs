Enables communication between various components within and outside of the application. Services enable the frontend application to be mode available to end users, it helps communication between backend and frontend parts and helps in establishing connectivity to an external data source => Loose coupling between microservices in our application.

![[screenshot-ibm-learning.udemy.com-2024.05.26-16_08_06.png]]

A quick example of how from a network perspective our pod and our cluster are configured. If I want to access something that is deployed inside the pod on the port 80 for example the only way I can access it is through a ssh to the cluster, and this is not the way we want to use it, so for the SERVICE was created

Services Type:
1. NodePort -> where the service makes an internal port accessible on a port on the node
2. Cluster IP -> creates a virtual IP inside the cluster to enable communication between different services, such as a set of front and servers to a set of backend servers.
3. Load Balancer -> provisions a load balancer for our application in supported cloud providers.

---

Cluster IP:
**Kubernetes assigns a virtual IP address to a _ClusterIP_ service that can solely be accessed from within the cluster during its creation**. This IP address is stable and doesn’t change even if the pods behind the service are rescheduled or replaced.
_ClusterIP_ services are an excellent choice for internal communication between different components of our application that don’t need to be exposed to the outside world. For example, if we have a microservice that processes data and sends it to another microservice for further processing, we can use a _ClusterIP_ service to connect them.
![[screenshot-ibm-learning.udemy.com-2024.05.26-16_33_24.png]]
```yaml
apiVersion: v1
kind: Service
metadata:
	name: back-end
spec:
	type: ClusterIP
	ports:
		- targetPort: 80
		  port: 80
	selecter:
		app: myapp
		type: back-end
```

---

NODE PORT:
_NodePort_ services extend the functionality of _ClusterIP_ services by enabling external connectivity to our application. When we create a _NodePort_ service on any node within the cluster that meets the defined criteria, **Kubernetes opens up a designated port that forwards traffic to the corresponding _ClusterIP_ service running on the node.**

These services are ideal for applications that need to be accessible from outside the cluster, such as web applications or APIs. With _NodePort_ services, we can access our application using the node’s IP address and the port number assigned to the service.

![[screenshot-ibm-learning.udemy.com-2024.05.26-16_16_20.png]]

```yaml
apiVersion: v1
kind: Service
metadata:
	name: myapp-service
spec:
	type: Nodeport
	ports:
		- targetPort: 80
		  port: 80
		  nodePort: 30008
	selector:
		app: myapp
		type: front-end
```

Same Node -> random algorithm, session affinity -> YES
![[screenshot-ibm-learning.udemy.com-2024.05.26-16_24_19.png]]
Different nodes? same scenario no need of more configurations (checks label)
![[screenshot-ibm-learning.udemy.com-2024.05.26-16_25_30.png]]

---

Load Balancer services:
Connect our applications externally, and production environments use them where high availability and scalability are critical. When we create a _LoadBalancer_ service, **Kubernetes provisions a load balancer in our cloud environment and forwards the traffic to the nodes running the service.**
![[screenshot-ibm-learning.udemy.com-2024.05.26-16_58_04.png]]
_LoadBalancer_ services are ideal for applications that need to handle high traffic volumes, such as web applications or APIs. With _LoadBalancer_ services, we can access our application using a single IP address assigned to the load balancer.
```yaml
apiVersion: v1
kind: Service
metadata:
	name: myapp-service
spec:
	type: LoadBalancer
	ports:
	- targetPort: 80
	  port: 80
	  nodePort: 30008
```

---

![[Screenshot 2024-05-26 at 16.35.14.png]]