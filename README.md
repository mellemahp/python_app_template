# python_app_template
A simple template for a python web application

Two separate styles of build are provided: 
1) Python server that needs to serve javascript. Here we provide a simple SPA setup
2) Python server that provides JSON rest responses

Dockerfiles for both are provided that allow a user to run an auto-updating development server

## Introduction
The idea for how to build this comes primarily from the following two sources (thanks!): 
- https://www.robnagler.com/2015/08/24/Dispatch-Do-not-Decorate.html 
- https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world
- https://github.com/mattupstate/overholt

I also pulled some of the code directly from another one of my projects that I did with : 
- https://github.com/mellemahp/neuroscopes

I really prefer having yaml to define my routes. This is just a personal preference and it does not conform to any standard. I just think it's nicer to have things in yaml. 

Each repo also comes with a simply python command line tool for building, testing, etc. 

