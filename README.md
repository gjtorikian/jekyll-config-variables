jekyll-verison-helper
=======================

This gem incorporates two additional features for Jekyll sites.

## Variables within *_config.yml* files

You can define a variable within a *_config.yml* file and refer to it through the same file.

To do that, first, create a key called `variables`, and populate it with any set of variable names you like:

``` yaml
variables:
  latest_version: "2.0"
```

In this case, a new variable called `latest_version` is available to use, and it's defined a `"2.0"`. You can use this variable throughout your YAML file with the `%{...}` notation. For example:

``` yaml
defaults:
  -
    scope:
      path: ""
      type: "source"
      values:
        version: "%{latest_version}"
```

This sets a frontmatter of `version` on all the files in the `source` collection. It uses whatever value is defined in `latest_version` to set that up.

## New permalink variable, `:dirpath`

The `:dirpath` variable can be used as a shortcut in your permalinking options:

``` yaml
collections:
  source:
    output: true
    permalink: '/output/:dirpath'
```

`:dirpath` is the base path of a file. It differs from `:path` in that it does not manipulate two special paths: `index` and `search`. If you have a file with these basenames, they will be output exactly as-is. Otherwise, when using `:path`, these files are nested within subfolders.
