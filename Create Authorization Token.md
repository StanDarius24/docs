or some reason only the creator of the page can generate a permanent token.
We need to create this token, because it is the only method that will allow us to read our employees answers.
First of all we need to access this page
https://business.facebook.com/settings
![[Pasted image 20230224154633.png]]
after that we need to select our page, in our case Kuhnert.

then we have to click on de System users
![[Pasted image 20230224154719.png]]

After that we have to press on Add
![[Screenshot 2023-02-24 at 15.03.31.png]]

as a name we can use token, and then we have to choose Admin role (this is the only way our backend can read messages from whatsapp)
![[Pasted image 20230224154742.png]]

After the profile is created we have to select Add assets
![[Pasted image 20230224154803.png]]
Then we select applications then our aplication and as rights we select Full control, application manage (last one)
![[Pasted image 20230224154822.png]]

Then we click on save changes

![[Pasted image 20230224155914.png]]

we select our app.
we have to specify the rights for the token
![[Pasted image 20230224155950.png]]
and we have to select read_insights whatsapp_business_management and whatsapp_business_messageing
then click on generate token

![[Pasted image 20230224160040.png]]

a popup with a private key will be generated, you have to copy it and send it to me (the blue one).

