#!/usr/bin/env python

import argparse
import blockies


class Argparser:  # pylint: disable=too-few-public-methods
    """Argparser class."""

    def __init__(self):
        self.parser = argparse.ArgumentParser()
        self.parser.add_argument(
            "--seed",
            "-s",
            type=str,
            help="seed phrase",
            default="",
        )
        self.parser.add_argument(
            "--out",
            "-o",
            type=str,
            help="output path",
            default="./identicon.png",
        )
        self.parser.add_argument(
            "--fgcolor",
            "-f",
            type=str,
            help="foreground color",
            default=None,
        )
        self.parser.add_argument(
            "--bgcolor",
            "-b",
            type=str,
            help="background color",
            default=None,
        )
        self.parser.add_argument(
            "--spotcolor",
            "-p",
            type=str,
            help="spot color",
            default=None,
        )
        self.parser.add_argument(
            "--size",
            "-z",
            type=int,
            help="size of image, in blocks",
            default=10,
        )
        self.parser.add_argument(
            "--scale",
            "-c",
            type=int,
            help='size of individual "pixels"',
            default=100,
        )
        self.args = self.parser.parse_args()


def main() -> None:
    argparser = Argparser()
    if argparser.args.seed == "":
        with open(
            "../terminaldweller.com/main/srv/.well-known/openpgpkey/hu/gpg_pubkey.asc",
            mode="rb",
        ) as gpg_pubkey:
            key_content = gpg_pubkey.read()

            data = blockies.create(str(key_content), size=10, scale=100)
            with open("identicon.png", "wb") as png:
                png.write(data)
    else:
        data = blockies.create(
            argparser.args.seed,
            size=argparser.args.size,
            scale=argparser.args.scale,
            color=argparser.args.fgcolor,
            bgcolor=argparser.args.bgcolor,
            spotcolor=argparser.args.spotcolor,
        )
        with open(argparser.args.out, "wb") as png:
            png.write(data)


if __name__ == "__main__":
    main()
