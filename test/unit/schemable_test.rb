require 'test_helper'

class SchemaResource < TestResource
  property :a, type: :string, default: 'foo'
  property :b, type: :boolean, default: false
  property :c
  property :d, type: :integer
end

class SchemaResource2 < TestResource
  property :a, type: :float
end

class MultipleSchema < TestResource
  properties :name, :short_name, :long_name, type: :string
end

class SchemableTest < MiniTest::Unit::TestCase

  def test_defines_fields
    resource = SchemaResource.new

    %w(a b c d).each do |method_name|
      assert resource.respond_to?(method_name), "should respond_to?(:#{method_name})"
      assert resource.respond_to?("#{method_name}="), "should respond_to?(:#{method_name}=)"
    end

    assert_equal 4, SchemaResource.schema.size
  end

  def test_defines_defaults
    resource = SchemaResource.new

    assert_equal 'foo', resource.a
    assert_equal 'foo', resource['a']
    assert_equal false, resource.b
    assert_equal false, resource['b']
    assert_equal nil, resource.c
    assert_equal nil, resource.d
  end

  def test_find_property_definition
    property = SchemaResource.schema[:a]
    assert property

    assert_equal :a, property.name
    assert_equal :string, property.type
    assert_equal 'foo', property.default
  end

  def test_casts_data
    resource = SchemaResource.new

    resource.d = "1"
    assert_equal 1, resource.d
  end

  # sanity to make sure we're not doing anything crazy with inheritance
  def test_schemas_do_not_collide
    assert_equal 4, SchemaResource.schema.size
    assert_equal 1, SchemaResource2.schema.size
  end

  def test_can_define_multiple_properties
    assert_equal 3, MultipleSchema.schema.size

    MultipleSchema.schema.each_property do |property|
      assert_equal :string, property.type
      assert_equal nil, property.default
    end
  end

end