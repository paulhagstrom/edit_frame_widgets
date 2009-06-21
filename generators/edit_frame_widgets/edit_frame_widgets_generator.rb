# This is just taken from Apotomo's generator.  I still use the controller generator
# though I don't allow the specification of actions.  I use the first action specified to indicate
# whether it is a child panel or a parent panel
require 'rails_generator/generators/components/controller/controller_generator'
class EditFrameWidgetsGenerator < ControllerGenerator
# class EditFrameWidgetsGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      # Check for class naming collisions.
      m.class_collisions class_path, "#{class_name}Cell"
      
      # Directories
      m.directory File.join('app/cells', class_path)
      m.directory File.join('app/cells', class_path, file_name)
      
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
      
      # # View template for each state.
      # actions.each do |action|
      #   path = File.join('app/cells', class_path, file_name, "#{action}.html.erb")
      #   m.template 'view.html.erb', path,
      #     :assigns => { :action => action, :path => path }
      # end
      
      # # Functional test for the widget.
      # m.template 'functional_test.rb', File.join('test/functional/', "test_#{file_name}_cell.rb")
    end
  end
end

