class Array
  def column_concat
    self.inject([]){ |res, el| res << el }.join(' ').html_safe
  end
end
