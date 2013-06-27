# encoding: UTF-8
class PacksController < ApplicationController
  before_filter :set_type_param
  
  def el_bazar
    @posts = Post.where(:country_id => session[:country].id, :post_type => 'El Bazar').is_visible.order('created_at DESC')
    @background = true
    
    matri_packs_type = SliderImageType.find_by_name('El Bazar')
    if !matri_packs_type.nil?
      @slider_images = SliderImage.where(:country_id => session[:country].id, :slider_image_type_id => matri_packs_type.id).order(:position)
    else
      @slider_images = []
    end
	  
  	@title_content = 'Ropa y productos deportivos'
  	@meta_description_content = 'Reportajes e información sobre las últimas tendencias de la moda local e internacional'
  	@h1 = 'Todo lo que necesitas saber de deporte'
  	@h2 = 'Alto rendimiento exige una armadura que acompañe'
  	@h3 = ''
    add_breadcrumb "Sports Blog", :blog_el_bazar_path
    	
  	respond_to do |format|
      format.html { render :index }
      format.json { render json: @posts }
    end
  end
  
end
