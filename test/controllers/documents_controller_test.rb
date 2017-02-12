require 'test_helper'

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document = documents(:one)
  end

  test "should get index" do
    get documents_url
    assert_response :success
  end

  test "should get new" do
    get new_document_url
    assert_response :success
  end

  test "should create document" do
    assert_difference('Document.count') do
      post documents_url, params: { document: { content: @document.content, conversationId: @document.conversationId, creatorEmail_id: @document.creatorEmail_id, date: @document.date, documentCode: @document.documentCode, isReceiverPrivate: @document.isReceiverPrivate, isSenderPrivate: @document.isSenderPrivate, receiverEmal_id: @document.receiverEmal_id, receiverStatus_id: @document.receiverStatus_id, senderEmail_id: @document.senderEmail_id, senderStatus_id: @document.senderStatus_id, subject: @document.subject, tags: @document.tags } }
    end

    assert_redirected_to document_url(Document.last)
  end

  test "should show document" do
    get document_url(@document)
    assert_response :success
  end

  test "should get edit" do
    get edit_document_url(@document)
    assert_response :success
  end

  test "should update document" do
    patch document_url(@document), params: { document: { content: @document.content, conversationId: @document.conversationId, creatorEmail_id: @document.creatorEmail_id, date: @document.date, documentCode: @document.documentCode, isReceiverPrivate: @document.isReceiverPrivate, isSenderPrivate: @document.isSenderPrivate, receiverEmal_id: @document.receiverEmal_id, receiverStatus_id: @document.receiverStatus_id, senderEmail_id: @document.senderEmail_id, senderStatus_id: @document.senderStatus_id, subject: @document.subject, tags: @document.tags } }
    assert_redirected_to document_url(@document)
  end

  test "should destroy document" do
    assert_difference('Document.count', -1) do
      delete document_url(@document)
    end

    assert_redirected_to documents_url
  end
end
