# 下載道具
Download scripts.


## extract_links

Extract URL Links from webpage.

    % echo 'http://shokai.org' | extract_links
    % extract_links http://shokai.org


## filter_url

Filter URL with Content-Type and HTTP Status.

    % echo 'http://example.com' | extract_links | filter_url -type image


## dump_head

    % brew install w3m
    % w3m -dump_head http://example.com
