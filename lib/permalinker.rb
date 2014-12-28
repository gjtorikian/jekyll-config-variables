# encoding: UTF-8

module Jekyll
  class Document
    alias_method :old_url_placeholders, :url_placeholders

    PROTECTED_NAMES = %w(index search)

    def url_placeholders
      additional_placeholders = site.config['placeholders'] || {}
      split_path = cleaned_relative_path.split('/')
      filename = split_path.pop # last value is the filename

      if !PROTECTED_NAMES.include? filename
        if split_path.last == 'hidden'
          split_path.pop
          path = (split_path << filename).join('/')
        else
          path = old_url_placeholders[:path]
        end
        additional_placeholders[:dirpath] = File.join(path, "index#{old_url_placeholders[:output_ext]}")
      else
        additional_placeholders[:dirpath] = File.join(*split_path, "#{filename}#{old_url_placeholders[:output_ext]}")
      end

      old_url_placeholders.merge(additional_placeholders)
    end
  end
end
