<!-- no toc -->
# Derek Banas Code!

<!-- no toc -->
## Table of Contents
  - [To Derek](#to-derek)
  - [About](#about)
  - [Usage](#usage)
    - [1. Initial Setup (one-time)](#1-initial-setup-one-time)
    - [2. Clone this repository (one-time)](#2-clone-this-repository-one-time)
    - [3. Pull / Build the Docker Images with `make.sh` (one-time)](#3-pull--build-the-docker-images-with-makesh-one-time)
    - [4. Edit the markdown! (every time)](#4-edit-the-markdown-every-time)
    - [5. Build the site and markdown at once (every time)](#5-build-the-site-and-markdown-at-once-every-time)

## To Derek

**TL;DR** Can my younger siblings beautify your additional readings for you?

Hi Derek! My name is Eric. I've been a **huge** fan of your videos since my second year of college. I graduated in April 2020.

When I saw your course, I **immediately** bought it for my younger brother and sister because I thought it would be the ultimate way to get them into coding.

My brother Jared (20) wants to study something engineering-related. And my sister Faith (18) is studying economics.

When I saw the readings that go with your course, I instantly wanted to make them colorful. I've been using a tool called [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) recently and I thought it would be perfect for this. After some googling, I was able to generate a pdf from markdown file that keeps the beautiful formatting.

I was thinking you could use it to keep all of your additional readings as version controlled markdown files. Whenever you make a change, you can just regenerate the PDFs using the `make.sh` script (which starts Docker containers that do the actual work so that installation is simpler).

If you like how it looks, we could make this repository private and you could use this setup for your course. What I **really** want to ask is whether you'd consider actually hiring my younger siblings to convert the rest of your documentation to markdown/PDFs for you. You could pay them however much you thought was fair. I'll help them fix anything if any technical problems arise.

For reference, it took me a little over 35 minutes to rewrite your first reading as markdown. That was after already learning the tool, setup, etc. It took longer than I was expecting, because there's some thinking about the design/layout that you have to do as you write the markdown.

I think it would be a really great experience for them to practice `git`, `markdown`, the `linux terminal`, and even some basic web development while doing something meaningful. They'd also get to spend a lot of extra time with your `python` readings which will help them learn it as they take your course.

Regardless of what you decide, we're planning on taking your course all together, and you could absolutely just do this yourself with this repository if you wanted to... or with any other tool for that matter.

Your fans,

Eric, Jared, and Faith

## About

This project uses a tool called [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/), which is actually meant for generating beautiful technical documentation from markdown files.

We've configured Material for MkDocs to generate a website from your markdown files using the official `squidfunk/mkdocs-material` docker image.

After the website is generated, we just run a python script using library called `pyhtml2pdf` on the generated `HTML`/`CSS`/`Javascript` files (btw I reference your videos on those all the time, haha).

So the development process looks something like this:

1. start up the mkdocs development server and write markdown while referencing the mkdocs documentation
2. build a `site/` folder containing the web files generated from the markdown
3. run `pyhtml2pdf` on the web files

## Usage

We tried to make the development process as simple as possible.

### 1. Initial Setup (one-time)

Install [Docker Desktop](https://www.docker.com/products/docker-desktop) if you're using windows/macOS or just docker if your using Linux.

(Optional) Install **VS Code**. The `.vscode/` settings folder is committed with settings all ready to go. The **Markdown All in One** VS Code extension makes the markdown writing process really nice. Paste this extension ID in the VS Code extensions store to find it: `yzhang.markdown-all-in-one`.

### 2. Clone this repository (one-time)

### 3. Pull / Build the Docker Images with `make.sh` (one-time)

``` bash
cd derek-banas/

# build/pull the mkdocs & pyhtml2pdf
/bin/bash make.sh build-images
```

### 4. Edit the markdown! (every time)

You can find the markdown files in the `docs/` folder.

The flavor of markdown is technically called `pymarkdown`. It supports everything `GitHub markdown` supports and quite a bit more.

The [MkDocs reference documentation](https://squidfunk.github.io/mkdocs-material/reference/abbreviations/) is fantastic... maybe that's partly because they use this very tool to write their own gorgeous documentation. Reference it as you go.

### 5. Build the site and markdown at once (every time)

``` bash
# generate the site files and then PDFs from those files
/bin/bash make.sh build
```

