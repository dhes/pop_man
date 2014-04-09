require 'test_helper'

class ClinicalRulesControllerTest < ActionController::TestCase
  setup do
    @clinical_rule = clinical_rules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clinical_rules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clinical_rule" do
    assert_difference('ClinicalRule.count') do
      post :create, clinical_rule: { allergy: @clinical_rule.allergy, comment: @clinical_rule.comment, highage: @clinical_rule.highage, lowage: @clinical_rule.lowage, medication: @clinical_rule.medication, name: @clinical_rule.name, problem: @clinical_rule.problem, sex: @clinical_rule.sex, test: @clinical_rule.test }
    end

    assert_redirected_to clinical_rule_path(assigns(:clinical_rule))
  end

  test "should show clinical_rule" do
    get :show, id: @clinical_rule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clinical_rule
    assert_response :success
  end

  test "should update clinical_rule" do
    patch :update, id: @clinical_rule, clinical_rule: { allergy: @clinical_rule.allergy, comment: @clinical_rule.comment, highage: @clinical_rule.highage, lowage: @clinical_rule.lowage, medication: @clinical_rule.medication, name: @clinical_rule.name, problem: @clinical_rule.problem, sex: @clinical_rule.sex, test: @clinical_rule.test }
    assert_redirected_to clinical_rule_path(assigns(:clinical_rule))
  end

  test "should destroy clinical_rule" do
    assert_difference('ClinicalRule.count', -1) do
      delete :destroy, id: @clinical_rule
    end

    assert_redirected_to clinical_rules_path
  end
end
