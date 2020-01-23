#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""/manage.py
Description: Simple command line tool for development and 
    deployment of the [Template Python Application](with no js)
Project: 
Author: Hunter Mellema
Date: 1/20/2020
"""
#=== Start imports ===# 
# standard library 
import argparse

#=== End imports ===#

def main(args): 
    print(args)


if __name__ == "__main__": 
    parser = argparse.ArgumentParser(description="Manage the [NAME] application deployment and testing")
    parser.add_argument('test', metavar='path', type=str, nargs="+", help='the path to list')
    args = parser.parse_args()
    main(args)