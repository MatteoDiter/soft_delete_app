require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'soft deletes an item' do
    item = create(:item)
    item.soft_delete

    expect(item.deleted_at).to_not be_nil
  end

  it 'restores a soft-deleted item' do
    item = create(:item)
    item.soft_delete
    item.restore

    expect(item.deleted_at).to be_nil
  end

  it 'excludes soft-deleted items from normal queries' do
    soft_deleted_item = create(:item)
    soft_deleted_item.soft_delete

    expect(Item.all).not_to include(soft_deleted_item)
  end
  
  #testing that soft deleting an item already soft deleted does not raise error
  it 'double soft delete not causing errors' do
    item = create(:item)
    item.soft_delete

    expect { item.soft_delete }.not_to raise_error
  end

  #testing that restoring an item that has not been soft-deleted should not raise an error
  it 'restoring not soft deleted item not causing errors' do
    item = create(:item)

    expect { item.restore }.not_to raise_error
  end
end
