ActiveAdmin.register Review do

  permit_params :description, :agency_id, :user_id, :star

end
