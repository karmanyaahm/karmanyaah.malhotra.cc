---
tags: 
  - meta 
  - comments
  - self_hosting
  - blog
category: tech
date: 2021-06-13 02:00 -0400
title: My website redesign
commentslug: 2106-website-redesign
---

Hello World from my website redesign. + some thoughts on comment systems.

The design isn't really new, I got it from [System Overlord](//systemoverlord.com/)'s website, which I really liked. It's the [Hydeout theme](//fongandrew.github.io/hydeout/) for Jekyll. It'll remove some of the old bloat from the other theme and hopefully make my site simpler and more accessible with some upcoming changes. + dark mode

Additionally, in the past few days, the deployment of this site also changed. I went from using GitHub Pages, which is very nice but doesn't support IPv6, to using a self-hosted IPFS Gateway. The Gateway is the same one that [UnifiedPush](//unifiedpush.org) and my Science Olympiad tests list uses. The new deployment process is now just a `make deploy` away. The deploy script is [available in this website's repo](//github.com/karmanyaahm/karmanyaahm.github.io/blob/code/_deploy.sh). My website is DNSLinked to IPNS, and then the script published to that IPNS key. The server pins and resolves the key every 10 minutes, so the data goes there.

Additionally, this website now has a comment system using [Cactus Comments](//cactus.chat). I've wanted to set up a comments section for a long time, but didn't find the right solution. There are three primary models of comments on the web that I've seen.

1. Make the whole website dynamic and render it on request. Something like Wordpress would do this. There are obvious downsides to a setup like this ranging from needing a server component to making what really should be a couple of HTML pages into a huge mess with a huge attack surface. This option was totally out for me.

2. Use regular static sites, with something that updates the codebase using merge requests. Comments are not *really* part of my *core* website, so it seemed kinda wrong. Comments should just be a means of communication and reaction, not a method of providing valuable information. If someone has valuable information to share, that should be in their own blog post or on a social platform.

3. Have comments sidecar onto the website using some sort of embedding, like Javascript or even an iFrame. This __semantically__ made the most sense to me. This also seems to make sense to other people which is why Disqus is such a popular commenting service. It's easy to setup and doesn't require major modifications to the website.

My problem with Disqus is that I didn't want an important part of my site to depend on a centralized service with a lot of tracking. I found some alternatives like [embedding Mastodon](//carlschwan.eu), and [embedding Discourse](//meta.discourse.org/t/embedding-discourse-comments-via-javascript/31963). There are also some dedicated comments solutions out there, but neither of these impressed me enough that I immediately wanted to set it up. So, I procrastinated for months, because none of the solutions were "aha! amazing".

Then, on [This Week in Matrix](https://matrix.org/blog/category/this-week-in-matrix) (recommend subscribing btw if ur not already) I saw Cactus Comments. That gave me the "aha! perfect" because I'm already running a Matrix server, and it followed method 3 of embedding. Additionally, the great part (tho one that the Mastodon solution also shares) is that you don't *need* Javascript to run it. I can embed a link to the Matrix room in a `noscript` tag, and people who prefer not to use JS can use that. This also works on a Gemlog (still on my TODO list), which made it perfect. And, it's a real comments solution for most people who comment directly on my blog.

So, I decided on Cactus, now onto setting up my own appservice (which is stateless btw so no DB required really nice), I noticed that a missing feature, which was pretty important for me; the appservice was open to anyone to register by default. While for a regular thing I wouldn't mind that as much, Synapse is already really heavy on my 1GB Linode so I wanted to restrict it. This was also issue #5 on the [Cactus Appservice repo](https://gitlab.com/cactus-comments/cactus-appservice). And since the appservice was really simple, and in Python, I submitted a patch in merge request !3. The appservice is stable at about 30MB of memory right now.

Then, I finally got around to setting it up today, and as I was running into a CSS mess with the work past me had done, I just ended up installing the new theme.

Thanks for reading. Please leave a comment!

P.S. I set up Cactus such that it inits 5 seconds after the page loads, so all the Matrix requests don't slow down the initial load.
