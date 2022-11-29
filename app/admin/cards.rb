ActiveAdmin.register Card do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :card_type, :power, :shield, :nation, :grade, :race, :flavor, :effect, :format, :card_clan_id, :price, :img, :image
    form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image , as: :file, hint: f.object.image.present? ? image_tag(f.object.image, size:"320x480") : ""
      # f.input :img , as: :file, hint: f.object.img.present? ? image_tag(f.object.img, size:"320x480") : ""
    end
    f.actions
  end 
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :card_type, :power, :shield, :nation, :grade, :race, :flavor, :effect, :format, :card_clan_id, :img]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
