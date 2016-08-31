json.extract! shorturl, :id, :url_full_id, :url_string, :url_num_accesses, :url_ip_access, :created_at, :updated_at
json.url shorturl_url(shorturl, format: :json)