class SearchController < ApplicationController
	def search
	 	@user_or_book = params[:option]
	 	@how_search = params[:choice]
    		if @user_or_book == "1"
      			@users = User.search(params[:search], @how_search)
    		else
      			@books = Book.search(params[:search], @how_search)
    		end
 	end

private
  # def search_params
  #   params.require(:search).permit(:user, :book)
  # end

def User.search(search, how_search)
     		if how_search == "1"
       			User.where(['name LIKE ?', "%#{search}%"])
     		elsif how_search == "2"
       			User.where(['name LIKE ?', "%#{search}"])
     		elsif how_search == "3"
       			User.where(['name LIKE ?', "#{search}%"])
     		elsif how_search == "4"
       			User.where(['name LIKE ?', "#{search}"])
     		else
       			User.all
     		end
end

def Book.search(search, how_search)
  # if user_or_book == "2"
    	if how_search == "1"
            Book.where(['title LIKE ?', "%#{search}%"])
        elsif how_search == "2"
           Book.where(['title LIKE ?', "%#{search}"])
        elsif how_search == "3"
            Book.where(['title LIKE ?', "#{search}%"])
        elsif how_search == "4"
            Book.where(['title LIKE ?', "#{search}"])
        else
            Book.all
    	end
end
  # def search
  #   @model = params["search"]["model"]
  #   @content = params["search"]["content"]
  #   @how = params["search"]["how"]
  #   @datas = search_for(@how, @model, @content)
  # end

  # private
  # def match(model, content)
  #   if model == 'user'
  #     User.where(name: content)
  #   elsif model == 'post'
  #     Book.where(title: content)
  #   end
  # end

  # def forward(model, content)
  #   if model == 'user'
  #     User.where("name LIKE ?", "#{content}%")
  #   elsif model == 'post'
  #     Book.where("title LIKE ?", "#{content}%")
  #   end
  # end

  # def backward(model, content)
  #   if model == 'user'
  #     User.where("name LIKE ?", "%#{content}")
  #   elsif model == 'post'
  #     Book.where("title LIKE ?", "%#{content}")
  #   end
  # end

  # def partical(model, content)
  #   if model == 'user'
  #     User.where("name LIKE ?", "%#{content}%")
  #   elsif model == 'post'
  #     Book.where("title LIKE ?", "%#{content}%")
  #   end
  # end

  # def search_for(how, model, content)
  #   case how
  #   when 'match'
  #     match(model, content)
  #   when 'forward'
  #     forward(model, content)
  #   when 'backward'
  #     backward(model, content)
  #   when 'partical'
  #     partical(model, content)
  #   end
  # end
end
