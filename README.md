### [![Matteo Diterlizzi]](https://www.linkedin.com/in/matteo-diterlizzi/)

# Soft Delete Application

Rails application to implement "soft delete" functionality for the `Item` model, marking records as "deleted" without physically removing them from the database.

- Ruby version: v3.2.2

  - rails v7.1.2

- Other added dependencies:
  - sqlite3 v1.4 (database)
  - rspec v6.1.0 (testing)
  - factory bot rails v6.4.2 (instances factory)
  - faker v3.2.2 (instances attributes generator)

## Setup and testing

1. Clone the repository:
   git clone https://github.com/MatteoDiter/soft_delete_app.git

2. Install dependencies:
   bundle install

3. Run tests:
   bundle exec rspec

## Core Item model methods (app/models/item.rb)

- soft_delete: Soft deletes an item by updating the deleted_at attribute.
- restore: Restores a soft-deleted item by setting deleted_at to nil.
- default scope: Excludes soft-deleted items from normal queries.

## Instances creation with facroty bot and faker gems (spec/factories/item.rb)

- item: Creates instances of an item with a randomly generated word as name attribute and nil as deleted_at attribute.
- soft_deleted_item: Creates instances of an item with soft deletion property, by updating the deleted_at attribute to the current time.

## Testing (spec/models/item_spec.rb)

- soft deletes an item: Verifies that the soft_delete method correctly marks an item as deleted by updating its deleted_at attribute.
- restores a soft-deleted item: Validates that the restore method successfully restores a soft-deleted item by setting its deleted_at attribute to nil.
- excludes soft-deleted items from normal queries: Ensures that soft-deleted items are excluded from normal queries by checking that a soft-deleted item is not included in the result set when querying all items.
