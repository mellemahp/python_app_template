# python_app_template
A simple template for a python web application

Two separate styles of build are provided: 
1) Python server that needs to serve javascript. Here we provide a simple SPA setup
2) Python server that provides JSON rest responses

Dockerfiles for both are provided that allow a user to run an auto-updating development server

## Introduction
The idea for how to build this comes primarily from the following few sources (thanks!): 
- https://www.robnagler.com/2015/08/24/Dispatch-Do-not-Decorate.html 
- https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world
- https://github.com/mattupstate/overholt

I also pulled some of the html template code directly from another one of my side projects that I did with @rconnorjohnstone: 
- https://github.com/mellemahp/neuroscopes

While I was inspired mostly by flask projects I decided to implement this using Bottle.py. Why? Well, I just dont use much of flask. For most auth-related and db things I pull in libraries that do not require flask and work just fine on their own. As such I wanted to see how much I could pare down the project to just the bare essentials without adding the more powerful tools flask would provide. Honestly I havent even noticed the difference much. The other advantage here is that according to at least this (source)[https://klen.github.io/py-frameworks-bench/08.2015.html] bottle is a little bit faster than Flask. 

I also chose to use uwsgi. Why? Well, it's simple, highly configurable, production capable, and a fairly fast relative to some of the other options like cherrypy (probably because uwsgi is not pure python). It's no Bjoern, but I'd rather have something that I can easily configure for a production environment than pure speed. I would probably throw this all behind an Nginx proxy if I were to deploy it on a server (*I may add a docker-compose file to demonstrate that*)


I really prefer having toml to define my routes. This is just a personal preference and it does not conform to any api spec standard like OpenApi. 

Each repo also comes with a simply python command line tool for building, testing, etc. 

