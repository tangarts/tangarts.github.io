#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = 'Nehemiah Tang-Campbell'
SITENAME = 'tangarts'
SITEURL = ''

DEFAULT_DATE_FORMAT = '%Y-%m-%d'

PATH = 'content'

STATIC_PATHS = [
    'images',
    'pdfs',
    'extra/favicon.ico.gz',
]

EXTRA_PATH_METADATA = {
    'extra/favicon.ico.gz': {'path': 'favicon.ico.gz'},
}

STATIC_URL = '{path}'
STATIC_SAVE_AS = '{path}'

PAGE_URL = '{slug}'
PAGE_SAVE_AS = '{slug}.html'

TAG_SAVE_AS = ''
CATEGORY_SAVE_AS = ''
AUTHOR_SAVE_AS = ''


DISPLAY_CATEGORIES_ON_MENU = False
TIMEZONE = 'Europe/London'

DEFAULT_LANG = 'en'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

# DEFAULT_PAGINATION = 10
DISPLAY_PAGES_ON_MENU = False # hide pages from navigation menu

DEFAULT_METADATA = {
    'status': 'draft',
}

READERS = {'html': None}

THEME = 'theme'
THEME_STATIC_DIR = 'static'
THEME_STATIC_PATHS = ['static']
CSS_FILE = 'style.css'

GITHUB_URL = 'https://github.com/tangarts'
