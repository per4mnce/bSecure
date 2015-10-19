module SecretHelper
  
  #Reduce the field size to fit in the grid.  Used in secrets/index.html.erb
  def formatField(maxSize, fvalue)
    if fvalue
      #Only show the first max_size characters
      fvalue.length > maxSize ? fvalue[0, maxSize] + "..." : fvalue
    end
  end
end
