class AgencyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.agency_mailer.create.subject
  #
  def create(agency)
    @agency = agency

    mail(to: @agency.user.email, subject: 'Votre Agence a bien été créée !')


  end
end
