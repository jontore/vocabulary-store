require 'test_helper'

class VocabsControllerTest < ActionController::TestCase
  setup do
    @vocab = vocabs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vocabs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vocab" do
    assert_difference('Vocab.count') do
      post :create, vocab: { learning_lang: @vocab.learning_lang, reference_lang: @vocab.reference_lang, user_id: @vocab.user_id }
    end

    assert_redirected_to vocab_path(assigns(:vocab))
  end

  test "should show vocab" do
    get :show, id: @vocab
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vocab
    assert_response :success
  end

  test "should update vocab" do
    patch :update, id: @vocab, vocab: { learning_lang: @vocab.learning_lang, reference_lang: @vocab.reference_lang, user_id: @vocab.user_id }
    assert_redirected_to vocab_path(assigns(:vocab))
  end

  test "should destroy vocab" do
    assert_difference('Vocab.count', -1) do
      delete :destroy, id: @vocab
    end

    assert_redirected_to vocabs_path
  end
end
