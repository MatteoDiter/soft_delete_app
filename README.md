# Matteo Diterlizzi: Soft Delete Application

Rails application to implement "soft delete" functionality for the `Item` model, marking records as "deleted" without physically removing them from the database.

- Ruby version: v3.2.2

  - rails v7.1.2

- Other added dependencies:
  - sqlite3 v1.4 (database)
  - rspec v6.1.0 (testing)
  - factory bot rails v6.4.2 (instances factory)
  - faker v3.2.2 (instances random generator)

# Setup and testing

1. Clone the repository:
   git clone https://github.com/MatteoDiter/soft_delete_app.git

2. Install dependencies:
   bundle install

3. Run tests:
   bundle exec rspec

# Core Item model methods (app/models/item.rb)

- soft_delete: Soft deletes an item by updating the deleted_at attribute.
- restore: Restores a soft-deleted item by setting deleted_at to nil.
- default scope: Excludes soft-deleted items from normal queries.

# Instances creation with facroty bot and faker gems (specs/models/item_specs.rb, specs/factories/items.rb)

- item: Creates instances of an item with a random generate word as name attribute and nil as delete_at attribute.
- soft_deleted_item: Creates instances of an item with soft deletion property, by updating the delete_at attribute to the current time.
