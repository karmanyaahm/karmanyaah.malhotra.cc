---
layout: page
permalink: /about/
sidebar_link: true
title: About Me
---

Updated in March 2022
## Profile/Resume

### Projects

* Check out my [Full Portfolio of Work](/portfolio/)

### Work

1. University of Texas at Austin - Computer Science
   - Aug 2023 - Present
1. Belton High School
   1. Vex Robotics Competition
     * Sep 2021 - Feb 2023
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
      * {% details Websites %}
* <https://frc-events.firstinspires.org/2020/team/695>
* <https://www.thebluealliance.com/team/695>
* <https://github.com/FRCTeam695>
        {% enddetails %}
2. Beachwood Middle School
   1. Science Olympiad
     * Sep 2018 - March 2020
     * [More Info]({% link pages/about/scioly.md %})

## Standardized Testing

### ACT
* Sep 2022: 35/36 - 36 Math - 36 Science - 34 Reading - 32 English Writing

### SAT
* Oct 2022: 1560/1600 - 800/800 Math - 760/800 Reading & Writing
<!--* Mar 2022: 1480/1600 - 790/800 Math - 690/800 Reading & Writing-->

### PSAT

* Oct 2021: 1460/1520 - 760/760 Math - 700/760 Reading & Writing
<!--* Oct 2020: 1380/1520 - 730/760 Math - 650/760 Reading & Writing-->

### AP

5 (out of 5)
: AP Calculus AB (2020)
: AP Calculus BC (2021)
: AP Physics 1 (2021)
: AP Physics 2 (2021)
: AP Computer Science A (2021)
: AP Physics C Mechanics (2022)
: AP Physics C E&M (2022)
: AP Psychology (2022)
: AP Statistics (2022)
: AP Macroeconomics (2023)
: AP Chemistry (2023)
<!-- 3 on AP Gov -->

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


