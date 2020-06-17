ActiveAdmin.register News do
  permit_params :title, :description, :link, :updated_at, :created_at, :slug

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :link
    column :slug
    column :created_at
    actions
  end

  filter :district

  form do |f|
    f.inputs do
      f.input :title
      f.input :description, as: :quill_editor
      f.input :link
      f.input :slug
    end
    f.actions
  end
end
