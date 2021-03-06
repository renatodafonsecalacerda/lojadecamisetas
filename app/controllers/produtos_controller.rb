class ProdutosController < ApplicationController
	def index		
		@produtos_por_nome = Produto.order :nome
		@produtos_por_preco = Produto.order(:preco).limit(2)
	end
	def new
	    @produto = Produto.new
	    render :new
	end
	def create		  
		valores = params.require(:produto).permit :nome, :descricao, :preco,:quantidade
		@produto = Produto.new valores
		if @produto.save
			flash[:notice] = "Gravado com sucesso!!"
			redirect_to root_path
		else
			render :new
		end
	end
	def destroy
		id = params[:id]
		Produto.destroy(id)
		redirect_to root_path
	end
	def busca
		@nome_a_buscar = params[:nome]
		@produtos = Produto.where "nome like ?", "%#{@nome_a_buscar}%"				
	end	
end
