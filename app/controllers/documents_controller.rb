class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all

  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    @statusesSender = Status.where(department_id: @document.sender.department_id)
    @statusesReceiver = Status.where(department_id: @document.receiver.department_id)
    @newSenderStatus = @document.senderStatus
    @newReceiverStatus = @document.receiverStatus
    @canUpdateSenderStatus = false
    if current_user.department_id == @document.sender.department_id and current_user.isDepartmentAdmin #department admin can change status
      @canUpdateSenderStatus = true
    end
    if current_user.email == @document.sender.email #sender can change status
      @canUpdateSenderStatus = true
    end
    @canUpdateReceiverStatus = false
    if current_user.department_id == @document.receiver.department_id and current_user.isDepartmentAdmin #department admin can change status
      @canUpdateReceiverStatus = true
    end
    if current_user.email == @document.receiver.email #receiver can change status
      @canUpdateReceiverStatus = true
    end
  end

  # GET /documents/new
  def new
    @document = Document.new
    @usersReceiver= User.joins(:department).select("users.*, departments.\"departmentName\" AS \"departmentName\"")
    logger.debug @usersReceiver
    @usersSender = User.where(department_id: current_user.department_id)
    @currentUserDepartment = Department.find(current_user.department_id)
    @departmentReceiver = []
    addedIds = []
    @usersReceiver.map{|u|
      if !addedIds.include?(u.department_id)
        addedIds.push(u.department_id)
        @departmentReceiver.push([u.departmentName,u.department_id])
      end
    }
    gon.departmentReceiver = @departmentReceiver
    gon.usersReceiver = @usersReceiver
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)
    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
        @usersReceiver= User.select("*").joins("INNER JOIN departments ON \"departments\".id = \"users\".department_id")
        @usersSender = User.where(department_id: current_user.department_id)
        @currentUserDepartment = Department.find(current_user.department_id)
        @departmentReceiver = []
        addedIds = []
        @usersReceiver.map{|u|
          if !addedIds.include?(u.department_id)
            addedIds.push(u.department_id)
            @departmentReceiver.push([u.departmentName,u.department_id])
          end
        }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_document
    @document = Document.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def document_params
    params.require(:document).permit(:documentCode, :sender_id, :receiver_id, :creator_id, :subject, :date, :content, :tags, :conversationId, :isSenderPrivate, :senderStatus_id, :isReceiverPrivate, :receiverStatus_id)
  end
end
