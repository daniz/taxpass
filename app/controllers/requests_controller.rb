class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  @@formsFieldsNames = [
    "form106s",
    "form867s",
    "form857s",
    "pension_forms",
    "btl_forms",
    "receipts"
  ]

  # GET /requests
  # GET /requests.json
  def index
    gon.requests = Request.all
  end

  def gon_request(request)
    include = {uploaded_form: {include: {uploaded_files: {only:{}, methods: :file } } } }

    gon.request = request
    gon.kids    = request.kids

    forms = {}
    @@formsFieldsNames.each do |name|
      forms[ name ] = request.send(name).as_json(include: include)
    end

    gon.forms = forms
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    gon_request @request
  end

  # GET /requests/new
  def new
    @request = Request.new
    gon.current_user = current_user.name
  end

  # GET /requests/1/edit
  def edit
    gon_request @request
    gon.current_user = current_user.name
  end

  # POST /requests
  # POST /requests.json
  def create

    data = JSON.parse params[:request]

    kids = data["kids"]
    data.delete "kids"

    formsFields = {}
    @@formsFieldsNames.each do |name|
      formsFields[ name ] = data[ name ]
      data.delete name
    end

    appartments = data["appartments"]
    data.delete "appartments"

    if data["id"]
      @request = Request.find data["id"]
    else
      @request = Request.new(data)
    end

    @request.user = current_user

    kids.each do |kid|
      if kid["id"].present?
        kidModel = @request.kids.find_by_id kid["id"]
        kidModel.update kid.except("index")
      else
        @request.kids.new kid.except("index")
      end
    end

    @@formsFieldsNames.each do |name|
      formsData = formsFields[name]

      if formsData.present?
        formsData.each do |form|
          prefix = if form["spouse"] then "spouse_" else "" end
          suffix = "_#{ form['index'] }"

          forms = @request.send(name)
          additional_data = {}

          files = params["#{ prefix }#{ name }#{ suffix }"]
          if files.present?
            uploaded_form = UploadedForm.new
            files.each do |file|
              uploaded_form.uploaded_files.new file: file
            end
            additional_data = { uploaded_form: uploaded_form }
          end

          if form["id"].present?
            formModel = forms.find_by_id form["id"]
            formModel.update form.except("index", "uploaded_form").merge additional_data
          else
            forms.new form.except("index").merge additional_data
          end
        end
      end
    end

    # if appartments
    #   appartments.each do |a|
    #     @request.appartments.new a.except("index")
    #   end
    # end
    
    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'בקשתך נשמרה בהצלחה.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params[:request].permit :tax_year, :is_single, :is_married, :is_widowed, :is_divorced, :is_seperated, :is_coupled,
        :is_same_sex_married, :spouse_name, :spouse_death_date, :birth_date, :gender, :occupation, :spouse_birth_date,
        :spouse_gender, :spouse_occupation, :retired, :spouse_retired, :immigrant, :spouse_immigrant, :immigration_date,
        :spouse_immigration_date, :idf_service, :spouse_idf_service, :idf_discharge_date, :spouse_idf_discharge_date,
        :idf_service_duration, :spouse_idf_service_duration, :academic, :spouse_academic, :special_area_resident,
        :spouse_special_area_resident, :academia_graduation_date, :spouse_academia_graduation_date, :academia_institution,
        :spouse_academia_institution, :academia_degree, :spouse_academia_degree, :academia_years, :spouse_academia_years,
        :lived_with_spouse_throughout, :special_area_residency_start_date, :special_area_residency_end_date,
        :city, :blind, :disabled, :spouse_blind, :spouse_disabled, :israeli_resident, :spouse_israeli_resident,
        :paying_alimony, :employed, :author, :stock, :lottery, :pension, :other,
        :spouse_employed, :spouse_author, :spouse_stock, :spouse_lottery, :spouse_pension, :spouse_other
    end
end
