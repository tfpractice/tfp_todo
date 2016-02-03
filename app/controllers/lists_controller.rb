class ListsController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource :through => :current_or_guest_user, except: [:index]
  

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = lists.new

    # @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = lists.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  def lists
    # @user = current_user
    @current_user ||= current_or_guest_user
    # @current_user ? current_user.lists : List
    current_user.lists
  end

  # def create_guest_user
  #   u = User.create(:username => "guest", :email => "guest_#{Time.now.to_i}#{rand(100)}@example.com")
  #   u.save!(:validate => false)
  #   session[:guest_user_id] = u.id
  #   u
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def list_params
    params.require(:list).permit(:title, :description, :user_id)
  end
end
