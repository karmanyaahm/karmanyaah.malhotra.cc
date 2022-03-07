---
layout: page
permalink: /about/
sidebar_link: true
title: About Me
---

Updated in March 2022
## Profile/Resume

### Code Projects

* [Github](https://github.com/karmanyaahm) -  Basically all my publishable code
* [UnifiedPush](https://unifiedpush.org) is the most important project I'm currently part of

### Other Projects

* [Hackaday](https://hackaday.io/karmanyaahm) - A few projects on there

### Work

1. Belton High School
   1. Vex Robotics Competition
     * Sep 2021 - Present
     * Team [76513B](https://www.robotevents.com/teams/VRC/76513B)
     * primary Programmer and co-Designer
     * 2021-22 - Tipping Point: Design Award (4th best award, 3rd best team by awards) at States - Qualified for the World Championship
1. Beachwood High School
   1. Computer Science Club (prev. Computer Security Club)
      * Sep 2019 - May 2021
      * Leadership commitee, participated in pretty much every event
      * [Website](https://bhscomputerscienceclub.github.io)
   2. [Science Olympiad](https://www.soinc.org/)
      * Sep 2020 - May 2021
      * [More Info]({% link pages/about/scioly.md %})
      * {% details Websites %}
not updated since:
* 2018 <http://bscioly.weebly.com/>
* 2012 <https://sites.google.com/site/bscioly/>
* I don't know how long(as of writing this) <https://scioly.org/wiki/index.php/Beachwood_High_School>
        {% enddetails %}
   3. [First Robotics Competition](https://www.firstinspires.org/robotics/frc)
      * Sep 2019 - May 2021
      * Junior Programmer @ Bison Robotics (Team 695)
      * <https://frc-events.firstinspires.org/2020/team/695>
      * <https://www.thebluealliance.com/team/695>
      * <https://github.com/FRCTeam695>
2. Beachwood Middle School
   1. Science Olympiad
     * Sep 2018 - March 2020
     * [More Info]({% link pages/about/scioly.md %})

## Standardized Testing

### SAT
* TBD - March 2021
#### PSAT

* Oct 2021: 1460/1520 - 700/760 Reading & Writing - 760/760 Math 
* Oct 2020: 1380/1520 - 650/760 Reading & Writing - 730/760 Math

### AP

5 (out of 5)
: AP Calculus AB (May 2020)
: AP Calculus BC (May 2021)
: AP Physics 1 (May 2021)
: AP Physics 2 (May 2021)
: AP Computer Science A (May 2021)

## [Contact](/contact/)

<ul>
{%for page in site.pages%}
   {%if page.name =="contact.md" %}
      {%assign p = page.content | markdownify | split: "</ul>" %}
      {%assign p = p[0] | split: "<ul>" %}
      {{p[1]}}
   {%endif%}
{%endfor%}
</ul>

