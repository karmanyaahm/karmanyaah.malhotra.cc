---
layout: page
permalink: /portfolio/
sidebar_link: false
title: Portfolio of Work
---

This is my overly detailed portfolio, detailing basically everything I have made ever (that is worth sharing). Items with a ⭐ are important.
Roughly reverse chronological within each category.

## Hardware Art/Fun


<div class="extended-image-list">
{% capture postlink %}{% post_url 2023-09-15-hotdog/2023-09-15-hotdog %}{% endcapture %}
{% include imagebox.html url=postlink img="/assets/images/projects/art-hotdog-1.jpg" width="20rem" title="Hot Dog - A Programmable Toy Flamethrower" %}
{% capture postlink %}{% post_url 2023-09-15-sparkletilt/2023-09-15-sparkletilt %}{% endcapture %}
{% include imagebox.html url=postlink img="/assets/images/projects/art-sparkletilt-1.webp" width="20rem" title="Longhorn LED Level PCB" %}
{% include imagebox.html url="https://www.youtube.com/watch?v=JgKoxJk2LYw" img="/assets/images/projects/art-parkinglot-1.webp" width="20rem" title="Model Parking lot with addressable LEDs" %}
{% include imagebox.html url="https://www.youtube.com/watch?v=tMav6zECKzA" img="/assets/images/projects/art-wirefield-1.webp" width="20rem" title="Model Tipping Point field with lights and team song" %}
{% capture postlink %}{% post_url 2023-04-29-amplitie/2023-04-29-amplitie %}{% endcapture %}
{% include imagebox.html url=postlink img="/assets/images/projects/art-amplitie-1.webp" width="20rem" title="Addressable LED Tie" %}
</div>

## Code/Computer Things

Most of my work is in Python, Dart, or Go. Some domain-specific C++.

### [UnifiedPush](https://unifiedpush.org)
<div class="extended-image-list">
{% capture postlink %}{% post_url 2022-12-27-fdroid-up/2022-12-27-fdroid-up %}{% endcapture %}
{% include imagebox.html img="/assets/images/projects/unifiedpush-blog-2.svg" width="20rem" title="⭐⭐My Experience Writing the UnifiedPush Guest blog post w/ F-Droid" url=postlink %}
</div>

- ⭐ Caddy web server (43k stars), Go: [Contribute](https://github.com/caddyserver/caddy/pull/4865) a minor feature: supporting a configurable timeout
- ⭐ Make a [WebPush protocol decryption](https://github.com/UnifiedPush/dart-webpush-encryption) (RFC 8291, 8188) library in Dart for the Flutter ecosystem.

- ⭐ Wrote proof of concepts for push notification infrastructure on Linux based operating systems using the D-Bus messaging system
  - Using [no server](https://github.com/NoProvider2Push/dbus) and the [NextPush server](https://github.com/karmanyaahm/nextpush_dbus). Written in Go.
  - Wrote [a library](https://github.com/karmanyaahm/go_nextcloud_authv2) to easily authenticate to NextCloud in Go Command Line apps.
  - Wrote [a library](https://github.com/UnifiedPush/go_dbus_connector) for Linux apps to use the UnifiedPush API (Go and C).
  - Consult with KDE and [KUnifiedPush](https://invent.kde.org/libraries/kunifiedpush/), the leading push notification library for Mobile Linux.

- ⭐ Wrote, maintain, and host [common-proxies](https://github.com/UnifiedPush/common-proxies): a Go server to convert between UnifiedPush messages and Matrix, Gotify, Firebase Cloud Messaging, and Ubuntu Touch.
  - Contributed IPv6 support to [a dependency](https://github.com/hakobe/paranoidhttp/pull/15)

- Gotify (7.9k stars): Contribute support for public account registration
  - Worked with React for the UI and Go for the backend
  - [final PR](https://github.com/gotify/server/pull/394) / [my individual contributions](https://github.com/p1gp1g/server/pulls?q=is%3Apr+is%3Aclosed)
- ⭐ Wrote a [server API specification](https://github.com/UnifiedPush/specifications/pull/9)
- ⭐ [Official UnifiedPush Documentation site](https://github.com/UnifiedPush/documentation)
  - Made the original site, and continue to maintain it and [host it](#server-stuff).
- Wrote the original Flutter connector plugin [commits](https://github.com/UnifiedPush/flutter-connector/commits?author=karmanyaahm) involving Android Native to Dart VM communication

### Vex Robotics
<div class="extended-image-list">
{% include imagebox.html img="/assets/images/projects/robotics-field-spin-up.webp" width="20rem" title="CSS-based customizable printable field diagram" url="../projects/spin-up-field-diagram" %}
</div>
- Contributed [several features](https://github.com/OkapiLib/OkapiLib/pulls?q=is%3Apr+author%3Akarmanyaahm+) to OkapiLib, (arguably) the most important library in Vex Robotics programming.
- Here's my 2021 [robot code](https://github.com/vex-76513/code). Used a real-time operating system and C++ to operate motors and pneumatics based on user and sensor input. Lots of things being handled.

### Messaging
<div class="extended-image-list">
{% include imagebox.html img="/assets/images/projects/messaging-gmdisc-1.webp" width="20rem" title="⭐ GroupMe-Discord bridge in Golang (reliable, syncing chats since 2020)" url="https://github.com/karmanyaahm/groupme_discord_bridge_v3" %}
</div>
- Wrote an (incomplete) [bridge](https://github.com/karmanyaahm/matrix-groupme-go) between the Matrix and GroupMe chat platforms
  - [Contributed to and improved](https://github.com/densestvoid/groupme/pulls?q=is%3Apr+author%3Akarmanyaahm+) a GroupMe library in Go
  - [Fixed a faye protocol connection library](https://github.com/autogrow/wray/pull/2)
- [Contributed authentication](https://gitlab.com/cactus-comments/cactus-appservice/-/merge_requests/3) to the Cactus Comments server - A Matrix based website comments section
  - [My blog post about that](https://karmanyaah.malhotra.cc/tech/2021/06/website-things/)

### Server stuff

- Report and help debug [an issue](https://github.com/ipfs/kubo/issues/8293) in Go-IPFS
- IPFS Based website host
  - [blog post](https://karmanyaah.malhotra.cc/tech/2021/07/ipfsifying-documentation/#host-setup)
  - [Ansible code on GitLab](https://gitlab.com/karmanyaahm/site-host-deployment)
- My personal server [infrastructure in Ansible](https://gitlab.com/karmanyaahm/infrastructure/-/tree/master/roles)

### Random
<div class="extended-image-list">
{% capture postlink %}{% post_url 2023-08-11-totpv2/2023-08-11-totpv2 %}{% endcapture %}
{% include imagebox.html img="/assets/images/projects/random-totp-1.webp" width="20rem" title="Airgapped, E-Ink TOTP Device" url=postlink %}
{% capture postlink %}{% post_url 2022-12-27-rubber-ducky1/2022-12-27-rubber-ducky1 %}{% endcapture %}
{% include imagebox.html img="/assets/images/projects/random-rubberducky-1.webp" width="20rem" title="Project Oreo: Fast, cheap keystroke injection device v1" url=postlink %}
{% include imagebox.html img="/assets/images/projects/random-scioly-test-1.webp" width="20rem" title="Science Olympiad Test Organizer" url="" %}
</div>

- Wrote a tool in Python (and rewrote in Go) to sort and organize a bunch of files (Science Olympiad Tests) based on their filename, and then upload them to Google Drive. [code](https://github.com/karmanyaahm/test_organization)
- Wrote a Web UI to see the list of the above. [code](https://github.com/karmanyaahm/scioly-test-frontend) [website](https://scioly.karmanyaah.malhotra.cc/)

- Contribute a minor HTML rendering fix to [Celehner's Gemini feed-expanding proxy](https://portal.mozz.us/gemini/celehner.com/proxy/)
- ⭐ Contribute [several features and fixes](https://github.com/snoe/deedum/pulls?q=is%3Apr+author%3Akarmanyaahm+) to the Gemini protocol browser deedum written in Flutter for Android and iOS
- Submit [a critical bugfix](https://lists.sr.ht/~sircmpwn/gmni-devel/patches/23416) to the Gemini server gmnisrv written in C

- A (partially functional) bot to send updates [from Google Classroom to Discord](https://github.com/karmanyaahm/google_classroom_discord_feed)
  - Learned a lot of new tech like OAuth (i.e. Sign in with Google) and Google Cloud Pub Sub messaging.


