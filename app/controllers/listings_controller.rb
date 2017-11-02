class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy, :verify]

  # GET /listings
  # GET /listings.json
  def index
    if !signed_in?
      redirect_to sign_in_path
    else
      # customer?
      if allowed?(action: 'for_superadmin_customer', user: current_user)
        @listings = Listing.all
        @listing = Listing.new
      else
        return redirect_back(fallback_location: root_path)
      end
    end
  end

  def verify
    if allowed?(action: 'for_superadmin_moderator', user: current_user)
      if @listing.verification == false
        @listing.verification = true
        @listing.save
      else
        @listing.verification = false
        @listing.save
      end
    end
    redirect_back(fallback_location: root_path)
  end

  def verify_listings
    if allowed?(action: 'for_superadmin_moderator', user:current_user)
    else
      return redirect_back(fallback_location: root_path)
    end
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    if !signed_in?
      redirect_to sign_in_path
    else
      if allowed?(action: 'for_superadmin_customer', user: current_user)
        @listing = Listing.new
      else
        return redirect_back(fallback_location: root_path)
      end
    end
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = current_user.listings.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    allowed?(action: 'destroy', user: current_user)
    @listing.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:user_id, :title, :description, :property_type, :num_of_rooms, :num_of_bathrooms, :price, :address, :city, :country, :max_guest, :num_of_beds)
    end
end
