#!/usr/bin/env python3
import os
import sys
import time
import argparse

import requests
import dotenv


def get_momentum_token():
    dotenv.load_dotenv(dotenv.find_dotenv())
    payload = {
        'username': os.getenv('momentum_username'),
        'password': os.getenv('momentum_password'),
    }
    url = 'https://api.momentumdash.com/user/authenticate'
    res = requests.post(url, json=payload).json()
    return res.get('token')


def get_today_picture_url(token, other_picture):
    today = time.strftime("%Y-%m-%d")
    url = ('https://api.momentumdash.com/'
           'feed/bulk?syncTypes=backgrounds&localDate={today}'.
           format(today=today))
    headers = {
        'Authorization': 'Bearer {}'.format(token),
    }
    # there are two pictures per day anyway
    picture_number = 1 if other_picture else 0
    res = requests.get(url, headers=headers).json()

    if res.get('success') is False:
        print('Momentum API has failed...')
        sys.exit(0)

    picture = res.get('backgrounds')[picture_number].get('filename')
    return picture


def write_todays_picture(response_object, directory_path):
    destination = os.path.join(directory_path, 'todays_picture.jpg')
    with open(destination, 'wb') as f:
        f.write(response_object.content)


def download_picture(url):
    current_dir = os.path.dirname(os.path.realpath(__file__))
    dropbox_dir = os.path.join(os.path.expanduser('~'), 'Dropbox', 'Pictures')
    res = requests.get(url)
    write_todays_picture(res, current_dir)
    write_todays_picture(res, dropbox_dir)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '--other-picture', action='store_true', required=False)
    args = parser.parse_args()

    token = get_momentum_token()
    today_picture_url = get_today_picture_url(token, args.other_picture)
    download_picture(today_picture_url)


if __name__ == "__main__":
    main()
