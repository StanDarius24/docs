Establishing an SSH (Secure Shell) connection is essential to log in and effectively manage a remote server. Encrypted keys are a set of access credentials used to establish a secure connection.

## Creating SSH keys

### Step 1- Generate the SSH Key Pair

On your **client** system – the one you’re using to connect to the server – you need to create a pair of key codes.

To **generate a pair of SSH key codes**, enter the commands:
	
```bash
mkdir –p $HOME/.ssh
```
	
```bash
chmod 0700 $HOME/.ssh
```
	
```bash
ssh-keygen
```
	
This will create a hidden directory to store your SSH keys, and [modify the permissions for that directory](https://phoenixnap.com/kb/linux-file-permissions). The **ssh-keygen** command creates a 2048-bit RSA key pair.

For extra security, use RSA4096:

```
ssh –keygen –t rsa 4096
```

If you’ve already generated a key pair, this will prompt to overwrite them, and those old keys will not work anymore.

The system will ask you to create a passphrase as an added layer of security. Input a memorable passphrase, and press **Enter**.

**!NOTE: This process creates two keys. One is a public key, which you can hand out to anyone – in this case, you’ll save it to the server. The other one is a private key, which you will need to keep secure. The secure private key ensures that you are the only person who can encrypt the data that is decrypted by the public key.

### Step 2- Copy Public Key

First, [get the IP address](https://phoenixnap.com/kb/how-to-find-ip-address-linux) of the server you want to connect to.

In a terminal window, enter:

```bash
ip a | ifconfig
```

On the **client** system, use the **ssh-copy-id** command to copy the identity information to the **Ubuntu server**:

```bash
ssh-copy-id username@<server_IP>
```

Replace **server_IP** with the actual IP address of your server.

If this is the first time you’re connecting to the server, you may see a message that the authenticity of the host cannot be established:

```bash
The authenticity of host '192.168.0.15 (192.168.0.15)' can't be established. ECDSA key fingerprint is fd:fd:d4:f9:77:fe:73:84:e1:55:00:ad:d6:6d:22:fe. Are you sure you want to continue connecting (yes/no)?
```
The system will check your **client** system for the **id_rsa.pub** key that was previously generated. Then it will prompt you to enter the password for the **server** user account. Type it in (the system won’t display the password), and press **Enter**.
The system will copy the contents of the **~/.ssh/id_rsa.pub** from the **client** system into the **~/.ssh/authorized_keys** directory of the **server** system.

The system should display:

```bash
Number of key(s) added: 1
```

#### Alternate Method to Manually Copy the SSH Key

If your system does not have the **ssh-copy-id** command, you can copy the key manually over the SSH.

Use the following command:
```bash
cat ~/.ssh/id_rsa.pub | ssh username@remote_host "mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && chmod -R go= ~/.ssh && cat >> ~/.ssh/authorized_keys"
```

### Step 3- Log in to the Remote Server
To log in to a remote server, input the command:
```bash
ssh username@server_IP
```
The system should not ask for a password as it is negotiating a secure connection using the SSH keys. If you used a security passphrase, you would be prompted to enter it. After you do so, you are logged in.

**NOTE!: If this is the first time you’ve logged into the server, you may see a message similar to the one in part two. It will ask if you are sure you want to connect – type yes and press Enter.

### Step 4- Disable Password Authentication
This step creates an added layer of security. If you’re the only person logging into the server, you can disable the password. The server will only accept a login with your private key to match the stored public key.

Edit the **sshd_config** file:
```bash
sudo nano /etc/ssh/sshd_config
```
Search the file and find the **PasswordAuthentication** option.

Edit the file and change the value to **no**:
```bash
...
PasswordAuthentication no
...
```
Save the file and exit, then restart the SSH service:
```bash
sudo systemctl restart ssh
```
Verify that SSH is still working before ending the session:
```bash
ssh username@server_IP
```
If everything works, you can close out and resume work normally.

#devops 