# This is kind of hacky.  I use the controller generator, but I don't actually respond
# to actions, except if the first one is 'child', in which case I build the child version of the cell.
# Also, this can damage the application widget tree, generally one will not want to overwrite it
# unless nothing has been done to it yet.
require 'rails_generator/generators/components/controller/controller_generator'
class EditFrameWidgetsGenerator < ControllerGenerator
  def manifest
    record do |m|
      # Check for class naming collisions.
      m.class_collisions class_path, "#{class_name}Cell"
      
      # Directories
      m.directory File.join('app/cells', class_path)
      m.directory File.join('app/cells', class_path, file_name)
      m.directory File.join('app/cells', class_path, 'edit_frame_widgets')
      
      # Widget tree
      m.template 'edit_frame_widget_tree.rb', File.join('app/models', "application_widget_tree.rb")
      
      # Cells
      if actions.first == 'child'
        m.template 'edit_frame_widget_child.rb', File.join('app/cells', class_path, "#{file_name}_cell.rb")
      else
        m.template 'edit_frame_widget_parent.rb', File.join('app/cells', class_path, "#{file_name}_cell.rb")
      end

      # Views
      m.file 'detail.html.erb', File.join('app/cells', class_path, file_name, "_detail.html.erb")
      m.file 'frame.html.erb', File.join('app/cells', class_path, file_name, "_frame.html.erb")
      m.file 'list.html.erb', File.join('app/cells', class_path, file_name, "_list.html.erb")
      # Common views
      m.file 'filter.html.erb', File.join('app/cells', class_path, 'edit_frame_widgets', "_filter.html.erb")
      m.file 'message.html.erb', File.join('app/cells', class_path, 'edit_frame_widgets', "_message.html.erb")
      m.file 'selected.html.erb', File.join('app/cells', class_path, 'edit_frame_widgets', "_selected.html.erb")
            
      # # Functional test for the widget.
      # m.template 'functional_test.rb', File.join('test/functional/', "test_#{file_name}_cell.rb")
    end
  end
end

