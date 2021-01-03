---
title: Testing the Waters
date: 2019-06-19 
modified: 2020-08-26
category: test
status: published
---


## Exploration in markdown

This article is a test post. I'm currently trying to configure writing blog
posts in markdown to be rendered to html. 

The blog will be an __exploration__ of the many novel or re-occurring thoughts
I have.

At first, many of the posts will be reflection on interesting insights from
other blogs or books.  There will be heavy influences from the various blogs I
frequently browse. Some notable mentions:    

- [Derek Sivers](https://sivers.org/ "Derek Sivers")
- [z3bra.org](http://blog.z3bra.org/)
- [Paul Graham](http://paulgraham.com/ "Paul Graham")
- [Melting Asphalt](https://meltingasphalt.com/ "Kevin Simler")

I plan on creating a section on book notes (one step at a time!).

The Fibonacci sequence is defined
$$F_0 = 1, F_1 = 1$$

and

$$F_n = F_{n-1} + F_{n-1}$$

for $n > 1$.


```{haskell}
:::haskell
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)
```


---


##  Text Elements

- The [a element](#) and [external a element](http://example.com) examples

- The <abbr>abbr element</abbr> and an <abbr title="Abbreviation">abbr</abbr> element with title examples

- The <acronym title="A Cowboy Ran One New York Marathon">ACRONYM</acronym> element example

- The **b element** example

- The <cite>cite element</cite> example

- The `code element` example

- The <data value="3967381398">data element</data> example

- The <del>del element</del> example

- The <dfn>dfn element</dfn> and <dfn title="Title text">dfn element with title</dfn> examples

- The _em element_ example

- The _i element_ example

- The <ins>ins element</ins> example

- The <kbd>kbd element</kbd> example

- The <mark>mark element</mark> example

- The <q>q element</q> example

- The <q>q element <q>inside</q> a q element</q> example

- The <s>s element</s> example

- The <samp>samp element</samp> example

- The <small>small element</small> example

- The <span>span element</span> example

- The **strong element** example

- The <sub>sub element</sub> example

- The <sup>sup element</sup> example

- The <time datetime="2005-05-15 19:00">time element</time> example

- The <u>u element</u> example

- The <var>var element</var> example


* * *

## List Types

### Ordered List

1. List Item 1
2. List Item 2
    1. List Item 2.1
    2. List Item 2.2
        1. List Item 2.2.1
        2. List Item 2.2 2
    3. List Item 2.3
3. List Item 3

### Unordered List

* List Item 1
* List Item 2
    * List Item 2.1
    * List Item 2.2
        * List Item 2.2.1
        * List Item 2.2 2
    * List Item 2.3
* List Item 3


***


## Tables

| Table Header 1 | Table Header 2 | Table Header 3 |
| -------------- | -------------- | -------------- |
| Division 1     | Division 2     | Division 3     |
| Division 1     | Division 2     | Division 3     |
| Division 1     | Division 2     | Division 3     |


Finally a quote about ends:   
> When you reach the end of your rope, tie a knot in it and hang on. 
> &mdash; Franklin D. Roosevelt

