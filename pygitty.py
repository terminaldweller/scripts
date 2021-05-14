#!/usr/bin/env python3

from github import Github
import json
import argparse

class Argparser(object):
    def __init__(self):
        parser = argparse.ArgumentParser()
        parser.add_argument("--repo", type=str, help="repo to look for")
        self.args = parser.parse_args()

def main():
    argparser = Argparser()
    passwd = json.load(open("/home/bloodstalker/scripts/github.json"))["pass"]
    g = Github(passwd)
    repo = g.get_repo(argparser.args.repo)
    print(repo.stargazers_count)

if __name__ == "__main__":
    main()
