module ApplicationHelper
  def flash_class(level)
    case level
    when 'notice' then 'alert alert-info'
    when 'success' then 'alert alert-success'
    when 'error' then 'alert alert-danger'
    when 'alert' then 'alert alert-warning'
    else ''
    end
  end

  def directory_size(path)
    size = 0
    Dir.glob(File.join(path, '**', '*')) { |file| size += File.size(file) }
    number_to_human_size size
  end

  def with_newlines(str)
    str.gsub("\n", '<br/>').html_safe
  end

  def limit
    (params[:limit] || ENV['ITEMS_PER_PAGE']).to_i
  end

  def last_page?(collection)
    offset = params[:offset].to_i || 0
    (limit + offset) >= collection.limit(nil).offset(nil).size
  end
end
