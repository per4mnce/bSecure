module SecretHelper
  def formatField(maxSize, fvalue)
    if fvalue
      #Only show the first max_size characters
      fvalue.length > maxSize ? fvalue[0, maxSize] + "..." : fvalue
    end
  end
end
