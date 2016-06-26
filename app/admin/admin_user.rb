ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation
    menu :label => "Admin", :priority => 2, :link_to => 'admin/admin_users'

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      para(style: "padding-left: 10px;") do
      f.label :email
      f.input :email
      end
      para(style: "padding-left: 10px;") do
      f.label :password
      f.input :password
      end
      para(style: "padding-left: 10px;") do
      f.label :password_confirmation
      f.input :password_confirmation
      end
    end
    f.actions
  end

end
