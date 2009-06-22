module EditFrameWidgetsShrink
  
  # These Javascript calls reveal and dismiss HUD panels.
  # This changes the effect to shrink/grow, just to show it can be done
  # To use, include EditFrameWidgetsShrink in the cells.
  
  def js_reveal(element = 'div_' + self.name, duration = 0.3, queue = nil)
    queue_parm = queue ? ", queue: {position: '" + queue + "', scope: '" + element + "'}" : ''
    "Effect.Grow('#{element}', {duration: #{duration}#{queue_parm}});"
  end

  def js_dismiss(element = 'div_' + self.name, duration = 0.3, queue = nil)
    queue_parm = queue ? ", queue: {position: '" + queue + "', scope: '" + element + "'}" : ''
    "Effect.Shrink('#{element}', {duration: #{duration}#{queue_parm}});"
  end

end

