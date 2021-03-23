---
title: password store
date: 2020-08-07
slug: password-store
modified: 2020-09-02
status: published
---

After taking more than a few hours to reset my Pass for iOS repository on my
phone, I thought it would be good to write a short guide to setting one up.

Check the [official Pass for iOS
Wiki](https://github.com/yishilin14/asc-key-to-qr-code-gif) to see alternative
methods. Here I only explain one sequence of setting up a the repository.

Assuming your password store is already set up with a local git repository,
create a remote and hidden repository on github. 

Generate a new ssh key pair for cloning into the remote repository:

`puttygen -t rsa -b 2048 -O private-openssh -o pass_for_ios.key` and `puttygen
pass_for_ios.key -C "Pass for iOS" -O public-openssh -o pass_for_ios.pub`

## Importing ASCII-armored keys

Clone into this repo to use the asc2qr.sh script
`https://github.com/4bitfocus/asc-key-to-qr-code` 

(I tried using `https://github.com/yishilin14/asc-key-to-qr-code-gif`
recommended by the guide but it didn't work)

Run `asc2qr.sh pass_for_ios.key` to generate Q1.png qr image which encodes your
ssh key.  Use it as your authentication method.

Similarly for your PGP keys, both public and private, use the script to
generate QR images to import your PGP keys to the app.

---

git repository url:
> ssh://git@github.com/<username>/<repo-name>

branch name:
> master

username
> **git**

Authentication method
> SSH Key

---

Remember to exclude the `.git` from the repo name

That should be all :)


**resetting ssh passphrase**
`ssh-keygen -f ~/.ssh/pass_for_ios.key -p`



