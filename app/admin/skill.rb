ActiveAdmin.register Skill do
  permit_params :title

  index do
    selectable_column
    id_column
    column :title
    actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :title
    end
    f.actions
  end

end