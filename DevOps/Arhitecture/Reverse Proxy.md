A reverse proxy is a server that sits in front of web servers and forwards client (e.g. web browser) requests to those web servers. Reverse proxies are typically implemented to help increase [security](https://www.cloudflare.com/learning/security/what-is-web-application-security/), [performance](https://www.cloudflare.com/learning/performance/why-site-speed-matters/), and reliability. In order to better understand how a reverse proxy works and the benefits it can provide, let’s first define what a proxy server is.

## What’s a proxy server?

A forward proxy, often called a proxy, proxy server, or web proxy, is a server that sits in front of a group of client machines. When those computers make requests to sites and services on the Internet, the proxy server intercepts those requests and then communicates with web servers on behalf of those clients, like a middleman.

For example, let’s name 3 computers involved in a typical forward proxy communication:
-   A: This is a user’s home computer
-   B: This is a forward proxy server
-   C: This is a website’s origin server (where the website data is stored)

user's device (A)                                                            origin server (C)
							\\                                                      /
user's device (B) -- > forward proxy (B) -- > internet 
							/                                                      \
user's device (C)                                                            origin server (C)


In a standard Internet communication, computer A would reach out directly to computer C, with the client sending requests to the [origin server](https://www.cloudflare.com/learning/cdn/glossary/origin-server/) and the origin server responding to the client. When a forward proxy is in place, A will instead send requests to B, which will then forward the request to C. C will then send a response to B, which will forward the response back to A.

Why would anyone add this extra middleman to their Internet activity? There are a few reasons one might want to use a forward proxy:

- **To avoid state or institutional browsing restrictions** - Some governments, schools, and other organizations use firewalls to give their users access to a limited version of the Internet. A forward proxy can be used to get around these restrictions, as they let the user connect to the proxy rather than directly to the sites they are visiting.
- **To block access to certain content** - Conversely, proxies can also be set up to block a group of users from accessing certain sites. For example, a school network might be configured to connect to the web through a proxy which enables content filtering rules, refusing to forward responses from Facebook and other social media sites.
- **To protect their identity online** - In some cases, regular Internet users simply desire increased anonymity online, but in other cases, Internet users live in places where the government can impose serious consequences to political dissidents. Criticizing the government in a web forum or on social media can lead to fines or imprisonment for these users. If one of these dissidents uses a forward proxy to connect to a website where they post politically sensitive comments, the [IP address](https://www.cloudflare.com/learning/dns/glossary/what-is-my-ip-address/) used to post the comments will be harder to trace back to the dissident. Only the IP address of the proxy server will be visible.

#devops 