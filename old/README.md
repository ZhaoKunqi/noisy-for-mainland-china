
# Noisy
[![CircleCI](https://circleci.com/gh/1tayH/noisy/tree/master.svg?style=shield)](https://circleci.com/gh/1tayH/noisy/tree/master)

A simple python script that generates random HTTP/DNS traffic noise in the background while you go about your regular web browsing, to make your web traffic data less valuable for selling and for extra obscurity.

Tested on MacOS High Sierra, Ubuntu 16.04 and Raspbian Stretch and is compatable with both Python 2.7 and 3.6

## Getting Started

These instructions will get you a copy of the project up and running on your local machine

### Dependencies

Install `requests` if you do not have it already installed, using `pip`:

```
pip install requests
```
### Usage

Clone the repository
```
git clone https://github.com/1tayH/noisy.git
```

Navigate into the `noisy` directory
```
cd noisy
```

Run the script

```
python noisy.py --config config.json
```

The program can accept a number of command line arguments:
```
$ python noisy.py --help
usage: noisy.py [-h] [--log -l] --config -c [--timeout -t]

optional arguments:
  -h, --help    show this help message and exit
  --log -l      logging level
  --config -c   config file
  --timeout -t  for how long the crawler should be running, in seconds
```
only the config file argument is required.
