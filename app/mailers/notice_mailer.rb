# coding: utf-8
class NoticeMailer < ActionMailer::Base
	default from: "mensajes@matriclick.com"
  
  def purchases_summary
    @purchases = Purchase.all
    
    mail to: "contacto@tributosport.com", subject: "Devolución en TributoSport.com"
  end
  
	#CONTACT
  def refund_request_email(refund_request)
    @refund_request = refund_request
  	mail to: "contacto@tributosport.com", subject: "Devolución en TributoSport.com"
  end
	
	#CONTACT
  def contact_email(contact)
  	@contact = contact
  	mail to: "contacto@tributosport.com", subject: "Contacto en TributoSport.com"
  end

	#PURCHASE
  def purchase_email(purchase, country_url_path)
  	@purchase = purchase
  	@purchasable = purchase.purchasable
  	@country_url_path = country_url_path
  	mail to: @purchase.user.email, cc: "contacto@tributosport.com", subject: "Compra en TributoSport.com"
  end

	#WEDDING PLANNER
  def wedding_planner_email(wedding_planner_quote, action)
  	@wedding_planner_quote = wedding_planner_quote
  	@action = action
  	mail to: "contacto@tributosport.com", subject: action+" cotización Wedding Planner TributoSport.com"
  end
  
  #FEEDBACK
  def feedback_email(feedback)
  	@feedback = feedback
  	mail to: "contacto@tributosport.com", subject: "Feedback en TributoSport.com"
  end
  
  #FEEDBACK
  def review_email(review)
  	@review = review
  	@supplier = review.reviewable
  	mail to: "contacto@tributosport.com", subject: "Review en TributoSport.com"
  end
  
  #PRODUCT
  def product_email(product)
  	@product = product
  	mail to: "contacto@tributosport.com", subject: "Alerta Precio producto en TributoSport.com"
  end

  #SERVICE
  def service_email(service)
  	@service = service
  	mail to: "contacto@tributosport.com", subject: "Alerta Precio producto en TributoSport.com"
  end
  
  #REFERENCE
  def reference_request_email(reference_request)
  	@reference_request = reference_request
  	@supplier = reference_request.supplier_account.supplier
  	mail to: "contacto@tributosport.com", subject: "Referencias en TributoSport.com"
  end

	# MATRICLICK POINTS
	def matriclick_points_email(user, expense)
		@user = user
		@expense = expense
		mail to: "contacto@tributosport.com", subject: "Se registró un gasto para Puntos TributoSport"
	end
  
end
