---
title: python-idioms
slug: python-idioms
date: 2020-03-22
status: published
---

**A collection of python idioms and design patterns**

### What idioms should I use to make my code easier to read? 


**Build strings as a list and use `''.join` at the end.p** 

Join is a string method called on the separator, not the list. Calling it from
the empty string concatenates the pieces with no separator, which is a Python
quirk and rather surprising at first. This is important: **string building with
+ is quadratic time instead of linear!** If you learn one idiom, learn this
  one.

**Wrong:** `for s in strings: result += s`  
**Right:** `result = ''.join(strings)`

**Use `in` wherever possible.**

**Use `if not x` instead of `if x == 0`.**

**To reverse-sort a list, use: `list.sort()` or `list.reverse()`**

Catch errors rather than avoiding them to avoid cluttering your code with
special cases.  This idiom is called EAFP ('easier to ask forgiveness than
permission'), as opposed to LBYL ('look before you leap').
This often makes the code more readable. For example:

**Worse:**

```python

#check whether int conversion will raise an error
if not isinstance(s, str) or not s.isdigit:
    return None
elif len(s) > 10:    #too many digits for int conversion
    return None
else:
    return int(str)
```

**Better:**

```python
try:
    return int(str)
except (TypeError, ValueError, OverflowError): #int conversion failed
    return None
```

### What techniques should I use to make my code run faster? 		

Profile before optimizing for speed: optimize for readability first

Build strings as a list and use `''.join()` at the end. **(Super important)**

**Use `map` and/or `filter` to apply functions to lists.**

`map` applies a function to each item in a list (technically, sequence) and
returns a list of the results.  
`filter` applies a function to each item in a sequence, and returns a list
containing only those items for which the function evaluated True (using the
__nonzero__ built-in method).  
These functions can make code much shorter. 
They also make it much faster, since the loop takes place entirely in the C API
and never has to bind loop variables to Python objects.

**Worse:**
```python
strings = []
for d in data:
    strings.append(str(d))
```

**Better:**
```python
strings = map(str, data)
```

### **Use function factories to create utility functions.**

```
def multiply_by_field(fieldname, multiplier):
    """Returns function that multiplies field "fieldname" by multiplier."""
    def multiplier(x):
        return getattr(x, fieldname) * multiplier
    return multiplier

triple = multiply_by_field('Count', 3)
quadruple = multiply_by_field('Count', 4)
halve_sum = multiply_by_field('Sum', 0.5)
```

python file names `calc_squares.py` over `calc-squares.py` as second cannot be
imported though single name module names are best.

### packagin packages

```python
package/
  __init__.py        -- contains functions a(), b()
  other.py           -- contains function c()
  subdir/
     __init__.py     -- contains function d()
```

```python
import package
package.a()
package.b()

import package.other
package.other.c()

import package.subdir
package.subdir.d()
``` 

*note:* hierarchies of packages more than two deep are annoying to develop on

```python
""" 
Docstrings
---------

"Good" docstring coding is used to provide additional information about functionality 
beyond what can be discovered automatically by introspection
"""
```

### testing, testing, testing...

**An Introduction to Testing Concepts**

Unit tests are tests for fairly small and specific units of functionality.
Functional tests test entire functional paths through your code. 
Regression tests make sure that (within the resolution of your records) your program's output has not changed.

All three types of tests are necessary in different ways.

Regression tests tell you when unexpected changes in behavior occur, and can
reassure you that your basic data processing is still working.  For scientists,
this is particularly important if you are trying to link past research results
to new research results: if you can no longer replicate your original results
with your updated code, then you must regard your code with suspicion, unless
the changes are intentional.

Both unit and functional tests tend to be expectation based.  you use the tests
to lay out what behavior you expect from your code, and write your tests so
that they assert that those expectations are met.

Unit tests tend to be much shorter and require less setup and teardown, while
functional tests can be quite long.  functional tests tell you when your code
is broken, while unit tests tell you where your code is broken.  because of the
finer granularity of unit tests, a broken unit test can identify a particular
piece of code as the source of an error, while functional tests merely tell you
that a feature is broken.

### Adding tests to existing project 


First, start by writing a test for each bug as they are discovered.
isolate the cause of the bug; write a test that demonstrates the bug; fix the
bug; verify that the test passes.

Next, take out some time -- half a day or so -- and write fixtures and
functional tests for some small chunk of code; if you can, pick a piece of code
that you're planning to clean up or extend. Don't worry about being exhaustive,
just write tests that target the main point of the code that you're working on.

Repeat this a few times. 

Use code coverage analysis to analyze what code your tests cover, and what code
isn't covered.  At this point you can take a targetted approach and spend some
time writing tests aimed directly at uncovered areas of code.  There should now
be tests that cover 30-50% of your code, at least (it's very easy to attain
this level of code coverage!).

Once you've reached this point, you can either decide to focus on increasing
your code coverage, or you can simply continue incrementally constraining your
code by writing tests for bugs and new features.  Assuming you have a fairly
normal code churn, you should get to the point of 70-80% coverage within a few
months to a few years (depending on the size of the project!)


**Cache decorator**
```python
def simple_cache(fn):
    cache = {}

    def new_fn(n):
        if n in cache:
            print 'FOUND IN CACHE; RETURNING'
            return cache[n]
            
        # otherwise, call function & record value
        val = fn(n)
        cache[n] = val
        return val
    return new_fn
@simplecache
f()
```


This approach is effective because at each stage you get immediate feedback
from your efforts, and it's easier to justify to managers than a whole-team
effort to add testing. Plus, if you're unfamiliar with testing or with parts of
the code base, it gives you time to adjust and adapt your approach to the needs
of the particular project.

---

see also: 

- [10 tips for pythonic code](https://www.youtube.com/watch?v=_O23jIXsshs)
- [ten-tips-for-pythonic-coten-tips-for-pythonic-code](https://github.com/mikeckennedy/ten-tips-for-pythonic-code-jetbrains-webcast/blob/master/)




