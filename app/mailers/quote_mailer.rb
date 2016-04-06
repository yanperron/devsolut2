class QuoteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.quote_mailer.send.subject
  #
  def send(quote)
    @quote = quote

      mail(to: @quote.user.email, subject: ' demande de devis')



  end
end
