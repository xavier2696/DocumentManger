require 'test_helper'
class TagTest < ActiveSupport::TestCase
  test "tagCreate_nil_name" do
    tag = Tag.new(tagName: tags(:tagvacio).tagName)
    assert !tag.valid?
    refute tag.valid?
    assert_match /blank/, tag.errors[:tagName].to_s
  end
  test "tagCreate" do
    tag = Tag.new :tagName => tags(:tagnombre).tagName
    assert tag.save
    tag_copy = Tag.find(tag.id)
    assert_equal tag.tagName, tag_copy.tagName
    assert tag.destroy
  end
  test "tagCreate_same_name" do
    tag_duplicado = Tag.new(tagName: tags(:tagrepetido).tagName)
    assert !tag_duplicado.invalid?
    assert_match /taken/, tag_duplicado.errors[:tagName].to_s
  end
end
