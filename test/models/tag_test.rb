require 'test_helper'
class TagTest < ActiveSupport::TestCase
  test "tagCreate_nil_name" do
    tag_nulo = Tag.new(tagName: tags(:tagnulo).tagName, department_id: tags(:tagnulo).department_id)
    assert !tag_nulo.valid?
    assert_match /blanco/, tag_nulo.errors[:tagName].to_s
  end
  test "tagCreate" do
    tag = Tag.new(tagName: tags(:tagnombre).tagName, department_id: tags(:tagnombre).department_id)
    assert tag.save
    tag_copy = Tag.find(tag.id)
    assert_equal tag.tagName, tag_copy.tagName
    assert tag.destroy
  end
  test "tagCreate_same_name" do
    tag_duplicado = Tag.new(tagName: tags(:tagrepetido).tagName, department_id: tags(:tagrepetido).department_id)
    assert tag_duplicado.invalid?
    assert_match /en uso/, tag_duplicado.errors[:tagName].to_s
  end
  test "tagCreate_empty_name" do
    tag_vacio = Tag.new(tagName: tags(:tagvacio).tagName, department_id: tags(:tagvacio).department_id)
    assert !tag_vacio.valid?
    assert_match /blanco/, tag_vacio.errors[:tagName].to_s
    # Deberia ser /empty/ o /vacio/, sin embargo: Expected to match "[\"no puede estar en blanco\", \"ya está en uso\"]".
  end
end
