class Api::V1::PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :update, :destroy]
  # GET /pokemons
  def index
   @pokemons = Pokemon.all
   render json: @pokemons
  end
  
  # GET /pokemons/1
  def show
   render json: @pokemon
  end
  # POST /pokemons
  def create
   @pokemon = Pokemon.new(pokemon_params)
   if @pokemon.save
    render json: @pokemon, status: :created, location:        api_v1_pokemon_url(@pokemon)
   else
    render json: @pokemons.errors, status: :unprocessable_entity
   end
  end
  # PATCH/PUT /pokemons/1
  def update
   if @pokemon.update(pokemons_params)
    render json: @pokemon
   else
    render json: @pokemon.errors, status: :unprocessable_entity
   end
  end
 # DELETE /pokemons/1
  def destroy
   @pokemon.destroy
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_pokemon
   @pokemon = Pokemon.find(params[:id])
  end
  # Only allow a trusted parameter “white list” through.
  def pokemon_params
  params.require(:pokemon).permit(:title, :content, :slug)
  end
  end

# This is where the start was

class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :edit, :update, :destroy]

  # GET /pokemons
  # GET /pokemons.json
  def index
    @pokemons = Pokemon.all
  end

  # GET /pokemons/1
  # GET /pokemons/1.json
  def show
  end

  # GET /pokemons/new
  def new
    @pokemon = Pokemon.new
  end

  # GET /pokemons/1/edit
  def edit
  end

  # POST /pokemons
  # POST /pokemons.json
  def create
    @pokemon = Pokemon.new(pokemon_params)

    respond_to do |format|
      if @pokemon.save
        format.html { redirect_to @pokemon, notice: 'Pokemon was successfully created.' }
        format.json { render :show, status: :created, location: @pokemon }
      else
        format.html { render :new }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pokemons/1
  # PATCH/PUT /pokemons/1.json
  def update
    respond_to do |format|
      if @pokemon.update(pokemon_params)
        format.html { redirect_to @pokemon, notice: 'Pokemon was successfully updated.' }
        format.json { render :show, status: :ok, location: @pokemon }
      else
        format.html { render :edit }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pokemons/1
  # DELETE /pokemons/1.json
  def destroy
    @pokemon.destroy
    respond_to do |format|
      format.html { redirect_to pokemons_url, notice: 'Pokemon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pokemon_params
      params.require(:pokemon).permit(:id, :title, :type, :image, :gender, :slug)
    end
end
