#!/usr/bin/env python3
import os
import time

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


def get_today_picture_url(token):
    today = time.strftime("%Y-%m-%d")
    url = ('https://api.momentumdash.com/'
           'feed/bulk?syncTypes=backgrounds&localDate={today}'.
           format(today=today))
    headers = {
        'Authorization': 'Bearer {}'.format(token),
    }
    res = requests.get(url, headers=headers).json()
    first_picture = res.get('backgrounds')[0].get('filename')
    return first_picture


def download_picture(url):
    current_dir = os.path.dirname(os.path.realpath(__file__))
    destination = os.path.join(current_dir, 'today_picture.jpg')
    res = requests.get(url)
    with open(destination, 'wb') as f:
        f.write(res.content)
    return destination


def main():
    token = get_momentum_token()
    today_picture_url = get_today_picture_url(token)
    download_picture(today_picture_url)


if __name__ == "__main__":
    main()
