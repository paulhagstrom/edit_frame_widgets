module EditFrameWidgetsJquery
  
  # These Javascript calls reveal and dismiss HUD panels.
  # This is the jQuery version
  # To use, include EditFrameWidgetsJquery in the cells.
  # (And include the jQuery Javascript in your layout)
  
  def js_reveal(element = 'div_' + self.name, duration = 'normal', queue = nil)
    "jQuery('##{element}').show('normal');"
  end

  def js_dismiss(element = 'div_' + self.name, duration = 'normal', queue = nil)
    "jQuery('##{element}').hide('normal');"
  end

end

