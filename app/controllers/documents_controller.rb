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
    @usersReceiver= User.joins(:department).select("users.*, departments.\"departmentName\" AS \"departmentName\"").where.not(id: current_user.id)
    @statusesReceiver= Status.joins(:department).select("statuses.*, departments.\"departmentName\" AS \"departmentName\"")
    logger.debug @usersReceiver
    @usersSender = User.where(department_id: current_user.department_id)
    @currentUserDepartment = Department.find(current_user.department_id)
    @departmentReceiver = []
    addedIds = []
    addedIds2 = []
    @usersReceiver.map{|u|
      if !addedIds.include?(u.department_id)
        addedIds.push(u.department_id)
        @departmentReceiver.push([u.departmentName,u.department_id])
      end
    }
    gon.departmentReceiver = @departmentReceiver
    gon.usersReceiver = @usersReceiver
    gon.statusesReceiver = @statusesReceiver
    @statusesReceiver.map{|s|
      if !addedIds2.include?(s.department_id)
        addedIds2.push(s.department_id)
        #@departmentReceiver.push([s.departmentName,s.department_id])
      end
    }
    
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @documents = Document.all
    @document = Document.new(document_params)

    if !@documents.count 
      @document.conversationId = 1
    end
    @receiverStatus = Status.where(department_id: User.find(@document.receiver_id).department_id, description: "Nuevo")
    if(@receiverStatus != nil && @receiverStatus != 0) 
      @document.receiverStatus_id = @receiverStatus[0].id
    end
    respond_to do |format|
      if @document.receiver_id != @document.sender_id 
        if @document.save
          params[:document][:archive_data].each do |file|
            @document.archives.create!(:archive => file)
          end
          format.html { redirect_to @document, notice: 'Document was successfully created.' }
          format.json { render :show, status: :created, location: @document }
        else
          format.html { render :new }
          format.json { render json: @document.errors, status: :unprocessable_entity }
          @usersReceiver= User.joins(:department).select("users.*, departments.\"departmentName\" AS \"departmentName\"").where.not(id: current_user.id)
          @statusesReceiver= Status.joins(:department).select("statuses.*, departments.\"departmentName\" AS \"departmentName\"")
          logger.debug @usersReceiver
          @usersSender = User.where(department_id: current_user.department_id)
          @currentUserDepartment = Department.find(current_user.department_id)
          @departmentReceiver = []
          addedIds = []
          addedIds2 = []
          @usersReceiver.map{|u|
            if !addedIds.include?(u.department_id)
              addedIds.push(u.department_id)
              @departmentReceiver.push([u.departmentName,u.department_id])
            end
          }
          gon.departmentReceiver = @departmentReceiver
          gon.usersReceiver = @usersReceiver
          gon.statusesReceiver = @statusesReceiver
          @statusesReceiver.map{|s|
            if !addedIds2.include?(s.department_id)
              addedIds2.push(s.department_id)
              #@departmentReceiver.push([s.departmentName,s.department_id])
            end
          }
          end  
      else#el usuario que envia es el mismo que recibe
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
         @usersReceiver= User.joins(:department).select("users.*, departments.\"departmentName\" AS \"departmentName\"").where.not(id: current_user.id)
        @statusesReceiver= Status.joins(:department).select("statuses.*, departments.\"departmentName\" AS \"departmentName\"")
        logger.debug @usersReceiver
        @usersSender = User.where(department_id: current_user.department_id)
        @currentUserDepartment = Department.find(current_user.department_id)
        @departmentReceiver = []
        addedIds = []
        addedIds2 = []
        @usersReceiver.map{|u|
          if !addedIds.include?(u.department_id)
            addedIds.push(u.department_id)
            @departmentReceiver.push([u.departmentName,u.department_id])
          end
        }
        gon.departmentReceiver = @departmentReceiver
        gon.usersReceiver = @usersReceiver
        gon.statusesReceiver = @statusesReceiver
        @statusesReceiver.map{|s|
          if !addedIds2.include?(s.department_id)
            addedIds2.push(s.department_id)
            #@departmentReceiver.push([s.departmentName,s.department_id])
          end
        }
      end
      ##nuevo
      
    end
  end

  def getNextConvID
    @documents = Document.all
    nextConvID = 0
    if @documents.count
      @documents.each do |document|
        if document.conversationId > nextConvID
          nextConvID = document.conversationId
        end
      end
      nextConvID = nextConvID + 1
      return nextConvID
    else
      return 1
    end
  end

  helper_method :getNextConvID

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
    params.require(:document).permit(:documentCode, :sender_id, :receiver_id, :creator_id, :subject, :date, :content, :conversationId, :isSenderPrivate, :senderStatus_id, :isReceiverPrivate, :receiverStatus_id, :picture, tag_ids:[], :archive_data => [])
  end
end
