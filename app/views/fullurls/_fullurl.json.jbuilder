json.extract! fullurl, :id, :url_string, :created_at, :updated_at
json.url fullurl_url(fullurl, format: :json)