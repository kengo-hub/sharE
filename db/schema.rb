# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_829_132_901) do
  create_table 'admins', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_admins_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admins_on_reset_password_token', unique: true
  end

  create_table 'artists', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'comments', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'venue_id'
    t.bigint 'event_id'
    t.bigint 'review_id'
    t.string 'content'
    t.string 'image_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_comments_on_event_id'
    t.index ['review_id'], name: 'index_comments_on_review_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
    t.index ['venue_id'], name: 'index_comments_on_venue_id'
  end

  create_table 'entries', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'room_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['room_id'], name: 'index_entries_on_room_id'
    t.index ['user_id'], name: 'index_entries_on_user_id'
  end

  create_table 'events', force: :cascade do |t|
    t.integer 'venue_id', null: false
    t.integer 'artist_id', null: false
    t.string 'name', null: false
    t.date 'event_date', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'messages', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'room_id'
    t.text 'message'
    t.string 'image_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['room_id'], name: 'index_messages_on_room_id'
    t.index ['user_id'], name: 'index_messages_on_user_id'
  end

  create_table 'notifications', force: :cascade do |t|
    t.integer 'visitor_id'
    t.integer 'visited_id'
    t.integer 'room_id'
    t.integer 'message_id'
    t.string 'action'
    t.boolean 'checked', default: false, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'relationships', force: :cascade do |t|
    t.integer 'follower_id'
    t.integer 'followed_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'reviews', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'venue_id'
    t.bigint 'event_id'
    t.string 'content'
    t.float 'rate', default: 0.0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_reviews_on_event_id'
    t.index ['user_id'], name: 'index_reviews_on_user_id'
    t.index ['venue_id'], name: 'index_reviews_on_venue_id'
  end

  create_table 'rooms', force: :cascade do |t|
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_rooms_on_user_id'
  end

  create_table 'tagmaps', force: :cascade do |t|
    t.bigint 'event_id'
    t.bigint 'artist_id'
    t.bigint 'venue_id'
    t.bigint 'tag_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['artist_id'], name: 'index_tagmaps_on_artist_id'
    t.index ['event_id'], name: 'index_tagmaps_on_event_id'
    t.index ['tag_id'], name: 'index_tagmaps_on_tag_id'
    t.index ['venue_id'], name: 'index_tagmaps_on_venue_id'
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'tag_name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'nickname', null: false
    t.boolean 'is_deleted', default: false, null: false
    t.text 'introduction'
    t.integer 'age', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'profile_image_id'
    t.integer 'sex'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'venues', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'postcode', null: false
    t.string 'address', null: false
    t.integer 'prefecture', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.float 'rate', default: 0.0, null: false
    t.string 'image_id'
    t.float 'latitude'
    t.float 'longitude'
  end
end
