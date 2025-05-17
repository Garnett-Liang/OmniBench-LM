# -*- coding: utf-8 -*-

import requests
import time
from tqdm import tqdm
import json
import os

def get_category_pages(category, continue_token=None):
    """Obtain all category links from Wikipedia"""
    base_url = "https://en.wikipedia.org/w/api.php"
    params = {
        "action": "query",
        "list": "categorymembers",
        "cmtitle": f"Category:{category}",
        "cmlimit": "max",
        "format": "json",
        "cmcontinue": continue_token  # For handling continuation
    }

    response = requests.get(base_url, params=params)
    data = response.json()

    pages = data.get("query", {}).get("categorymembers", [])
    next_continue_token = data.get("continue", {}).get("cmcontinue", None)

    return pages, next_continue_token


def save_links_to_file(category, filename):
    """Save all the category links to a text file"""
    all_links = []
    continue_token = None

    # Fetch all pages in the category using continuation
    while True:
        pages, continue_token = get_category_pages(category, continue_token)
        for page in pages:
            page_title = page["title"].replace(" ", "_")
            page_link = f"https://en.wikipedia.org/wiki/{page_title}"
            all_links.append(page_link)

        if not continue_token:
            break

    with open(filename, "w", encoding='utf-8') as file:
        for link in all_links:
            if 'Category:' in link:
                file.write(link + "\n")

    print(f"Saved {len(all_links)} links to {filename}")


def get_category_members(category, continue_token=None):
    """Obtain all entity pages and subcategories in the category"""
    base_url = "https://en.wikipedia.org/w/api.php"
    params = {
        "action": "query",
        "list": "categorymembers",
        "cmtitle": f"Category:{category}",
        "cmlimit": "max",
        "format": "json",
        "cmcontinue": continue_token
    }

    response = requests.get(base_url, params=params)
    data = response.json()

    pages = data.get("query", {}).get("categorymembers", [])
    next_continue_token = data.get("continue", {}).get("cmcontinue", None)

    return pages, next_continue_token


def extract_entity_pages(category, max_pages, current_page_count):
    """Recursively extract all entity pages from the category"""
    entity_pages = []
    subcategories = []
    continue_token = None

    while True:
        pages, continue_token = get_category_members(category, continue_token)

        for page in pages:
            if current_page_count >= max_pages:
                print(f"Reached the page limit of {max_pages}. Stopping.")
                return entity_pages, current_page_count, True  

            # check if it is the category page
            if page['title'].startswith("Category:"):
                subcategories.append(page['title'][9:])  # delete "Category:"
            else:
                # for entity page
                page_title = page["title"].replace(" ", "_")
                if page_title.startswith("List_of") or page_title.startswith("Template"):
                    continue
                page_link = f"https://en.wikipedia.org/wiki/{page_title}"
                entity_pages.append(page_link)
                current_page_count += 1  

        if not continue_token or current_page_count >= max_pages:  
            break

    return entity_pages, current_page_count, False


def save_entity_links_to_file(categories, filename, max_pages=500):
    """Save all the entity links to the file, max pages limit is set to 500"""
    all_links = []
    current_page_count = 0
    stop_flag = False

    for category in tqdm(categories, desc="Processing categories"):
        if stop_flag:
            break
        # print(f"Processing category: {category}")
        new_links, current_page_count, stop_flag = extract_entity_pages(category, max_pages, current_page_count)
        all_links.extend(new_links)
        
    with open(filename, "w", encoding='utf-8') as file:
        for link in all_links:
            file.write(link + "\n")

    print(f"Saved {len(all_links)} links to {filename}. Total pages: {current_page_count}")
    return all_links


def get_wikidata_id_from_wikipedia_url(wikipedia_url):
    """Obtain the Wikidata entity ID from a Wikipedia URL"""
    title = wikipedia_url.split("/")[-1]
    url = f"https://en.wikipedia.org/w/api.php"
    params = {
        "action": "query",
        "titles": title,
        "prop": "pageprops",
        "format": "json"
    }
    
    try:
        response = requests.get(url, params=params, timeout=10)
        response.raise_for_status()
        data = response.json()
        pages = data.get("query", {}).get("pages", {})
        
        for page_id, page_info in pages.items():
            if "pageprops" in page_info and "wikibase_item" in page_info["pageprops"]:
                return {
                    "entity": f"http://www.wikidata.org/entity/{page_info['pageprops']['wikibase_item']}",
                    "entityLabel": title.replace("_", " ")
                }
    except requests.exceptions.SSLError:
        print(f"SSL 错误，跳过 {wikipedia_url}")
    except requests.exceptions.RequestException as e:
        print(f"请求 {wikipedia_url} 失败: {e}")
    
    return None  # 发生异常时，返回 None



