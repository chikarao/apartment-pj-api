class Api::V1::TenantsController < ApplicationController
  # before_action :ensure_params_exist, only: :create
  before_action :valid_token, only: [:create, :update, :destroy]
  before_action :load_tenant, only: [:update, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def create
    # check for flat_id
    if (tenant_params[:profile_id])
      tenant = Tenant.new tenant_params
      if tenant.save
        # p 'tenant saved' + tenant.to_s
        profile = Profile.find_by(id: tenant_params[:profile_id])
        profile_serializer = parse_json profile
        tenant_serializer = parse_json tenant
        json_response "Created tenant succesfully", true, {tenant: tenant_serializer, profile: flat_serializer }, :ok
      else
        json_response "Create tenant failed", false, {}, :unprocessable_entity
      end
    else
      json_response "Create tenant failed; Provide flat_id", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @tenant.update tenant_params
      profile = Profile.find_by(id: tenant_params[:profile_id])
      profile_serializer = parse_json profile
      tenant_serializer = parse_json @tenant
      json_response "Updated tenant succesfully", true, {tenant: tenant_serializer, profile: profile_serializer}, :ok
    else
      json_response "Update flat failed", false, {}, :unprocessable_entity
    end
  end

  def destroy
    # tenant delete request by flat owner
    if @tenant.destroy
      profile = Profile.find_by(id: params[:profile_id])
      profile_serializer = parse_json profile
      json_response "Deleted tenant succesfully", true, {profile: profile_serializer}, :ok
    else
      json_response "Delete tenant failed", false, {}, :unprocessable_entity
    end
  end


  private

  def tenant_params
    # params.require(:tenant).permit(:flat_id, :code)
    params.require(:tenant).permit(:flat_id, :code, :address1, :address2, :city, :state, :zip, :region, :country, :area, :sales_point, :description, :flat_type, :intro, :cancellation, :construction, :school_district, :school_district1, :station, :station1)
  end

  def valid_token
    @user = User.find_by authentication_token: request.headers["AUTH-TOKEN"]
    if @user
      return @user
    else
      json_response "Invalid token", false, {}, :failure
    end
  end

  def load_tenant
    @tenant = FlatLanguage.find_by id: params[:id]
    unless @tenant.present?
      json_response "Cannot find tenant", false, {}, :not_found
    end
  end

end
