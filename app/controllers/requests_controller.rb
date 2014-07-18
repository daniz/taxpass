class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    gon.requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    gon.request             = @request
    gon.kids                = @request.kids
    gon.form106s            = @request.form106s.where(spouse: false).as_json methods: :file, except: [:file_file_name, :file_file_size, :file_content_type, :file_updated_at]
    gon.spouseForm106s      = @request.form106s.where(spouse: true).as_json methods: :file, except: [:file_file_name, :file_file_size, :file_content_type, :file_updated_at]
    gon.form857s            = @request.form857s.where(spouse: false).as_json methods: :file, except: [:file_file_name, :file_file_size, :file_content_type, :file_updated_at]
    gon.spouseForm857s      = @request.form857s.where(spouse: true).as_json methods: :file, except: [:file_file_name, :file_file_size, :file_content_type, :file_updated_at]
    gon.btlForms            = @request.btl_forms.where(spouse: false).as_json methods: :file, except: [:file_file_name, :file_file_size, :file_content_type, :file_updated_at]
    gon.spouseBtlForms      = @request.btl_forms.where(spouse: true).as_json methods: :file, except: [:file_file_name, :file_file_size, :file_content_type, :file_updated_at]
    gon.pensionForms        = @request.pension_forms.where(spouse: false).as_json methods: :file, except: [:file_file_name, :file_file_size, :file_content_type, :file_updated_at]
    gon.spousePensionForms  = @request.pension_forms.where(spouse: true).as_json methods: :file, except: [:file_file_name, :file_file_size, :file_content_type, :file_updated_at]
    gon.form867s            = @request.form867s.as_json methods: :file, except: [:file_file_name, :file_file_size, :file_content_type, :file_updated_at]
  end

  # GET /requests/new
  def new
    @request = Request.new
    gon.current_user = current_user.name
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create

    data = JSON.parse params[:request]

    kids = data["kids"]
    data.delete "kids"

    form106s = data["form106s"]
    data.delete "form106s"

    spouseForm106s = data["spouseForm106s"]
    data.delete "spouseForm106s"

    form857 = data["form857"]
    data.delete "form857"

    spouseForm857 = data["spouseForm857"]
    data.delete "spouseForm857"

    btlForms = data["btlForms"]
    data.delete "btlForms"

    spouseBtlForms = data["spouseBtlForms"]
    data.delete "spouseBtlForms"

    pensionForm = data["pensionForm"]
    data.delete "pensionForm"

    spousePensionForm = data["spousePensionForm"]
    data.delete "spousePensionForm"

    form867 = data["form867"]
    data.delete "form867"

    @request = Request.new(data)

    kids.each do |k|
      @request.kids.new k.except("index")
    end

    form106s.each do |f|
      file = params["form106_#{ f['index'] }"]
      @request.form106s.new f.except("index").merge spouse: false, file: file
    end

    spouseForm106s.each do |f|
      file = params["spouse_form106_#{ f['index'] }"]
      @request.form106s.new f.except("index").merge spouse: true, file: file
    end

    if form857
      file = params['form857']
      @request.form857s.new form857.merge spouse: false, file: file
    end

    if spouseForm857
      file = params['spouse_form857']
      @request.form857s.new form857.merge spouse: true, file: file
    end

    btlForms.each do |f|
      file = params["btlForm_#{ f['type'] }"]
      @request.btl_forms.new f.merge spouse: false, file: file
    end

    spouseBtlForms.each do |f|
      file = params["spouse_btlForm_#{ f['type'] }"]
      @request.btl_forms.new f.merge spouse: true, file: file
    end

    if pensionForm
      file = params['pensionForm']
      @request.pension_forms.new pensionForm.merge spouse: false, file: file
    end

    if spousePensionForm
      file = params['spouse_pensionForm']
      @request.pension_forms.new spousePensionForm.merge spouse: true, file: file
    end

    if form867
      file = params['form867']
      @request.form867s.new form867.merge file: file
    end

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
