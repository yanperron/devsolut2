ActiveAdmin.register Agency do
 permit_params :name, :description, :repos_public, :total_stars, :photo,
  :does_web_development, :does_mobile_development
end
