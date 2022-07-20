---  
tags:
  - math
  - code
  - euler's number
category: puzzles  
date: 2022-06-02 22:00 -0600  
title: Tetration  
commentslug: 2022-tetration  
toc: true  
mathjax: true  
---

This post is a reply to the puzzle in <https://stanfordirl.com/grant-sanderson-bs15>

> We’d gone onto the topic of tetration and Grant was determined to show me the magic of it. Tetration is a recursive exponential operation in which tetration(a, 1) is just a; tetration(a, 2) is when you raise a to the power of a; tetration(a, 3) is when you raise a to the power of tetration(a, 2) and so on. Written in its mathematical notation, tetration looks like a tower.

$$
\large{\ \atop {\ }} { {\underbrace{a^{a^{\cdot^{\cdot^{a}}}}}} \atop n}
$$  

> “Consider 2. With 2 layers, it’s 4. With 3 layers, it’s 16. With 4 layers, it’s 65,536. Still manageable, right? Then with 5 layers, it’s 2 to the power of 65,536. More than the number of atoms in the universe. We can’t even grasp how big it is. But if instead of using 2, we start with 1.01. No matter how many layers there are, the value will never exceed 10. There’s a finite upper-bound on the tetration with base 1.01. Don’t believe me? Let me show you. My question is between 1.01 and 2, at which point does it change from having a finite upper-bound to going to infinity?”

So, of course, this problem [sniped](https://xkcd.com/356/) me, so [a friend](https://www.instagram.com/bunnyrabbit022/) and I set out to solve it. I'm sure it has been solved a million times before, but here's my take on it.

***Spoilers ahead, you should try it yourself once***

---

There's no elegant mathematical proof here, I just brute-forced the number.

Firstly, to compute the tetration $${^{n}a}$$ (aka $${a \uparrow \uparrow n}$$), I used the following

```python
a = 1.01
c = a
for _ in range(int(1e4)): c = a ** c
```
To get close enough to an infinite tetration, n can be set to something like `1e4` (aka $$1\times10^{4} = 10000$$). That will compute a tower 10000 high. It's not perfect, but it's a fast way of narrowing down the boundary.

Then, I wrote this python loop
```python
i=1.01  
while True:  
	i += 1e-3
	a = i  
	for _ in range(int(1e4)): a = i ** a  
	print(i, a)  
	if a > 1e100: breakexcpet
```
Now, it will iterate through $$a$$ values like 1.01, 1.011, 1.012, on and on until the result ends up being an extremely large number.

Basically, here I found out that 
$$\begin{eqnarray}
{^{1000}1.443=2.587} \\
{^{1000}1.445=\infty}
\end{eqnarray}$$

So I started my search again, with `i = 1.443` (the start of the search), the increment = `1e-5`, and n = `1e5` (height of the tetration tower).
Fast forward several minutes and I get
```
1.44466000000000 2.70356385707107  
1.44467000000000 +infinity
```

🤔 That result of the tetration is getting awfully close to a very special number
<details><summary></summary> $$e=2.71828182845905$$</details>

Anyways, I just went ahead narrowing down the results as above, and found out the switching over point `a` is $$1.444667861 <= a < 1.444667862$$

```
1.44466786100000 2.71826527257682  
1.44466786200000 +infinity
```

The result of the tetration here is also `e` to 4 decimal places, so I'm pretty sure if I continued on with this I would arrive at $${^{\infty}a}=e$$.
I didn't recognize this value so I just decided to search it up in the OEIS (Online Encyclopedia of Integer Sequences) which led me to [A073229](https://oeis.org/A073229)

$$
1.4446678 \simeq e^{1/e} = e^{e^{-1}} = \sqrt[e]{e}
$$

So the infinite tetration of the *e*th root of *e*:
$$
{^{\infty}{(e^{1/e})}}={^{\infty}{\sqrt[e]{e}}}={(e^{1/e})}^{ {({e^{1/e}})}^{\cdot^{\cdot^{({e^{1/e}})}}}}=e
$$


I'm a little bit surprised. I shouldn't be, because *e*, the grandmaster of calculus does show up in some extremely weird places, but I am a little bit surprised that both sides of the equation were *e* and no other constant got involved.

Now I gotta mathamatically justify it. Playing with infinite series is dangerous, especially ones that are the border between convergent and divergent, Don't Try This At Home™ (actually do, math is cool). Also, none of the following might be valid because infinite series are weird, but it does confirm our findings.


$$\huge\begin{eqnarray}
{(e^\frac{1}{e})}^{ {({e^\frac{1}{e}})}^{ {({e^\frac{1}{e}})}^{\cdot^{\cdot}}}}=e \\
{e^{(\frac{1}{e}\times{e)^{(\frac{1}{e}\times{e)^{(\frac{1}{e}\times{e^{\cdot)}}}}}}}}=e \\
{e^{(\frac{1}{e}\times{e)^{(\frac{1}{e}\times{e^1)}}}}}=e \\
{e^{(\frac{1}{e}\times{e^1})}}=e \\
{e^1}=e \\
\end{eqnarray}$$

So, using basic exponent properties, we can cancel out all the *e* and *1/e* exponents to leave just an *e*.


Therefore, the answer to the question "between 1.01 and 2, at which point does [the tetration] change from having a finite upper-bound to going to infinity?", the *e*th root of *e*, 1.44467...

**Notes**:
1. Thanks Wikipedia community for the tetration LaTeX
2. Thanks MathJax and all the LaTeX learning resources
3. Thanks [the friend](https://www.instagram.com/bunnyrabbit022/) for helping me solve this and edit this post

