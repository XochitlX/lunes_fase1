class CreateFlights < ActiveRecord::Migration[4.2]
  def change
    create_table :flights do |t|
      t.integer :num_flight #***
      t.date :date 
      t.time :depart
      t.string :from
      t.string :to
      t.time :duration
      t.integer :cost #***
      t.integer :passenger #***
    end

    create_table :users do |t|
    	t.string :name
      t.string :email
      t.boolean :admin, default: 0
      t.string :password
    end

    create_table :bookings do |t|
      t.belongs_to :flight, index: true
      t.integer :num_booking #***
      t.integer :total #***
    end

    create_table :user_flights do |t|
      t.belongs_to :user, index: true
      t.belongs_to :flight, index: true
    end

    create_table :user_bookings do |t|
      t.belongs_to :user, index: true
      t.belongs_to :booking, index: true
    end

  end
end
