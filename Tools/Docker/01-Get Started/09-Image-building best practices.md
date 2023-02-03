#docker 
When you have built an image, it is a good practice to scan it for security vulnerabilities using the `docker scan` command. Docker has partnered with [Snyk](https://snyk.io/) to provide the vulnerability scanning service.

For example, to scan the `getting-started` image you created earlier in the tutorial, you can just type
```bash
docker scan getting-started
```

---

## Image layering
Did you know that you can look at what makes up an image? Using the `docker image history` command, you can see the command that was used to create each layer within an image.
1. Use the `docker image history` command to see the layers in the `getting-started` image you created earlier in the tutorial.
```bash
docker image history getting-started
```
You should get output that looks something like this (dates/IDs may be different).
```bash
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
 a78a40cbf866        18 seconds ago      /bin/sh -c #(nop)  CMD ["node" "src/index.j…    0B                  
 f1d1808565d6        19 seconds ago      /bin/sh -c yarn install --production            85.4MB              
 a2c054d14948        36 seconds ago      /bin/sh -c #(nop) COPY dir:5dc710ad87c789593…   198kB               
 9577ae713121        37 seconds ago      /bin/sh -c #(nop) WORKDIR /app                  0B                  
 b95baba1cfdb        13 days ago         /bin/sh -c #(nop)  CMD ["node"]                 0B                  
 <missing>           13 days ago         /bin/sh -c #(nop)  ENTRYPOINT ["docker-entry…   0B                  
 <missing>           13 days ago         /bin/sh -c #(nop) COPY file:238737301d473041…   116B                
 <missing>           13 days ago         /bin/sh -c apk add --no-cache --virtual .bui…   5.35MB              
 <missing>           13 days ago         /bin/sh -c #(nop)  ENV YARN_VERSION=1.21.1      0B                  
 <missing>           13 days ago         /bin/sh -c addgroup -g 1000 node     && addu…   74.3MB              
 <missing>           13 days ago         /bin/sh -c #(nop)  ENV NODE_VERSION=12.14.1     0B                  
 <missing>           13 days ago         /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B                  
 <missing>           13 days ago         /bin/sh -c #(nop) ADD file:e69d441d729412d24…   5.59MB
```
Each of the lines represents a layer in the image. The display here shows the base at the bottom with the newest layer at the top. Using this, you can also quickly see the size of each layer, helping diagnose large images.

2. You’ll notice that several of the lines are truncated. If you add the `--no-trunc` flag, you’ll get the full output (yes... funny how you use a truncated flag to get untruncated output, huh?)
```bash
docker image history --no-trunc getting-started
```

---

## Layer caching
Now that you’ve seen the layering in action, there’s an important lesson to learn to help decrease build times for your container images.
`Once a layer changes, all downstream layers have to be recreated as well`

