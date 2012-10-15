# 下載道具
Download scripts.


## extract_links

Extract URL Links from webpage.

    % echo 'http://shokai.org' | extract_links
    % extract_links http://shokai.org

## filter_url

Filter URL with Content-Type and HTTP Status.

    % filter_url http://shokai.github.com
    % filter_url html http://example.com/index.html
    % filter_url image http://example.com/image.jpg
