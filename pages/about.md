---
layout: page
permalink: /about/
sidebar_link: true
title: About Me
---

# Karmanyaah's Website

note this stuff below hasn't been updated in a while, i'll get around to it at some point
## Profile

### Code Projects

* [Github](https://github.com/karmanyaahm) -  Basically all my publishable code

### Other Projects

* [Hackaday](https://hackaday.io/karmanyaahm) - A few projects on there

### Work

1. Beachwood High School
   1. Computer Science Club (prev. Computer Security Club)
      * Sep 2019 -
      * [Website](https://bhscomputerscienceclub.github.io)
   2. [Science Olympiad](https://www.soinc.org/)
      * 2020 -
      * Not updated since 2018(as of writing this) <http://bscioly.weebly.com/>
      * Not updated since 2012(as of writing this) <https://sites.google.com/site/bscioly/>
      * Not updated in I don't know how long(as of writing this) <https://scioly.org/wiki/index.php/Beachwood_High_School>
   3. [First Robotics Competition](https://www.firstinspires.org/robotics/frc)
      * Sep 2019 -
      * Bison Robotics (Team 695)
      * <https://frc-events.firstinspires.org/2020/team/695>
      * <https://www.thebluealliance.com/team/695>
      * <https://github.com/FRCTeam695>
2. Beachwood Middle School
   1. Science Olympiad
     * Sep 2018 - March 2020

## [Contact](/contact/)

<ul>
{%for page in site.pages%}
   {%if page.name =="contact.md" %}
      {%assign p = page.content | split: "</ul>" %}
      {%assign p = p[0] | split: "<ul>" %}
      {{p[1]}}
   {%endif%}
{%endfor%}
</ul>

## Other (unimportant) profiles

* Music playlists [on YouTube Music](https://music.youtube.com/browse/UCiBpDtvo8GthIt7cXcR5Gqw)
