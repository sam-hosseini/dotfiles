#!/usr/bin/env python3
import os
import sys
import time
import uuid

import requests


def get_momentum_token():
    payload = {
        'username': os.getenv('MOMENTUM_USERNAME'),
        'password': os.getenv('MOMENTUM_PASSWORD'),
    }
    url = 'https://api.momentumdash.com/user/authenticate'
    res = requests.post(url, json=payload).json()
    return res.get('token')


def get_today_picture_url(token):
    today = time.strftime("%Y-%m-%d")
    url = ('https://api.momentumdash.com/'
           'feed/bulk?syncTypes=backgrounds&localDate={today}'.
           format(today=today))
    headers = {
        'Authorization': 'Bearer {}'.format(token),
    }
    res = requests.get(url, headers=headers).json()

    if res.get('success') is False:
        print('Momentum API has failed...')
        sys.exit(0)

    picture = res.get('backgrounds')[0].get('filename')
    return picture


def write_todays_picture(
        response_object, directory_path, randomize_filename=False):
    filename = 'todays_picture.jpg'
    if randomize_filename:
        filename = 'todays_picture_{}.jpg'.format(uuid.uuid4())

    destination = os.path.join(directory_path, filename)
    with open(destination, 'wb') as f:
        f.write(response_object.content)


def download_picture(url):
    current_dir = os.path.dirname(os.path.realpath(__file__))
    dropbox_dir = os.path.join(os.path.expanduser('~'), 'Dropbox', 'Pictures')
    res = requests.get(url)
    write_todays_picture(res, current_dir)
    # randomizing the filename so that Dropbox would trigger hooks
    # that ifttt applets can collect and download the picture to my phone
    write_todays_picture(res, dropbox_dir, randomize_filename=True)


def main():
    token = get_momentum_token()
    today_picture_url = get_today_picture_url(token)
    download_picture(today_picture_url)


if __name__ == "__main__":
    main()
